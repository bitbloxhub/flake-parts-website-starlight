---
title: pkgs-by-name-for-flake-parts

---




[pkgs-by-name-for-flake-parts](https://github.com/drupol/pkgs-by-name-for-flake-parts) is a flake-parts
that can autoload Nix packages under a particular directory.

It transform a directory tree containing package files suitable for callPackage into a matching nested attribute set of derivations.
Find the documentation and example in the [manual](https://nixos.org/manual/nixpkgs/stable/index.html#function-library-lib.filesystem.packagesFromDirectoryRecursive).

Quick example how to use it:

```nix
{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # (1) add `pkgs-by-name-for-flake-parts` input
    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];

    # (2) import pkgs-by-name-for-flake-parts module
    imports = [
      inputs.pkgs-by-name-for-flake-parts.flakeModule
    ];

    perSystem = { config, self', inputs', pkgs, system, ... }: {
      # (3) point to your directory containing Nix packages
      pkgsDirectory = ./nix/pkgs-by-name;
    };
  };
}
```

## Options

## perSystem\.pkgsDirectory {#opt-perSystem.pkgsDirectory}

If set, the flake will import packages from the specified directory\.



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [pkgs-by-name-for-flake-parts/flake-module\.nix](https://github.com/drupol/pkgs-by-name-for-flake-parts/blob/main/flake-module.nix)



## perSystem\.pkgsNameSeparator {#opt-perSystem.pkgsNameSeparator}



The separator to use when flattening package names\.



*Type:*
string



*Default:*
` "/" `

*Declared by:*
 - [pkgs-by-name-for-flake-parts/flake-module\.nix](https://github.com/drupol/pkgs-by-name-for-flake-parts/blob/main/flake-module.nix)

