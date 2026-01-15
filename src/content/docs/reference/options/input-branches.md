---
title: input-branches

---




Apply changes to a flake input by importing its branch and using it as a Git submodule 🤯

## Background

Sometimes, a project can be used as a flake input as-is,
but often, we want to apply changes to it prior to consumption.
[Nix does not yet provide a feature of seamless application of patches to flake inputs](https://github.com/NixOS/nix/issues/3920).
This project defines a workflow for applying changes to an input
by importing its branch into our repository
and referring to that branch via path that points to a Git submodule.
Commands that support this workflow are provided via
[via flake-parts options](https://flake.parts/options/input-branches.html).

## Benefits

- 🐬 single-repo setup; more self-contained, less to keep track of

- 💃 no artificial committing/pushing during development

- 🕺 no typing `--override-input` and no accidentally omitting it

- ⚡ provided scripts save time and improve consistency

- 🧚‍♀️ optional shallow import extra useful for inputs with huge history such as Nixpkgs

## The setup

1. ⬇️ _import the upstream branch_ into our project's own repository.
   For example, we can import the upstream `nixpkgs-unstable` branch as `inputs/main/nixpkgs` in our repository.
   Repositories with huge histories such as Nixpkgs should be fetched shallowly
   and imported into a single artificial commit.

2. add our repository at that branch as a Git submodule to our repository 💡.
   For example, at the path `inputs/nixpkgs`. Our `.gitmodules` will include:

   ```
   [submodule "inputs/nixpkgs"]
     path = inputs/nixpkgs
     url = ./.
   ```

3. point the input url to that path:

   ```nix
   inputs.nixpkgs.url = "./inputs/nixpkgs";
   ```

4. Declare `inputs.self.submodules = true`.
   Otherwise, referring to the flake via path (e.g. `nix build .`)
   would result in submodules being omitted.
   It seems that Nix does not support `.?submodules=true`.

## Constraints 🪢

### Minimal Nix version 🔖

The minimal Nix version is `2.27.0`
because [that is the version that introduced `inputs.self.submodules`](https://nix.dev/manual/nix/2.27/release-notes/rl-2.27.html).

### Git fetching only 🐢

Since submodules need to be fetched,
the project can be fetched only as a Git repository.
For example it cannot be referred to as `github:mightyiam/infra` (tarball fetching).
It must referred to as `git+https://github.com/mightyiam/infra` or similar instead.

### The input must be `flake = true` ❄️

It seems that an input that is referred to
by relative path inside the superproject (e.g. `./inputs/nixpkgs`)
and is a Git submodule and is `flake = false`
ends up being equivalent to `self`, which would be incorrect.
So input-branch inputs must be `flake = true` (which is the default).
Also, a `flake.nix` must exist.

## Costs 💸

### Git submodules overhead 🤹‍♂️

Just the usual overhead associated with Git submodules,
such as `$ git submodule init` and `$ git submodule update`.

### Superproject must be dirty 🧹

It seems that when the superproject state is clean,
submodules that are referred to by path will be fetched via Git 🤕.
Workaround: `$ touch dirt; git add -N dirt`
This was reported as [issue 13324](https://github.com/NixOS/nix/issues/13324).

### Forge push limits 🚫

Inputs with huge histories should be handled shallowly.
Otherwise, one might (with Nixpkgs will) hit forge push limits such as
[GitHub's](https://docs.github.com/en/get-started/using-git/troubleshooting-the-2-gb-push-limit).
But if you insist, this can typically be worked around by chunking.

### Input branches must be pushed 🫸

Since our project now depends on multiple branches,
we must ensure that in addition to pushing the usual branch,
we also push the input branch.

### Tools must consider foreign code 🛠️

Since we now have input code under `./inputs`,
we must consider this path in the usage of tools such as linters and formatters.

### NixOS issues and workarounds

> [!IMPORTANT]
> This workflow causes/surfaces the following issues with NixOS.
> A NixOS module that mitigates these issues is provided
> as `#modules.nixos.default`.

#### Git metadata in NixOS derivations 🏷️

By default NixOS uses git metadata in some derivations.
This may be useful under normal circumstances,
but when Nixpkgs is a Git submodule that is referred to by path,
then the git metadata is no longer of the Nixpkgs repository, but of the superproject.
This unintended consequence also results in more frequent/noisy NixOS derivation change.

The provided NixOS module disables the use of Git metadata;
It removes the `nixos-version` command
and replaces the Nixpkgs revision that is by default included in boot entry labels
with `no_git_metadata`.

#### `nixpkgs.flake.source`

By default the NixOS option `nixpkgs.flake.source` is set to `self.outPath`.
This may be useful under normal circumstances,
but when Nixpkgs is a Git submodule that is referred to by path,
it results in the supreproject being part of the NixOS derivation,
which is unacceptable because _any edit_ would result in a NixOS system change.
The provided NixOS module sets this option to `null`,
which results in the removal of Nixpkgs from the system flake registry.
If you want Nixpkgs in the system flake registry
you may override this option to a path of your Nixpkgs submodule path
(possibly `lib.mkForce ../inputs/nixpkgs` or similar).

### Increase in repository size 🦛

Importing of foreign branches results in storage of foreign objects,
increasing repository size.
This can be mitigated by importing shallowly.


## Installation

To use these options, add to your flake inputs:

```nix
input-branches.url = "github:mightyiam/input-branches";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.input-branches.flakeModules.default
];
```

Run `nix flake lock` and you're set.

## Options

## input-branches\.baseDir {#opt-input-branches.baseDir}

Directory relative to Git top-level for git submodules\.



*Type:*
string *(read only)*



*Default:*
` "inputs" `

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## input-branches\.inputs {#opt-input-branches.inputs}



Input branch definitions\.
Each attribute name must correspond to an existing flake input\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` "{ }" `



*Example:*

```
{
  nixpkgs = {
    upstream = {
      url = "https://github.com/NixOS/nixpkgs.git";
      ref = "nixpkgs-unstable";
    };
    shallow = true;
  };
  home-manager.upstream = {
    url = "https://github.com/nix-community/home-manager.git";
    ref = "master";
  };
}

```

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## input-branches\.inputs\.\<name>\.name {#opt-input-branches.inputs._name_.name}



Name of input\.
A flake input by this name must exist\.



*Type:*
string *(read only)*



*Default:*
` <name> `



*Example:*
` "flake-parts" `

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## input-branches\.inputs\.\<name>\.path_ {#opt-input-branches.inputs._name_.path_}



path of submodule relative to Git top-level



*Type:*
string *(read only)*



*Default:*
` inputs/<name> `

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## input-branches\.inputs\.\<name>\.shallow {#opt-input-branches.inputs._name_.shallow}



Useful for an input with huge history, such as Nixpkgs\.
Fetching occurs with ` --depth 1 `\.
The input branch is initialized with a single, artificial, initial commit\.
The commit message includes the original upstream rev\.
Prior to rebasing such a commit is recreated\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## input-branches\.inputs\.\<name>\.upstream\.name {#opt-input-branches.inputs._name_.upstream.name}



remote upstream name



*Type:*
string *(read only)*



*Default:*
` "upstream" `

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## input-branches\.inputs\.\<name>\.upstream\.ref {#opt-input-branches.inputs._name_.upstream.ref}



ref of the upstream Git repo



*Type:*
string



*Example:*
` "master" `

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## input-branches\.inputs\.\<name>\.upstream\.url {#opt-input-branches.inputs._name_.upstream.url}



remote URL of the upstream Git repo



*Type:*
string



*Example:*
` "https://github.com/nix-community/stylix.git" `

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## perSystem\.input-branches\.commands\.all {#opt-perSystem.input-branches.commands.all}



a list of all of the commands, for convenience



*Type:*
list of package *(read only)*

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## perSystem\.input-branches\.commands\.init {#opt-perSystem.input-branches.commands.init}



A list of ` input-branch-init-<INPUT> ` commands
that attempt to initialize ` INPUT `\.
For example:

```
$ input-branch-init-nixpkgs
```

And you end up with a git submodule at the configured path\.
It inherited the remote of the remote tracking branch of the current branch\.
It has an upstream remote according to configuration\.
The configured branch is checked out
and its HEAD set to the rev that the corresponding flake input is locked to\.
The input url can be set to use it:

```nix
{
  inputs.flake-parts.url = "./inputs/nixpkgs";
}
```

An additional command ` input-branches-init ` invokes all of these in sequence\.



*Type:*
list of package *(read only)*

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## perSystem\.input-branches\.commands\.push-force {#opt-perSystem.input-branches.commands.push-force}



a list of ` input-branch-push-force-<INPUT> ` commands
that push with ` --force ` the configured branch of ` INPUT `

An additional command ` input-branches-push-force ` invokes all of these in sequence\.



*Type:*
list of package *(read only)*

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)



## perSystem\.input-branches\.commands\.rebase {#opt-perSystem.input-branches.commands.rebase}



a list of ` input-branch-rebase-<INPUT> ` commands
that attempt to rebase ` INPUT `

An additional command ` input-branches-rebase ` invokes all of these in sequence\.



*Type:*
list of package *(read only)*

*Declared by:*
 - [input-branches/modules/flake-module\.nix, via option flake\.flakeModules\.default](https://github.com/mightyiam/input-branches/blob/main/modules/flake-module.nix, via option flake.flakeModules.default)

