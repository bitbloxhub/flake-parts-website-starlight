---
title: flake-parts.bundlers

---




Adds the `bundlers` flake output attribute.

Use [`nix bundle`](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-bundle.html) to create self-contained executables from derivations.

Example:

```nix
perSystem = { pkgs, ... }: {
  bundlers.default = drv:
    pkgs.runCommand "bundle-${drv.name}" { } ''
      mkdir -p $out
      cp -r ${drv}/* $out/
    '';
};
```

Then run `nix bundle --bundler .# nixpkgs#hello` to bundle `hello` using your default bundler.


## Installation

To use these options, add inside the `mkFlake`:


```nix
imports = [
  inputs.flake-parts.flakeModules.bundlers
];
```

Run `nix flake lock` and you're set.

## Options

## flake {#opt-flake}

Raw flake output attributes\. Any attribute can be set here, but some
attributes are represented by options, to provide appropriate
configuration merging\.



*Type:*
open submodule of lazy attribute set of raw value

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)



## flake\.bundlers {#opt-flake.bundlers}



See ` perSystem.bundlers ` for description and examples\.



*Type:*
lazy attribute set of lazy attribute set of function that evaluates to a(n) package



*Default:*
` { } `

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)



## perSystem {#opt-perSystem}



A function from system to flake-like attributes omitting the ` <system> ` attribute\.

Modules defined here have access to the suboptions and [some convenient module arguments](\.\./module-arguments\.html)\.



*Type:*
module

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)



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
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/bundlers.nix)

