---
title: nix-bindings-rust

---




A small support module that takes care of the `nix-bindings-rust` dependency in `nix-cargo-integration` projects.

- Provides a module that configures the Nix dependency
- Provides `checks.<system>.dependency-nix-bindings-*` to ensure that tests are run

See [the README](https://github.com/nixops4/nix-bindings-rust#readme).


## Installation

To use these options, add to your flake inputs:

```nix
nix-bindings-rust.url = "github:nixops4/nix-bindings-rust";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.nix-bindings-rust.modules.flake.default
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.nix-bindings-rust\.nciBuildConfig {#opt-perSystem.nix-bindings-rust.nciBuildConfig}

A module to load into your nix-cargo-integration
[` perSystem.nci.projects.<name>.depsDrvConfig `](https://flake\.parts/options/nix-cargo-integration\.html\#opt-perSystem\.nci\.projects\._name_\.depsDrvConfig) or similar such options\.

This provides common build configuration (pkg-config, libclang, etc\.) and
automatically adds Nix C library build inputs based on which nix-bindings
crates are *direct* dependencies of your crate\.

To disable automatic build input detection:

```nix
nix-bindings-rust.inputPropagationWorkaround.enable = false;
```

Example:

```nix
perSystem = perSystem@{ config, ... }: {
  nci.projects."my_project".drvConfig = {
    imports = [ perSystem.config.nix-bindings-rust.nciBuildConfig ];
  };
}
```



*Type:*
module

*Declared by:*
 - [nix-bindings-rust/flake\.nix](https://github.com/nixops4/nix-bindings-rust/blob/master/flake.nix)



## perSystem\.nix-bindings-rust\.nixPackage {#opt-perSystem.nix-bindings-rust.nixPackage}



The Nix package to use when building the ` nix-bindings-... ` crates\.



*Type:*
package



*Default:*
pkgs\.nix

*Declared by:*
 - [nix-bindings-rust/flake\.nix](https://github.com/nixops4/nix-bindings-rust/blob/master/flake.nix)

