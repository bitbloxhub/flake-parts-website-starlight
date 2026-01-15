---
title: flake-parts.easyOverlay

---




## WARNING

This module does NOT make _consuming_ an overlay easy. This module is intended for _creating_ overlays.
While it is possible to consume the overlay created by this module using the `final` module argument, this is somewhat unconventional. Instead:

- _Avoid_ overlays. Many flakes can do without them.
- Initialize `pkgs` yourself:
  ```
  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.foo.overlays.default
        (final: prev: {
          # ... things you really need to patch ...
        })
      ];
      config = { };
    };
  };
  ```

## Who this is for

This module is for flake authors who need to provide a simple overlay in addition to the common flake attributes. It is not for users who want to consume an overlay.

## What it actually does

This module overrides the `pkgs` module argument and provides the `final` module argument so that the `perSystem` module can be evaluated as an overlay. Attributes added by the overlay must be defined in `overlayAttrs`. The resulting overlay is defined in the `overlays.default` output.

The resulting behavior tends to be not 100% idiomatic. A hand-written overlay would usually use `final` more often, but nonetheless it gets the job done for simple use cases; certainly the simple use cases where overlays aren't strictly necessary.

## The status of this module

It has an unfortunate name and may be renamed. Alternatively, its functionality may be moved out of flake-parts, into some Nixpkgs module. Certainly until then, feel free to use the module if you understand what it does.


## Installation

To use these options, add inside the `mkFlake`:


```nix
imports = [
  inputs.flake-parts.flakeModules.easyOverlay
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem {#opt-perSystem}

A function from system to flake-like attributes omitting the ` <system> ` attribute\.

Modules defined here have access to the suboptions and [some convenient module arguments](\.\./module-arguments\.html)\.



*Type:*
module

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/easyOverlay.nix)



## perSystem\.overlayAttrs {#opt-perSystem.overlayAttrs}



Attributes to add to ` overlays.default `\.

The ` overlays.default ` overlay will re-evaluate ` perSystem ` with
the “prev” (or “super”) overlay argument value as the ` pkgs ` module
argument\. The ` easyOverlay ` module also adds the ` final ` module
argument, for the result of applying the overlay\.

When not in an overlay, ` final ` defaults to ` pkgs ` plus the generated
overlay\. This requires Nixpkgs to be re-evaluated, which is more
expensive than setting ` pkgs ` to a Nixpkgs that already includes
the necessary overlays that are required for the flake itself\.

See [Overlays](\.\./overlays\.html)\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/easyOverlay.nix)

