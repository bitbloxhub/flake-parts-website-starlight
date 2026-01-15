---
title: mkdocs-flake

---




[mkdocs-flake](https://applicative-systems.github.io/mkdocs-flake/) adds documentation targets for your project [mkdocs](https://www.mkdocs.org/) documentation.
The provided mkdocs distribution comes pre-packaged with the latest [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) and many useful plugins.

After integration, run `nix build .#documentation` to build your documentation.
To serve the documentation locally with live-rebuilds, run `nix run .#watch-documentation`

Quick example how to integrate it into a flake:

```nix
{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # (1) add mkdocs-flake input
    mkdocs-flake.url = "github:applicative-systems/mkdocs-flake";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    # (2) import mkdocs-flake module
    imports = [
      inputs.mkdocs-flake.flakeModules.default
    ];
    systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
    perSystem = { config, self', inputs', pkgs, system, ... }: {
      packages.default = pkgs.hello;

      # (3) point mkdocs-flake to your mkdocs root folder
      documentation.mkdocs-root = ./docs;

      # (4) Build the docs:
      #     `nix build .#documentation`
      #     Run in watch mode for live-editing-rebuilding:
      #     `nix run .#watch-documentation`
    };
  };
}
```

For more information, please refer to the [mkdocs-flake documentation: flake.parts integration](https://applicative-systems.github.io/mkdocs-flake/integration/flake-parts.html).


## Installation

To use these options, add to your flake inputs:

```nix
mkdocs-flake.url = "github:applicative-systems/mkdocs-flake";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.mkdocs-flake.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.documentation\.mkdocs-package {#opt-perSystem.documentation.mkdocs-package}

The mkdocs package to use\.



*Type:*
package



*Default:*
` "mkdocs-flake.packages.\${system}.mkdocs" `

*Declared by:*
 - [mkdocs-flake/modules/documentation\.nix](https://github.com/applicative-systems/mkdocs-flake/blob/main/modules/documentation.nix)



## perSystem\.documentation\.mkdocs-root {#opt-perSystem.documentation.mkdocs-root}



Path to your mkdocs documentation project with mkdocs\.yml\. Relative from your flake\.nix\.



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` "./documentation" `

*Declared by:*
 - [mkdocs-flake/modules/documentation\.nix](https://github.com/applicative-systems/mkdocs-flake/blob/main/modules/documentation.nix)



## perSystem\.documentation\.strict {#opt-perSystem.documentation.strict}



Whether to enable Build the documentation with ` --strict `

See also [mkdocs user guide about ` --strict `](https://www\.mkdocs\.org/user-guide/configuration/\#strict)

\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [mkdocs-flake/modules/documentation\.nix](https://github.com/applicative-systems/mkdocs-flake/blob/main/modules/documentation.nix)

