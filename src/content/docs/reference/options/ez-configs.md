---
title: ez-configs

---




[`ez-configs`](https://github.com/ehllie/ez-configs) lets you define multiple nixos,
darwin, and home manager configurations, and reuse common modules using your flake directory structure.


## Installation

To use these options, add to your flake inputs:

```nix
ez-configs.url = "github:ehllie/ez-configs";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.ez-configs.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## ezConfigs\.darwin\.configurationEntryPoint {#opt-ezConfigs.darwin.configurationEntryPoint}

Entry point file for darwinConfigurations\.



*Type:*
string



*Default:*
` "default.nix" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.darwin\.configurationsDirectory {#opt-ezConfigs.darwin.configurationsDirectory}



The directory containing darwinConfigurations\.



*Type:*
absolute path



*Default:*
` "${ezConfigs.root}/darwin-configurations" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.darwin\.earlyModuleArgs {#opt-ezConfigs.darwin.earlyModuleArgs}



Extra arguments to pass to all darwinModules before exporting them\.



*Type:*
attribute set of anything



*Default:*
` ezConfigs.earlyModuleArgs `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.darwin\.hosts {#opt-ezConfigs.darwin.hosts}



Settings for creating darwinConfigurations\.

It’s not neccessary to specify this option to create flake outputs\.
It’s only needed if you want to change the defaults for specific darwinConfigurations\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  hostA = {
    userHomeModules = [ "bob" ];
  };

  hostB = {
    importDefault = false;
    arch = "aarch64
  };
}

```

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.darwin\.hosts\.\<name>\.importDefault {#opt-ezConfigs.darwin.hosts._name_.importDefault}



Whether to import the default module for this host\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.darwin\.hosts\.\<name>\.userHomeModules {#opt-ezConfigs.darwin.hosts._name_.userHomeModules}



List or attribute set of users in ${ezConfigs\.hm\.usersDirectory},
whose comfigurations to import as home manager darwinModules\.
If it’s a list, each user is assumed to have the same name as the homeModule\.
You can override this by using an attribute set, where the attribute name
is the name of the host user, while value is the name of the homeModule\.
They will be put inside ` home-manager.${user}.imports ` list for this host\.

When this option is set, the ` home-manager.extraSpecialArgs ` option
is also set to the one it would recieve in homeManagerConfigurations
output, and the appropriate homeManager module is imported\.



*Type:*
(list of string) or attribute set of string



*Default:*
` [ ] `



*Example:*

```
{ 
  alice = "alice-minimal";
  bob = "bob-full";
}

```

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.darwin\.modulesDirectory {#opt-ezConfigs.darwin.modulesDirectory}



The directory containing darwinModules\.



*Type:*
absolute path



*Default:*
` "${ezConfigs.root}/darwin-modules" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.darwin\.specialArgs {#opt-ezConfigs.darwin.specialArgs}



Extra arguments to pass to all darwinConfigurations\.



*Type:*
attribute set of anything



*Default:*
` ezConfigs.globalArgs `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.earlyModuleArgs {#opt-ezConfigs.earlyModuleArgs}



Extra arguments to pass to all modules before exporting them\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*
` { inherit inputs; } `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.globalArgs {#opt-ezConfigs.globalArgs}



Extra arguments to pass to all configurations\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*
` { inherit inputs; } `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.configurationEntryPoint {#opt-ezConfigs.home.configurationEntryPoint}



Entry point file for homeConfigurations\.



*Type:*
string



*Default:*
` "default.nix" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.configurationsDirectory {#opt-ezConfigs.home.configurationsDirectory}



The directory containing homeConfigurations\.



*Type:*
absolute path



*Default:*
` "${ezConfigs.root}/home-configurations" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.earlyModuleArgs {#opt-ezConfigs.home.earlyModuleArgs}



Extra arguments to pass to all homeModules before exporting them\.



*Type:*
attribute set of anything



*Default:*
` ezConfigs.earlyModuleArgs `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.extraSpecialArgs {#opt-ezConfigs.home.extraSpecialArgs}



Extra arguments to pass to all homeConfigurations\.



*Type:*
attribute set of anything



*Default:*
` ezConfigs.globalArgs `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.modulesDirectory {#opt-ezConfigs.home.modulesDirectory}



The directory containing homeModules\.



*Type:*
absolute path



*Default:*
` "${ezConfigs.root}/home-modules" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.users {#opt-ezConfigs.home.users}



Settings for creating homeConfigurations\.

It’s not neccessary to specify this option to create flake outputs\.
It’s only needed if you want to change the defaults for specific homeConfigurations\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  alice = {
    standalone = {
      enable = true;
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    };
  };

  bob = {
    importDefault = false;
  };
}

```

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.users\.\<name>\.importDefault {#opt-ezConfigs.home.users._name_.importDefault}



Whether to import the default module for this user\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.users\.\<name>\.nameFunction {#opt-ezConfigs.home.users._name_.nameFunction}



Function to generate the name of the user configuration using the host name\.



*Type:*
null or (function that evaluates to a(n) string)



*Default:*
` ${username}@${hostname} `



*Example:*
` (host: "${host}-${name})") `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.users\.\<name>\.passInOsConfig {#opt-ezConfigs.home.users._name_.passInOsConfig}



Whether to pass the osConfig argument to extraSpecialArgs\.
This will be the nixosConfiguration\.config or darwinConfiguration\.config,
whose pkgs are being used to build this homeConfiguration\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.users\.\<name>\.standalone\.enable {#opt-ezConfigs.home.users._name_.standalone.enable}



Whether to create a standalone user configuration\.

By default each user and host pair gets its own homeConfigurations attribute,
and the pkgs passed into homeConfiguration function come from that system\.

This will prevent the ${user}@${host} outputs from being created\.
Instead a standalone user configuration will be created with user name\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.home\.users\.\<name>\.standalone\.pkgs {#opt-ezConfigs.home.users._name_.standalone.pkgs}



The package set with which to construct the homeManagerConfiguration\.

Non standalone user configurations will use the package set of the host system\.



*Type:*
Nixpkgs package set



*Example:*
` import nixpkgs {system = "x86_64-linux"} `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.configurationEntryPoint {#opt-ezConfigs.nixos.configurationEntryPoint}



Entry point file for nixosConfigurations\.



*Type:*
string



*Default:*
` "default.nix" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.configurationsDirectory {#opt-ezConfigs.nixos.configurationsDirectory}



The directory containing nixosConfigurations\.



*Type:*
absolute path



*Default:*
` "${ezConfigs.root}/nixos-configurations" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.earlyModuleArgs {#opt-ezConfigs.nixos.earlyModuleArgs}



Extra arguments to pass to all nixosModules before exporting them\.



*Type:*
attribute set of anything



*Default:*
` ezConfigs.earlyModuleArgs `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.hosts {#opt-ezConfigs.nixos.hosts}



Settings for creating nixosConfigurations\.

It’s not neccessary to specify this option to create flake outputs\.
It’s only needed if you want to change the defaults for specific nixosConfigurations\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  hostA = {
    userHomeModules = [ "bob" ];
  };

  hostB = {
    importDefault = false;
    arch = "aarch64
  };
}

```

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.hosts\.\<name>\.importDefault {#opt-ezConfigs.nixos.hosts._name_.importDefault}



Whether to import the default module for this host\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.hosts\.\<name>\.userHomeModules {#opt-ezConfigs.nixos.hosts._name_.userHomeModules}



List or attribute set of users in ${ezConfigs\.hm\.usersDirectory},
whose comfigurations to import as home manager nixosModules\.
If it’s a list, each user is assumed to have the same name as the homeModule\.
You can override this by using an attribute set, where the attribute name
is the name of the host user, while value is the name of the homeModule\.
They will be put inside ` home-manager.${user}.imports ` list for this host\.

When this option is set, the ` home-manager.extraSpecialArgs ` option
is also set to the one it would recieve in homeManagerConfigurations
output, and the appropriate homeManager module is imported\.



*Type:*
(list of string) or attribute set of string



*Default:*
` [ ] `



*Example:*

```
{ 
  alice = "alice-minimal";
  bob = "bob-full";
}

```

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.modulesDirectory {#opt-ezConfigs.nixos.modulesDirectory}



The directory containing nixosModules\.



*Type:*
absolute path



*Default:*
` "${ezConfigs.root}/nixos-modules" `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.nixos\.specialArgs {#opt-ezConfigs.nixos.specialArgs}



Extra arguments to pass to all nixosConfigurations\.



*Type:*
attribute set of anything



*Default:*
` ezConfigs.globalArgs `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)



## ezConfigs\.root {#opt-ezConfigs.root}



The root from which configurations and modules should be searched\.



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` ./. `

*Declared by:*
 - [ez-configs/flake-module\.nix](https://github.com/ehllie/ez-configs/blob/main/flake-module.nix)

