---
title: home-manager

---




[Home Manager](https://nix-community.github.io/home-manager/) is a tool for managing home directories and user profiles using Nix.
To quote, this includes programs, configuration files, environment variables and, well… arbitrary files.

For simple setups where the Home Manager flake outputs are defined in one file, you may not need to import this module.

For more details and an example, see [Home Manager: flake-parts module](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-flake-parts-module).


## Installation

To use these options, add to your flake inputs:

```nix
home-manager.url = "github:nix-community/home-manager";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.home-manager.flakeModules.home-manager
];
```

Run `nix flake lock` and you're set.

## Options

## flake\.homeConfigurations {#opt-flake.homeConfigurations}

Instantiated Home Manager configurations\.

` homeConfigurations ` is for specific installations\. If you want to expose
reusable configurations, add them to ` homeModules ` in the form of modules, so
that you can reference them in this or another flake’s ` homeConfigurations `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [home-manager/flake-module\.nix](https://github.com/nix-community/home-manager/blob/master/flake-module.nix)



## flake\.homeModules {#opt-flake.homeModules}



Home Manager modules\.

You may use this for reusable pieces of configuration, service modules, etc\.



*Type:*
lazy attribute set of module



*Default:*
` { } `

*Declared by:*
 - [home-manager/flake-module\.nix](https://github.com/nix-community/home-manager/blob/master/flake-module.nix)

