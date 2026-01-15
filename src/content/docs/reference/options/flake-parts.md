---
title: flake-parts built in
sidebar:
  order: -2

---




These options are provided by default. They reflect what Nix expects,
plus a small number of helpful options, notably [`perSystem`](#opt-perSystem).

## Options

## debug {#opt-debug}

Whether to add the attributes ` debug `, ` allSystems ` and ` currentSystem `
to the flake output\. When ` true `, this allows inspection of options via
` nix repl `\.

```
$ nix repl
nix-repl> :lf .
nix-repl> currentSystem._module.args.pkgs.hello
«derivation /nix/store/7vf0d0j7majv1ch1xymdylyql80cn5fp-hello-2.12.1.drv»
```

Each of ` debug `, ` allSystems.<system> ` and ` currentSystem ` is an
attribute set consisting of the ` config ` attributes, plus the extra
attributes ` _module `, ` config `, ` options `, ` extendModules `\. So note that
these are not part of the ` config ` parameter, but are merged in for
debugging convenience\.

 - ` debug `: The top-level options
 - ` allSystems `: The ` perSystem ` submodule applied to the configured ` systems `\.
 - ` currentSystem `: Shortcut into ` allSystems `\. Only available in impure mode\.
   Works for arbitrary system values\.

See [Expore and debug option values](\.\./debug\.html) for more examples\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [flake-parts/modules/debug\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/debug.nix)



## flake {#opt-flake}



Raw flake output attributes\. Any attribute can be set here, but some
attributes are represented by options, to provide appropriate
configuration merging\.



*Type:*
open submodule of lazy attribute set of raw value

*Declared by:*
 - [flake-parts/extras/modules\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/modules.nix)
 - [flake-parts/extras/flakeModules\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/flakeModules.nix)
 - [flake-parts/extras/bundlers\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)
 - [flake-parts/modules/packages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/packages.nix)
 - [flake-parts/modules/overlays\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/overlays.nix)
 - [flake-parts/modules/nixosModules\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/nixosModules.nix)
 - [flake-parts/modules/nixosConfigurations\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/nixosConfigurations.nix)
 - [flake-parts/modules/legacyPackages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/legacyPackages.nix)
 - [flake-parts/modules/formatter\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/formatter.nix)
 - [flake-parts/modules/flake\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/flake.nix)
 - [flake-parts/modules/devShells\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/devShells.nix)
 - [flake-parts/modules/checks\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/checks.nix)
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## flake\.packages {#opt-flake.packages}



See ` perSystem.packages ` for description and examples\.



*Type:*
lazy attribute set of lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/packages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/packages.nix)



## flake\.apps {#opt-flake.apps}



See ` perSystem.apps ` for description and examples\.



*Type:*
lazy attribute set of lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## flake\.apps\.\<system>\.\<name>\.meta {#opt-flake.apps._system_._name_.meta}



Metadata information about the app\.
Standardized in Nix at [https://github\.com/NixOS/nix/pull/11297](https://github\.com/NixOS/nix/pull/11297)\.

Note: ` nix flake check ` is only aware of the ` description ` attribute in ` meta `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## flake\.apps\.\<system>\.\<name>\.program {#opt-flake.apps._system_._name_.program}



A path to an executable or a derivation with ` meta.mainProgram `\.



*Type:*
string or package convertible to it

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## flake\.apps\.\<system>\.\<name>\.type {#opt-flake.apps._system_._name_.type}



A type tag for ` apps ` consumers\.



*Type:*
value “app” (singular enum)



*Default:*
` "app" `

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## flake\.bundlers {#opt-flake.bundlers}



See ` perSystem.bundlers ` for description and examples\.



*Type:*
lazy attribute set of lazy attribute set of function that evaluates to a(n) package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/extras/bundlers\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)



## flake\.checks {#opt-flake.checks}



See ` perSystem.checks ` for description and examples\.



