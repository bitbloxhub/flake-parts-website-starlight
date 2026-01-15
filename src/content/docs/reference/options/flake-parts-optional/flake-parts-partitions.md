---
title: flake-parts.partitions

---




This module provides a performance optimization, and a way to reduce the size of the main `flake.lock` that is [currently](https://github.com/NixOS/nix/issues/7730) getting copied into all consuming flakes' lock files, which bothers some users.

The goals of this module are:

- **Do not load irrelevant modules** when you evaluate an attribute of an already locked flake, it . If the flake was locked remotely, the sources for those dependencies would still have to be fetched.
  This is achieved by moving some `imports` and their related definitons into [`partitions.<name>.module`](#opt-partitions._name_.module) and defining [`partitionAttrs.<attr>`](#opt-partitionedAttrs) to point to that partition.

- **Don't copy irrelevant lock entries** when you lock a flake that has the current flake as its input.
  This can be achieved by moving inputs into a subflake whose only responsibility is to provide the inputs, and then pointing [`partitions.<name>.extraInputsFlake`](#opt-partitions._name_.extraInputsFlake) to that subflake.

## Example

Definitions in the `mkFlake` root module (or a direct import into it):

```nix
partitionedAttrs.checks = "dev";
partitionedAttrs.devShells = "dev";
partitionedAttrs.herculesCI = "dev";
partitions.dev.extraInputsFlake = ./dev;
partitions.dev.module = { inputs, ... }: {
  imports = [
    ./nix/development.nix
    inputs.hercules-ci-effects.flakeModule
    inputs.git-hooks-nix.flakeModule
  ];
};
```

`dev/flake.nix`:

```nix
{
  description = "Private inputs for development purposes. These are used by the top level flake in the `dev` partition, but do not appear in consumers' lock files.";
  inputs = {
    hercules-ci-effects.url = "github:hercules-ci/hercules-ci-effects";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    # See https://github.com/ursi/get-flake/issues/4
    git-hooks-nix.inputs.nixpkgs.follows = "";
  };

  # This flake is only used for its inputs.
  outputs = { ... }: { };
}
```

## Caveats

- A module in a partition can affect options that are not exported with `partitionedAttrs`. This will have an effect that is only observable in the attributes that are exported with `partitionedAttrs`, and not in the other flake attributes. This could be useful or surprising.

- A flake used in `extraInputsFlake` is a separate flake, which means that you may have to duplicate e.g. a `nixpkgs` input for the purpose of `follows`. We don't have a way to override flake inputs after the effect.

## Explanation

`imports` must be loaded eagerly by the module system, because any module can affect the contents and shape of `config`.
Declaring `imports = [ foo ];` is simply not enough to know the effects of `foo` without getting `foo`'s attributes.

Fortunately this fundamental limitation only applies one "layer" at a time. Every submodule has its own set of modules or `imports` and that allows us to still load modules lazily, as long as we provide the means for those modules to affect the root (here: the flake) in a controlled way. That is what this module does. It loads the "optional" modules into a separate submodule, and provides an option to load parts of that (sub)module evaluation into the root.



## Installation

To use these options, add inside the `mkFlake`:


```nix
imports = [
  inputs.flake-parts.flakeModules.partitions
];
```

Run `nix flake lock` and you're set.

## Options

## partitionedAttrs {#opt-partitionedAttrs}

A set of flake output attributes that are taken from a partition instead of the default top level flake-parts evaluation\.

The attribute name refers to the flake output attribute name, and the value is the name of the partition to use\.

The flake attributes are overridden with ` lib.mkForce ` priority\.

See the ` partitions ` options to understand the purpose\.

Example: ` partitionedAttrs.devShells = "dev"; `

Equivalent: ` flake.devShells = lib.mkForce config.partitions.dev.module.flake.devShells; `



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  checks = "dev";
  devShells = "dev";
  herculesCI = "dev";
}
```

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



## partitions {#opt-partitions}



By partitioning the flake, you can avoid fetching inputs that are not
needed for the evaluation of a particular attribute\.

Each partition is a distinct module system evaluation\. This allows
attributes of the final flake to be defined by multiple sets of modules,
so that for example the ` packages ` attribute can be evaluated without
loading development related inputs\.

While the module system does a good job at preserving laziness, the fact
that a development related import can define ` packages ` means that
in order to evaluate ` packages `, you need to evaluate at least to the
point where you can conclude that the development related import does
not actually define a ` packages ` attribute\. While the actual evaluation
is cheap, it can only happen after fetching the input, which is not
as cheap\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  dev = {
    extraInputsFlake = ./dev;
    module = ./dev/flake-module.nix;
  };
}

```

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



## partitions\.\<name>\.extraInputs {#opt-partitions._name_.extraInputs}



Extra inputs to add to the inputs module argument in the partition\.

This can be used as a workaround for the fact that transitive inputs are locked in the “end user” flake\.
That’s not desirable for inputs they don’t need, such as development inputs\.



*Type:*
lazy attribute set of raw value



*Default:*
if ` extraInputsFlake ` is set, then ` builtins.getFlake extraInputsFlake `, else ` { } `

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



## partitions\.\<name>\.extraInputsFlake {#opt-partitions._name_.extraInputsFlake}



Location of a flake whose inputs to add to the inputs module argument in the partition\.
Note that flake ` follows ` are resolved without any awareness of inputs that are not in the flake\.
As a consequence, a ` follows ` entry in the flake inputs can not refer to inputs that are not in that specific flake\.

Implementation note: if the type of ` extraInputsFlake ` is a path, it is loaded with an expression-based reimplementation of ` builtins.getFlake `, as ` getFlake ` is incapable of loading paths in pure mode as of writing\.



*Type:*
raw value



*Example:*
` ./dev `

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



## partitions\.\<name>\.module {#opt-partitions._name_.module}



A re-evaluation of the flake-parts top level modules\.

You may define config definitions, ` imports `, etc here, and it can be read like any other submodule\.



*Type:*
submodule



*Default:*
` { } `



*Example:*

```
{
  imports = [
    ./dev/flake-module.nix
  ];
}

```

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)

