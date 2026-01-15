---
title: ocaml-flake

---


<div class="warning">

This module has been archived because it appears to be unmaintained.

</div>


[`ocaml-flake`](https://github.com/9glenda/ocaml-flake) uses [`opam-nix`](https://github.com/tweag/opam-nix) to build ocaml packages. The module structure is inspired by [`haskell-flake`](https://community.flake.parts/haskell-flake).
Since the flake is fairly new future versions may introduce breaking changes.


## Installation
To initialize a new dune project using `ocaml-flake` simply run:
```sh
nix flake init -t github:9glenda/ocaml-flake#simple
```
This will set up a devshell and package for you.

## Options

## perSystem\.ocaml {#opt-perSystem.ocaml}

Ocaml module



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects {#opt-perSystem.ocaml.duneProjects}



dune Projects\.



*Type:*
attribute set of (submodule)



*Default:*
` {} `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.autoWire {#opt-perSystem.ocaml.duneProjects._name_.autoWire}



What will be added to the flake outputs\.

Note for dev shells nix will create a dev shell from the default package in case no dev shell is specified\.



*Type:*
list of (one of “devShell”, “package”)



*Default:*
` ["devShell" "package"] `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.devShell\.enable {#opt-perSystem.ocaml.duneProjects._name_.devShell.enable}



Create a dev shell for the project\.
The devShell is located in ` ocaml.dunePackage.<name>.outputs.devShell `\.
To automatically add the dev shell to the outputs of the flake add ` "devshell" ` to ` autoWire `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.devShell\.extraPackages {#opt-perSystem.ocaml.duneProjects._name_.devShell.extraPackages}



Extra packages to install into the dev shell alongside the ` opamPackages `\.



*Type:*
list of package



*Default:*
` [] `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.devShell\.inputsFromPackage {#opt-perSystem.ocaml.duneProjects._name_.devShell.inputsFromPackage}



Take inputs from the package\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.devShell\.mkShellArgs {#opt-perSystem.ocaml.duneProjects._name_.devShell.mkShellArgs}



Extra arguments to pass to ` pkgs.mkShell `\.

The already set arguments get overwritten\. It’s implemented like this:

```nix
  pkgs.mkShell ({ ... } // mkShellArgs)
```



*Type:*
attribute set of raw value



*Default:*
` { } `



*Example:*

```
''
  {
    shellHook = \'\'
      echo "example shell hook"
    \'\';
  };
''
```

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.devShell\.name {#opt-perSystem.ocaml.duneProjects._name_.devShell.name}



name of the devShell



*Type:*
string



*Default:*
` " development development shell"  `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.devShell\.opamPackages {#opt-perSystem.ocaml.duneProjects._name_.devShell.opamPackages}



development packages like the lsp and ocamlformat\.
Those packages get installed in the dev shell too\.
If the devShell is disabled this option will be ignored\.



*Type:*
attribute set of string



*Default:*

```
{
                  ocaml-lsp-server = "1.16.2";
                  ocamlformat = "0.26.1";
                  utop = "2.13.1";
                  ocamlfind = "1.9.6";
                }
```

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.name {#opt-perSystem.ocaml.duneProjects._name_.name}



name of the dune package\. Defined in dune-project



*Type:*
string



*Default:*
`    `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.outputs\.package {#opt-perSystem.ocaml.duneProjects._name_.outputs.package}



used internally



*Type:*
null or package *(read only)*

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.outputs\.devShell {#opt-perSystem.ocaml.duneProjects._name_.outputs.devShell}



used internally



*Type:*
null or raw value *(read only)*

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.settings\.opamPackages {#opt-perSystem.ocaml.duneProjects._name_.settings.opamPackages}



opam packages like the base compiler



*Type:*
attribute set of string



*Default:*
` { ocaml-base-compiler = "5.1.0"; }  `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.settings\.overlay {#opt-perSystem.ocaml.duneProjects._name_.settings.overlay}



overlay applied to opam-nix



*Type:*
raw value



*Default:*
` _: _: { }  `

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.duneProjects\.\<name>\.src {#opt-perSystem.ocaml.duneProjects._name_.src}



name of the dune package\. Defined in dune-project



*Type:*
absolute path

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.inputs\.opam-nix {#opt-perSystem.ocaml.inputs.opam-nix}



opam-nix flake input



*Type:*
raw value

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)



## perSystem\.ocaml\.inputs\.treefmt {#opt-perSystem.ocaml.inputs.treefmt}



treefmt flake input



*Type:*
raw value

*Declared by:*
 - [ocaml-flake/flake-module\.nix](https://github.com/9glenda/ocaml-flake/flake-module.nix)