*Type:*
lazy attribute set of lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/checks\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/checks.nix)



## flake\.devShells {#opt-flake.devShells}



See ` perSystem.devShells ` for description and examples\.



*Type:*
lazy attribute set of lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/devShells\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/devShells.nix)



## flake\.flakeModule {#opt-flake.flakeModule}



Alias of ` flakeModules.default `\.



*Type:*
submodule

*Declared by:*
 - [flake-parts/extras/flakeModules\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/flakeModules.nix)



## flake\.flakeModules {#opt-flake.flakeModules}



flake-parts modules for use by other flakes\.

If the flake defines only one module, it should be ` flakeModules.default `\.

You can not read this option in defining the flake’s own ` imports `\. Instead, you can
put the module in question into its own file or let binding and reference
it both in ` imports ` and export it with this option\.

See [Dogfood a Reusable Module](\.\./dogfood-a-reusable-module\.md) for details and an example\.



*Type:*
lazy attribute set of module



*Default:*
` { } `

*Declared by:*
 - [flake-parts/extras/flakeModules\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/flakeModules.nix)



## flake\.formatter {#opt-flake.formatter}



An attribute set of per system a package used by [` nix fmt `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-fmt\.html)\.



*Type:*
lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/formatter\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/formatter.nix)



## flake\.legacyPackages {#opt-flake.legacyPackages}



See ` perSystem.legacyPackages ` for description and examples\.



*Type:*
lazy attribute set of lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/legacyPackages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/legacyPackages.nix)



## flake\.modules {#opt-flake.modules}



Groups of modules published by the flake\.

