---
title: mission-control

---




A flake-parts module for your Nix devshell scripts.

Lets you configure commands that will be run in the repository root.

Provides an informative "message of the day" when launching your shell.

See the [Platonic-Systems/mission-control readme](https://github.com/Platonic-Systems/mission-control#readme).


## Installation

To use these options, add to your flake inputs:

```nix
mission-control.url = "github:Platonic-Systems/mission-control";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.mission-control.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.mission-control {#opt-perSystem.mission-control}

Specification for the scripts in dev shell



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.banner {#opt-perSystem.mission-control.banner}



The generated shell banner\.



*Type:*
string



*Default:*
generated package

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.devShell {#opt-perSystem.mission-control.devShell}



A devShell containing the banner and wrapper\.



*Type:*
package *(read only)*

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.scripts {#opt-perSystem.mission-control.scripts}



List of scripts to be added to the shell



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.scripts\.\<name>\.category {#opt-perSystem.mission-control.scripts._name_.category}



The category under which this script will be gropuped\.



*Type:*
string



*Default:*
` "Commands" `

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.scripts\.\<name>\.cdToProjectRoot {#opt-perSystem.mission-control.scripts._name_.cdToProjectRoot}



Whether to change the working directory to the project root
before running the script\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.scripts\.\<name>\.description {#opt-perSystem.mission-control.scripts._name_.description}



A description of what this script does\.

This will be displayed in the banner and help menu\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.scripts\.\<name>\.exec {#opt-perSystem.mission-control.scripts._name_.exec}



The script or package to run

The $FLAKE_ROOT environment variable will be set to the
project root, as determined by the github:srid/flake-root
module\.



*Type:*
string or package

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.wrapper {#opt-perSystem.mission-control.wrapper}



The generated wrapper script\.



*Type:*
package



*Default:*
generated package

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)



## perSystem\.mission-control\.wrapperName {#opt-perSystem.mission-control.wrapperName}



The name of the wrapper script



*Type:*
string



*Default:*
` "," `

*Declared by:*
 - [mission-control/nix/flake-module\.nix](https://github.com/Platonic-Systems/mission-control/blob/master/nix/flake-module.nix)

