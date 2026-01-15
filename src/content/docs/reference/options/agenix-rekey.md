---
title: agenix-rekey

---




This is an extension for [agenix](https://github.com/ryantm/agenix) which allows you to get
rid of maintaining a `secrets.nix` file by automatically re-encrypting secrets where needed.
It also allows you to define versatile generators for secrets, so they can be bootstrapped
automatically. This can be used alongside regular use of agenix.

Please also refer to the upstream [installation section](https://github.com/oddlama/agenix-rekey?tab=readme-ov-file#installation)
and [usage guide](https://github.com/oddlama/agenix-rekey?tab=readme-ov-file#usage) for
information on how to access the wrapper utility in a devshell and how to setup your
hosts to make use of agenix-rekey.


## Installation

To use these options, add to your flake inputs:

```nix
agenix-rekey.url = "github:oddlama/agenix-rekey";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.agenix-rekey.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## flake\.agenix-rekey {#opt-flake.agenix-rekey}

The agenix-rekey apps specific to your flake\. Used by the ` agenix ` wrapper script,
and can be run manually using ` nix run .#agenix-rekey.$system.<app> `\.



*Type:*
lazy attribute set of lazy attribute set of package *(read only)*



*Default:*
` "Automatically filled by agenix-rekey" `

*Declared by:*
 - [agenix-rekey/flake-module\.nix](https://github.com/oddlama/agenix-rekey/blob/main/flake-module.nix)



## perSystem\.agenix-rekey\.package {#opt-perSystem.agenix-rekey.package}



The agenix-rekey wrapper script ` agenix `\.
We recommend adding this to your devshell so you can execute it easily\.
By using the package provided here, you can skip adding the overlay to your pkgs\.
Alternatively you can also pass it to your flake outputs (apps or packages)\.



*Type:*
package *(read only)*



*Default:*
` "<agenix script derivation from agenix-rekey>" `

*Declared by:*
 - [agenix-rekey/flake-module\.nix](https://github.com/oddlama/agenix-rekey/blob/main/flake-module.nix)



## perSystem\.agenix-rekey\.agePackage {#opt-perSystem.agenix-rekey.agePackage}



The rage package to use\. Determines the age package used for encrypting / decrypting\.
Defaults to ` pkgs.rage `\. We only guarantee compatibility with
` pkgs.age ` and ` pkgs.rage `\.



*Type:*
package



*Default:*
` pkgs.rage `

*Declared by:*
 - [agenix-rekey/flake-module\.nix](https://github.com/oddlama/agenix-rekey/blob/main/flake-module.nix)



## perSystem\.agenix-rekey\.collectHomeManagerConfigurations {#opt-perSystem.agenix-rekey.collectHomeManagerConfigurations}



Whether to collect home manager configurations automatically from specified NixOS configurations\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [agenix-rekey/flake-module\.nix](https://github.com/oddlama/agenix-rekey/blob/main/flake-module.nix)



## perSystem\.agenix-rekey\.homeConfigurations {#opt-perSystem.agenix-rekey.homeConfigurations}



All home manager configurations that should be considered for rekeying\.



*Type:*
lazy attribute set of unspecified value



*Default:*
` lib.filterAttrs (_: x: x.config ? age) (self.homeConfigurations or { }) `

*Declared by:*
 - [agenix-rekey/flake-module\.nix](https://github.com/oddlama/agenix-rekey/blob/main/flake-module.nix)



## perSystem\.agenix-rekey\.nixosConfigurations {#opt-perSystem.agenix-rekey.nixosConfigurations}



All nixosSystems that should be considered for rekeying\.



*Type:*
lazy attribute set of unspecified value



*Default:*
` lib.filterAttrs (_: x: x.config ? age) self.nixosConfigurations `

*Declared by:*
 - [agenix-rekey/flake-module\.nix](https://github.com/oddlama/agenix-rekey/blob/main/flake-module.nix)



## perSystem\.agenix-rekey\.pkgs {#opt-perSystem.agenix-rekey.pkgs}



The package set to use when defining agenix-rekey scripts\.



*Type:*
unspecified value



*Default:*
` pkgs # (module argument) `

*Declared by:*
 - [agenix-rekey/flake-module\.nix](https://github.com/oddlama/agenix-rekey/blob/main/flake-module.nix)