The outer attributes declare the [` class `](https://nixos\.org/manual/nixpkgs/stable/\#module-system-lib-evalModules-param-class) of the modules within it\.
The special attribute ` generic ` does not declare a class, allowing its modules to be used in any module class\.



*Type:*
lazy attribute set of lazy attribute set of module



*Example:*

````
{
  # NixOS configurations are modules with class "nixos"
  nixos = {
    # You can define a module right here:
    noBoot = { config, ... }: {
      boot.loader.enable = false;
    };
    # Or you may refer to it by file
    autoDeploy = ./nixos/auto-deploy.nix;
    # Or maybe you need both
    projectIcarus = { config, pkgs, ... }: {
      imports = [ ./nixos/project-icarus.nix ];
      services.project-icarus.package =
        withSystem pkgs.stdenv.hostPlatform.system ({ config, ... }:
          config.packages.default
        );
    };
  };
  # Flake-parts modules
  # If you're not just publishing a module, but also using it locally,
  # create a let binding to declare it before calling `mkFlake` so you can
  # use it in both places.
  flake = {
    foo = someModule;
  };
  # Modules that can be loaded anywhere
  generic = {
    my-pkgs = { _module.args.my-pkgs = …; };
  };
}

````

*Declared by:*
 - [flake-parts/extras/modules\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/modules.nix)



## flake\.nixosConfigurations {#opt-flake.nixosConfigurations}



Instantiated NixOS configurations\. Used by ` nixos-rebuild `\.

` nixosConfigurations ` is for specific machines\. If you want to expose
reusable configurations, add them to [` nixosModules `](\#opt-flake\.nixosModules)
in the form of modules (no ` lib.nixosSystem `), so that you can reference
them in this or another flake’s ` nixosConfigurations `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
{
  my-machine = inputs.nixpkgs.lib.nixosSystem {
    # system is not needed with freshly generated hardware-configuration.nix
    # system = "x86_64-linux";  # or set nixpkgs.hostPlatform in a module.
    modules = [
      ./my-machine/nixos-configuration.nix
      config.nixosModules.my-module
    ];
  };
}

```

*Declared by:*
 - [flake-parts/modules/nixosConfigurations\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/nixosConfigurations.nix)



## flake\.nixosModules {#opt-flake.nixosModules}



NixOS modules\.

You may use this for reusable pieces of configuration, service modules, etc\.



*Type:*
lazy attribute set of module



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/nixosModules\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/nixosModules.nix)



## flake\.overlays {#opt-flake.overlays}



An attribute set of [overlays](https://nixos\.org/manual/nixpkgs/stable/\#chap-overlays)\.

Note that the overlays themselves are not mergeable\. While overlays
can be composed, the order of composition is significant, but the
module system does not guarantee sufficiently deterministic
definition ordering, across versions and when changing ` imports `\.



*Type:*
lazy attribute set of function that evaluates to a(n) function that evaluates to a(n) lazy attribute set of unspecified value



*Default:*
` { } `



*Example:*

```
{
  default = final: prev: {};
}

```

*Declared by:*
 - [flake-parts/modules/overlays\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/overlays.nix)



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
 - [flake-parts/extras/partitions\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



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
 - [flake-parts/extras/partitions\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



## partitions\.\<name>\.extraInputs {#opt-partitions._name_.extraInputs}



Extra inputs to add to the inputs module argument in the partition\.

This can be used as a workaround for the fact that transitive inputs are locked in the “end user” flake\.
That’s not desirable for inputs they don’t need, such as development inputs\.



*Type:*
lazy attribute set of raw value



*Default:*
if ` extraInputsFlake ` is set, then ` builtins.getFlake extraInputsFlake `, else ` { } `

*Declared by:*
 - [flake-parts/extras/partitions\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



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
 - [flake-parts/extras/partitions\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



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
 - [flake-parts/extras/partitions\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/partitions.nix)



## perInput {#opt-perInput}



A function that pre-processes flake inputs\.

It is called for users of ` perSystem ` such that ` inputs'.${name} = config.perInput system inputs.${name} `\.

This is used for [` inputs' `](\.\./module-arguments\.html\#inputs) and [` self' `](\.\./module-arguments\.html\#self)\.

The attributes returned by the ` perInput ` function definitions are merged into a single namespace (per input),
so each module should return an attribute set with usually only one or two predictable attribute names\. Otherwise,
the ` inputs' ` namespace gets polluted\.



*Type:*
function that evaluates to a(n) function that evaluates to a(n) lazy attribute set of unspecified value

*Declared by:*
 - [flake-parts/modules/perSystem\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/perSystem.nix)



## perSystem {#opt-perSystem}



A function from system to flake-like attributes omitting the ` <system> ` attribute\.

Modules defined here have access to the suboptions and [some convenient module arguments](\.\./module-arguments\.html)\.



*Type:*
module

*Declared by:*
 - [flake-parts/extras/bundlers\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)
 - [flake-parts/modules/withSystem\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/withSystem.nix)
 - [flake-parts/modules/perSystem\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/perSystem.nix)
 - [flake-parts/modules/packages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/packages.nix)
 - [flake-parts/modules/legacyPackages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/legacyPackages.nix)
 - [flake-parts/modules/formatter\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/formatter.nix)
 - [flake-parts/modules/devShells\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/devShells.nix)
 - [flake-parts/modules/debug\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/debug.nix)
 - [flake-parts/modules/checks\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/checks.nix)
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## perSystem\.packages {#opt-perSystem.packages}



An attribute set of packages to be built by [` nix build `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-build\.html)\.

` nix build .#<name> ` will build ` packages.<name> `\.



*Type:*
lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/packages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/packages.nix)



## perSystem\.apps {#opt-perSystem.apps}



Programs runnable with nix run ` <name> `\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  default.program = "${config.packages.hello}/bin/hello";
}

```

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## perSystem\.apps\.\<name>\.meta {#opt-perSystem.apps._name_.meta}



Metadata information about the app\.
Standardized in Nix at [https://github\.com/NixOS/nix/pull/11297](https://github\.com/NixOS/nix/pull/11297)\.

Note: ` nix flake check ` is only aware of the ` description ` attribute in ` meta `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## perSystem\.apps\.\<name>\.program {#opt-perSystem.apps._name_.program}



A path to an executable or a derivation with ` meta.mainProgram `\.



*Type:*
string or package convertible to it

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## perSystem\.apps\.\<name>\.type {#opt-perSystem.apps._name_.type}



A type tag for ` apps ` consumers\.



*Type:*
value “app” (singular enum)



*Default:*
` "app" `

*Declared by:*
 - [flake-parts/modules/apps\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/apps.nix)



## perSystem\.bundlers {#opt-perSystem.bundlers}



An attribute set of bundlers to be used by [` nix bundle `](https://nix\.dev/manual/nix/latest/command-ref/new-cli/nix3-bundle\.html)\.

Bundlers are functions that accept a derivation and return a derivation\.
They package application closures into formats usable outside the Nix store\.

` nix bundle --bundler .#<name> .#<package> ` bundles ` <package> ` using bundler ` <name> `\.

Define a ` default ` bundler to use ` nix bundle --bundler .# `\.



*Type:*
lazy attribute set of function that evaluates to a(n) package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/extras/bundlers\.nix](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)



