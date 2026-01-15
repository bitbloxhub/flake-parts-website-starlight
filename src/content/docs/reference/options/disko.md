---
title: disko

---




**Declarative disk partitioning**

Adds the `diskoConfigurations` flake output.

When using disko with Flakes, the configuration is discovered first under the [`diskoConfigurations`] flake output attribute or else from the disko module of a NixOS configuration of that name under [`nixosConfigurations`].

See [disko README](https://github.com/nix-community/disko/tree/master#readme)

[`diskoConfigurations`]: #opt-flake.diskoConfigurations
[`nixosConfigurations`]: flake-parts.html#opt-flake.nixosConfigurations


## Installation

To use these options, add to your flake inputs:

```nix
disko.url = "github:nix-community/disko";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.disko.flakeModules.default
];
```

Run `nix flake lock` and you're set.

## Options

## flake\.diskoConfigurations {#opt-flake.diskoConfigurations}

Instantiated Disko configurations\. Used by ` disko ` and ` disko-install `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
{
  my-pc = {
    disko = {
      devices = {
        disk = {
          my-disk = {
            content = {
              partitions = {
                ESP = {
                  content = {
                    format = "vfat";
                    mountOptions = [
                      "umask=0077"
                    ];
                    mountpoint = "/boot";
                    type = "filesystem";
                  };
                  size = "500M";
                  type = "EF00";
                };
                root = {
                  content = {
                    format = "ext4";
                    mountpoint = "/";
                    type = "filesystem";
                  };
                  size = "100%";
                };
              };
              type = "gpt";
            };
            device = "/dev/sda";
            type = "disk";
          };
        };
      };
    };
  };
}
```

*Declared by:*
 - [disko/flake-module\.nix](https://github.com/nix-community/disko/blob/master/flake-module.nix)

