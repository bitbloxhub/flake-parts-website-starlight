---
title: flake-parts.flakeModules

---




Adds the `flakeModules` attribute and `flakeModule` alias.

This module makes deduplication and `disabledModules` work, even if the definitions are inline modules or [`importApply`](../define-module-in-separate-file.html#importapply).


## Installation

To use these options, add inside the `mkFlake`:


```nix
imports = [
  inputs.flake-parts.flakeModules.flakeModules
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
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/flakeModules.nix)



## flake\.flakeModule {#opt-flake.flakeModule}



Alias of ` flakeModules.default `\.



*Type:*
submodule

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/flakeModules.nix)



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
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/flakeModules.nix)

