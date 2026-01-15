---
title: make-shell

---




Modules for mkShell!  Set `make-shells.<name>` attributes to create `devShells.<name>` and `checks.<name>-devshell` flake outputs.  Import and merge complex or shared modules!  Create and share new options!

For example:
```nix
# aliases.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  options.aliases = lib.mkOption {
    type = lib.types.attrsOf lib.types.singleLineStr;
    default = {};
  };
  config.packages = let
    inherit (lib.attrsets) mapAttrsToList;
    alias = name: command: (pkgs.writeShellScriptBin name \'\'exec ${command} "$@"\'\') // {meta.description = "alias for `${command}`";};
  in
    mapAttrsToList alias config.aliases;
}
```
```nix
# flake.nix
perSystem = {...}: {
  make-shells.default = {
     imports = [./aliases.nix];
     aliases = {
       n = "nix";
       g = "git";
     };
   };
};
```


## Installation

To use these options, add to your flake inputs:

```nix
make-shell.url = "github:nicknovitski/make-shell";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.make-shell.flakeModules.default
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.make-shell\.imports {#opt-perSystem.make-shell.imports}

Modules to import into all shells created using ` make-shells `



*Type:*
list of raw value



*Default:*
` [ ] `



*Example:*

```
[({pkgs, ...}: {
  additionalArguments = {
    doCheck = true;
    phases = [ "buildPhase" "checkPhase" ];
    checkPhase = \'\'
      ${pkgs.shellcheck}/bin/shellcheck --shell bash <(echo "$shellHook")
    \'\';
  };
})]

```

*Declared by:*
 - [make-shell/flake-module\.nix](https://github.com/nicknovitski/make-shell/blob/main/flake-module.nix)



## perSystem\.make-shells {#opt-perSystem.make-shells}



For each attribute in this set, make-shell is called with the value, and the resulting package is added to the flake as a devShell attribute with the same name, and as a check with the name ‘${attribute name}-devshell’\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [make-shell/flake-module\.nix](https://github.com/nicknovitski/make-shell/blob/main/flake-module.nix)



## perSystem\.make-shells\.\<name>\.packages {#opt-perSystem.make-shells._name_.packages}



Packages available in the shell environment\. An alias of ` nativeBuildInputs `



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [make-shell/shell-modules/packages\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/packages.nix)



## perSystem\.make-shells\.\<name>\.additionalArguments {#opt-perSystem.make-shells._name_.additionalArguments}



Arbitrary additional arguments passed to mkDerivation\.



*Type:*
attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [make-shell/shell-modules/default\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/default.nix)



## perSystem\.make-shells\.\<name>\.env {#opt-perSystem.make-shells._name_.env}



An attribute set to control environment variables in the shell environment\.

If the value of an attribute is ` null `, the variable of that attribute’s name is ` unset `\.  Otherwise the variable of the attribute name is set to the attribute’s value\.  Integer, path, and derivation values are converted to strings\.  The boolean true value is converted to the string ` "1" `, and the boolean false value is converted to the empty string ` "" `\.



*Type:*
attribute set of (null or boolean or signed integer or package or absolute path or string)



*Default:*
` { } `



*Example:*

```
{
  VARIABLE_NAME = "variable value";
  UNSET = null;
  EMPTY = false;
  TWO = 2;
  PATH_TO_NIX_STORE_FILE = ./my-file;
  COWSAY = pkgs.cowsay
}

```

*Declared by:*
 - [make-shell/shell-modules/env\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/env.nix)



## perSystem\.make-shells\.\<name>\.finalPackage {#opt-perSystem.make-shells._name_.finalPackage}



The shell derivation resulting from passing the evaluated configuration to mkDerivation\.



*Type:*
package *(read only)*

*Declared by:*
 - [make-shell/shell-modules/default\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/default.nix)



## perSystem\.make-shells\.\<name>\.inputsFrom {#opt-perSystem.make-shells._name_.inputsFrom}



Packages whose inputs are available in the shell environment\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [make-shell/shell-modules/packages\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/packages.nix)



## perSystem\.make-shells\.\<name>\.name {#opt-perSystem.make-shells._name_.name}



Name of the shell environment derivation\.



*Type:*
string



*Default:*
` "nix-shell" `

*Declared by:*
 - [make-shell/shell-modules/default\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/default.nix)



## perSystem\.make-shells\.\<name>\.nativeBuildInputs {#opt-perSystem.make-shells._name_.nativeBuildInputs}



Packages available in the shell environment\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [make-shell/shell-modules/packages\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/packages.nix)



## perSystem\.make-shells\.\<name>\.shellHook {#opt-perSystem.make-shells._name_.shellHook}



Bash code evaluated when the shell environment starts\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [make-shell/shell-modules/default\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/default.nix)



## perSystem\.make-shells\.\<name>\.stdenv {#opt-perSystem.make-shells._name_.stdenv}



The standard environment from which the shell derivation will be created\.



*Type:*
package



*Default:*
` pkgs.stdenv `



*Example:*
` pkgs.stdenvNoCC `

*Declared by:*
 - [make-shell/shell-modules/default\.nix](https://github.com/nicknovitski/make-shell/blob/main/shell-modules/default.nix)

