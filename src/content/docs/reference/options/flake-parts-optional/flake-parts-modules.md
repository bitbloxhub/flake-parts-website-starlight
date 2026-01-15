---
title: flake-parts.modules

---




This module provides a generic `modules` flake output attribute, that can host modules for any module system application.

Furthermore, it adds basic type checking so that the modules can't be imported into the wrong [class](https://nixos.org/manual/nixpkgs/stable/index.html#module-system-lib-evalModules-param-class) of configurations.
For example, if a Home Manager module would be loaded into a NixOS configuration, that becomes a simple type error, instead of a complicated message about undeclared options.

Example:

```nix
{ withSystem, ... }: {
  flake.modules.nixos.myPreferences = ./nixos/preferences.nix;
  flake.modules.nixos.myService = { pkgs, ... }: {
    imports = [ ./nixos/services/myService.nix ];
    services.myService.package =
      withSystem pkgs.stdenv.hostPlatform.system ({ config, ... }:
        config.packages.default;
      );
  };
}
```


## Installation

To use these options, add inside the `mkFlake`:


```nix
imports = [
  inputs.flake-parts.flakeModules.modules
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
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/modules.nix)



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
 - [flake-parts](https://github.com/hercules-ci/flake-parts/blob/main/extras/modules.nix)

