---
title: proc-flake

---




A module for running multiple processes in a dev shell.

[honcho](https://github.com/nickstenning/honcho) is used to launch the processes.

See [proc-flake README](https://github.com/srid/proc-flake#readme)


## Installation

To use these options, add to your flake inputs:

```nix
proc-flake.url = "github:srid/proc-flake";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.proc-flake.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.proc {#opt-perSystem.proc}

Configuration for processes to run in the development environment\.



*Type:*
submodule

*Declared by:*
 - [proc-flake/flake-module\.nix](https://github.com/srid/proc-flake/blob/master/flake-module.nix)



## perSystem\.proc\.groups {#opt-perSystem.proc.groups}



Process groups that can be invoked individually\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [proc-flake/flake-module\.nix](https://github.com/srid/proc-flake/blob/master/flake-module.nix)



## perSystem\.proc\.groups\.\<name>\.package {#opt-perSystem.proc.groups._name_.package}



The package to use to run the given process group\.



*Type:*
package

*Declared by:*
 - [proc-flake/flake-module\.nix](https://github.com/srid/proc-flake/blob/master/flake-module.nix)



## perSystem\.proc\.groups\.\<name>\.processes {#opt-perSystem.proc.groups._name_.processes}



Processes to run simultaneously when running this group\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [proc-flake/flake-module\.nix](https://github.com/srid/proc-flake/blob/master/flake-module.nix)



## perSystem\.proc\.groups\.\<name>\.processes\.\<name>\.command {#opt-perSystem.proc.groups._name_.processes._name_.command}



The command to run the given process\.



*Type:*
string

*Declared by:*
 - [proc-flake/flake-module\.nix](https://github.com/srid/proc-flake/blob/master/flake-module.nix)

