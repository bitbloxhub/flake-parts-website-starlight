---
title: nix-topology

---




With nix-topology you can automatically generate infrastructure and network diagrams as SVGs
directly from your NixOS configurations, and get something similar to the diagram [here](https://github.com/oddlama/nix-topology#readme).
It defines a new global module system where you can specify what nodes and networks you have.
Most of the work is done by the included NixOS module which automatically collects all the
information from your hosts.

After including this flake-parts module, you can build your diagram by running `nix build .#topology.<current-system>.config.output`.


## Installation

To use these options, add to your flake inputs:

```nix
nix-topology.url = "github:oddlama/nix-topology";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.nix-topology.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## flake\.topology {#opt-flake.topology}

The evaluated topology configuration, for each of the specified systems\.
Build the output by running ` nix build .#topology.$system.config.output `\.



*Type:*
lazy attribute set of unspecified value *(read only)*



*Default:*
` "Automatically filled by nix-topology" `

*Declared by:*
 - [nix-topology/flake-module\.nix](https://github.com/oddlama/nix-topology/blob/main/flake-module.nix)



## perSystem\.topology\.modules {#opt-perSystem.topology.modules}



A list of additional topology modules to evaluate in your global topology\.



*Type:*
list of unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [nix-topology/flake-module\.nix](https://github.com/oddlama/nix-topology/blob/main/flake-module.nix)



## perSystem\.topology\.nixosConfigurations {#opt-perSystem.topology.nixosConfigurations}



All nixosSystems that should be evaluated for topology definitions\.



*Type:*
lazy attribute set of unspecified value



*Default:*
` lib.filterAttrs (_: x: x.config ? topology) self.nixosConfigurations `

*Declared by:*
 - [nix-topology/flake-module\.nix](https://github.com/oddlama/nix-topology/blob/main/flake-module.nix)



## perSystem\.topology\.pkgs {#opt-perSystem.topology.pkgs}



The package set to use for the topology evaluation on this system\.



*Type:*
unspecified value



*Default:*
` pkgs # (module argument) `

*Declared by:*
 - [nix-topology/flake-module\.nix](https://github.com/oddlama/nix-topology/blob/main/flake-module.nix)