## perSystem\.checks {#opt-perSystem.checks}



Derivations to be built by [` nix flake check `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-flake-check\.html)\.



*Type:*
lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/checks\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/checks.nix)



## perSystem\.debug {#opt-perSystem.debug}



Values to return in e\.g\. ` allSystems.<system> ` when
[` debug = true `](\#opt-debug)\.



*Type:*
lazy attribute set of raw value

*Declared by:*
 - [flake-parts/modules/formatter\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/formatter.nix)



## perSystem\.devShells {#opt-perSystem.devShells}



An attribute set of packages to be used as shells\.
[` nix develop .#<name> `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-develop\.html) will run ` devShells.<name> `\.



*Type:*
lazy attribute set of package



*Default:*
` { } `



*Example:*

```
{
  default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [ wget bat cargo ];
  };
}

```

*Declared by:*
 - [flake-parts/modules/devShells\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/devShells.nix)



## perSystem\.formatter {#opt-perSystem.formatter}



A package used by [` nix fmt `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-fmt\.html)\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [flake-parts/modules/formatter\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/formatter.nix)



## perSystem\.legacyPackages {#opt-perSystem.legacyPackages}



An attribute set of unmergeable values\. This is also used by [` nix build .#<attrpath> `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-build\.html)\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [flake-parts/modules/legacyPackages\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/legacyPackages.nix)



## systems {#opt-systems}



All the system types to enumerate in the flake output subattributes\.

In other words, all valid values for ` system ` in e\.g\. ` packages.<system>.foo `\.



*Type:*
list of string

*Declared by:*
 - [flake-parts/modules/perSystem\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/perSystem.nix)



## transposition {#opt-transposition}



A helper that defines transposed attributes in the flake outputs\.

When you define ` transposition.foo = { }; `, definitions are added to the effect of (pseudo-code):

```nix
flake.foo.${system} = (perSystem system).foo;
perInput = system: inputFlake: inputFlake.foo.${system};
```

Transposition is the operation that swaps the indices of a data structure\.
Here it refers specifically to the transposition between

```plain
perSystem: .${system}.${attribute}
outputs:   .${attribute}.${system}
```

It also defines the reverse operation in [` perInput `](\#opt-perInput)\.



*Type:*
lazy attribute set of (submodule)

*Declared by:*
 - [flake-parts/modules/transposition\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/transposition.nix)



## transposition\.\<name>\.adHoc {#opt-transposition._name_.adHoc}



Whether to provide a stub option declaration for ` perSystem.<name> `\.

The stub option declaration does not support merging and lacks
documentation, so you are recommended to declare the ` perSystem.<name> `
option yourself and avoid ` adHoc `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [flake-parts/modules/transposition\.nix](https://github.com/hercules-ci/flake-parts/blob/main/modules/transposition.nix)

