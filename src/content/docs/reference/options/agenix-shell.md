---
title: agenix-shell

---




[agenix-shell](https://github.com/aciceri/agenix-shell) is the [agenix](https://github.com/ryantm/agenix) counterpart for `devShell`.
It provides options used to define a `shellHook` that, when added to your `devShell`, automatically decrypts secrets and export them.

[Here](https://github.com/aciceri/agenix-shell/blob/master/templates/basic/flake.nix)'s a template you can start from.


## Installation

To use these options, add to your flake inputs:

```nix
agenix-shell.url = "github:aciceri/agenix-shell";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.agenix-shell.flakeModules.default
];
```

Run `nix flake lock` and you're set.

## Options

## agenix-shell\.identityPaths {#opt-agenix-shell.identityPaths}

Path to SSH keys to be used as identities in age decryption\.



*Type:*
list of string



*Default:*

```
[
  "$HOME/.ssh/id_ed25519"
  "$HOME/.ssh/id_rsa"
]
```

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)



## agenix-shell\.secrets {#opt-agenix-shell.secrets}



Attrset of secrets\.



*Type:*
attribute set of (submodule)



*Example:*

```
{
  foo.file = "secrets/foo.age";
  bar = {
    file = "secrets/bar.age";
    mode = "0440";
  };
}

```

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)



## agenix-shell\.secrets\.\<name>\.file {#opt-agenix-shell.secrets._name_.file}



Age file the secret is loaded from\.



*Type:*
absolute path

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)



## agenix-shell\.secrets\.\<name>\.mode {#opt-agenix-shell.secrets._name_.mode}



Permissions mode of the decrypted secret in a format understood by chmod\.



*Type:*
string



*Default:*
` "0400" `

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)



## agenix-shell\.secrets\.\<name>\.name {#opt-agenix-shell.secrets._name_.name}



Name of the variable containing the secret\.



*Type:*
valid shell variable name (string matching the pattern ^\[_A-Za-z]\[_A-Za-z0-9]+$)



*Default:*
` <name> `

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)



## agenix-shell\.secrets\.\<name>\.namePath {#opt-agenix-shell.secrets._name_.namePath}



Name of the variable containing the path to the secret\.



*Type:*
valid shell variable name (string matching the pattern ^\[_A-Za-z]\[_A-Za-z0-9]+$)



*Default:*
` <name>_PATH `

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)



## perSystem\.agenix-shell\.agePackage {#opt-perSystem.agenix-shell.agePackage}



The age package to use\.



*Type:*
package



*Default:*
` pkgs.rage `

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)



## perSystem\.agenix-shell\.installationScript {#opt-perSystem.agenix-shell.installationScript}



Script that exports secrets as variables, it’s meant to be used as hook in ` devShell `s\.



*Type:*
package



*Default:*
An automatically generated package

*Declared by:*
 - [agenix-shell/flakeModules/agenix-shell\.nix](https://github.com/aciceri/agenix-shell/blob/master/flakeModules/agenix-shell.nix)

