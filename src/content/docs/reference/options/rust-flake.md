---
title: rust-flake

---




[`rust-flake`](https://github.com/juspay/rust-flake) scans your flake files for Rust projects and
turns them into packages using [crane](https://crane.dev/).

It also provides [`checks`](flake-parts.html#opt-perSystem.checks) (clippy) and [`devShells`](flake-parts.html#opt-perSystem.devShells)

Multi-crate workspaces are supported.


## Installation

To use these options, add to your flake inputs:

```nix
rust-flake.url = "github:juspay/rust-flake";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.rust-flake.flakeModules.default
  inputs.rust-flake.flakeModules.nixpkgs
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.rust-project\.cargoToml {#opt-perSystem.rust-project.cargoToml}

Cargo\.toml parsed in Nix



*Type:*
attribute set of raw value



*Default:*

```
fromTOML (readFile (self + "/Cargo.toml"))

```

*Declared by:*
 - [rust-flake/nix/modules/flake-module\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/flake-module.nix)



## perSystem\.rust-project\.crane-lib {#opt-perSystem.rust-project.crane-lib}



The value of ` crane.mkLib pkgs ` providing crane library functions



*Type:*
lazy attribute set of raw value



*Default:*
`` computed from `rust-flake.inputs.crane` and [`perSystem.rust-project.toolchain`](#opt-perSystem.rust-project.toolchain) ``

*Declared by:*
 - [rust-flake/nix/modules/flake-module\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/flake-module.nix)



## perSystem\.rust-project\.crateNixFile {#opt-perSystem.rust-project.crateNixFile}



The Nix file to import automatically if it exists in the
crate directory\.

By default, nothing is automagically imported\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [rust-flake/nix/modules/flake-module\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/flake-module.nix)



## perSystem\.rust-project\.crates {#opt-perSystem.rust-project.crates}



Attrset of crates pointing to the local path, which has its Cargo\.toml file



*Type:*
attribute set of (submodule)

*Declared by:*
 - [rust-flake/nix/modules/flake-module\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/flake-module.nix)



## perSystem\.rust-project\.crates\.\<name>\.autoWire {#opt-perSystem.rust-project.crates._name_.autoWire}



List of flake output types to autowire\.

Using an empty list will disable autowiring entirely,
enabling you to manually wire them using
` config.rust-project.crates.<name>.crane.outputs `\.



*Type:*
list of (one of “crate”, “doc”, “clippy”)



*Default:*

```
[
  "crate"
  "doc"
  "clippy"
]
```

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.cargoToml {#opt-perSystem.rust-project.crates._name_.cargoToml}



The parsed Cargo\.toml file



*Type:*
attribute set of raw value



*Default:*

```
fromTOML (readFile (path + "/Cargo.toml"))

```

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.args {#opt-perSystem.rust-project.crates._name_.crane.args}



Aguments to pass to crane’s ` buildPackage ` and ` buildDepOnly `



*Type:*
open submodule of attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.args\.buildInputs {#opt-perSystem.rust-project.crates._name_.crane.args.buildInputs}



(Runtime) buildInputs for the cargo package



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.args\.nativeBuildInputs {#opt-perSystem.rust-project.crates._name_.crane.args.nativeBuildInputs}



nativeBuildInputs for the cargo package



*Type:*
list of package



*Default:*

```
with pkgs; [ pkg-config makeWrapper ]

```

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.clippy\.enable {#opt-perSystem.rust-project.crates._name_.crane.clippy.enable}



Whether to enable Add flake check for cargo clippy\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.extraBuildArgs {#opt-perSystem.rust-project.crates._name_.crane.extraBuildArgs}



Extra arguments to pass to crane’s buildPackage function



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.outputs\.packages {#opt-perSystem.rust-project.crates._name_.crane.outputs.packages}



All Nix packages for the Rust crate



*Type:*
lazy attribute set of package



*Default:*
lib\.mergeAttrs
(optionalAttrs (elem “crate” config\.autoWire) {
“${name}” = config\.crane\.outputs\.drv\.crate;
})
(optionalAttrs (elem “doc” config\.autoWire) {
“${name}-doc” = config\.crane\.outputs\.drv\.doc;
})

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.outputs\.checks {#opt-perSystem.rust-project.crates._name_.crane.outputs.checks}



All Nix flake checks for the Rust crate



*Type:*
lazy attribute set of package



*Default:*

```
optionalAttrs (elem "clippy" config.autoWire && crane.clippy.enable) {
  "${name}-clippy" = config.crane.outputs.drv.clippy;
}

```

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.outputs\.drv\.clippy {#opt-perSystem.rust-project.crates._name_.crane.outputs.drv.clippy}



The Nix package for the Rust crate clippy check



*Type:*
package



*Default:*
*computed with crane*

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.outputs\.drv\.crate {#opt-perSystem.rust-project.crates._name_.crane.outputs.drv.crate}



The Nix package for the Rust crate



*Type:*
package



*Default:*
*computed with crane*

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.crane\.outputs\.drv\.doc {#opt-perSystem.rust-project.crates._name_.crane.outputs.drv.doc}



The Nix package for the Rust crate documentation



*Type:*
package



*Default:*
*computed with crane*

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.crates\.\<name>\.path {#opt-perSystem.rust-project.crates._name_.path}



The path to the crate folder



*Type:*
absolute path

*Declared by:*
 - [rust-flake/nix/modules/crate\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/crate.nix)



## perSystem\.rust-project\.defaults\.perCrate\.crane\.args {#opt-perSystem.rust-project.defaults.perCrate.crane.args}



Default arguments for ` config.rust-project.crates.<name>.crane.args `



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [rust-flake/nix/modules/defaults\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/defaults.nix)



## perSystem\.rust-project\.src {#opt-perSystem.rust-project.src}



Source directory for the rust-project package



*Type:*
absolute path



*Default:*
Files in this flake (` self `) filtered by crane

*Declared by:*
 - [rust-flake/nix/modules/flake-module\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/flake-module.nix)



## perSystem\.rust-project\.toolchain {#opt-perSystem.rust-project.toolchain}



Rust toolchain to use for the rust-project package



*Type:*
package



*Default:*
Based on the ` rust-toolchain.toml ` file in the flake directory

*Declared by:*
 - [rust-flake/nix/modules/flake-module\.nix](https://github.com/juspay/rust-flake/blob/main/nix/modules/flake-module.nix)

