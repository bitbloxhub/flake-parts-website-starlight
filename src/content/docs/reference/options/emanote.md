---
title: emanote

---




[`Emanote`](https://github.com/srid/emanote) renders your Markdown
files as a nice static site with hot reload.

Use `nix run` to run the live server, and `nix build` to build the
static site.

See
[emanote-template](https://github.com/srid/emanote-template/blob/master/flake.nix)
for an example `flake.nix`.


## Installation

To use these options, add to your flake inputs:

```nix
emanote.url = "github:srid/emanote";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.emanote.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.emanote {#opt-perSystem.emanote}

Emanote sites config



*Type:*
submodule

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module)



## perSystem\.emanote\.sites {#opt-perSystem.emanote.sites}



Emanote sites



*Type:*
attribute set of (submodule)

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module)



## perSystem\.emanote\.sites\.\<name>\.package {#opt-perSystem.emanote.sites._name_.package}



The emanote package to use



*Type:*
package



*Default:*
` "inputs'.emanote.packages.default" `

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site)



## perSystem\.emanote\.sites\.\<name>\.allowBrokenInternalLinks {#opt-perSystem.emanote.sites._name_.allowBrokenInternalLinks}



Allow broken internal links in the static site



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site)



## perSystem\.emanote\.sites\.\<name>\.basePath {#opt-perSystem.emanote.sites._name_.basePath}



Top-level directory to copy the static site to



*Type:*
string



*Default:*
` "Root path" `

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site)



## perSystem\.emanote\.sites\.\<name>\.check {#opt-perSystem.emanote.sites._name_.check}



Whether to enable flake checks (htmlproofer) for this site



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site)



## perSystem\.emanote\.sites\.\<name>\.extraConfig {#opt-perSystem.emanote.sites._name_.extraConfig}



Extra configuration to be merged into index\.yaml



*Type:*
attribute set



*Default:*
` { } `

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site)



## perSystem\.emanote\.sites\.\<name>\.layers {#opt-perSystem.emanote.sites._name_.layers}



List of layers to use for the site



*Type:*
list of (submodule)

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site)



## perSystem\.emanote\.sites\.\<name>\.layers\.\*\.mountPoint {#opt-perSystem.emanote.sites._name_.layers._.mountPoint}



Mount point for the layer



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/layer\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/layer.nix)



## perSystem\.emanote\.sites\.\<name>\.layers\.\*\.outputs\.layer {#opt-perSystem.emanote.sites._name_.layers._.outputs.layer}



Layer spec



*Type:*
string *(read only)*

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/layer\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/layer.nix)



## perSystem\.emanote\.sites\.\<name>\.layers\.\*\.outputs\.layerString {#opt-perSystem.emanote.sites._name_.layers._.outputs.layerString}



Layer spec



*Type:*
string *(read only)*

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/layer\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/layer.nix)



## perSystem\.emanote\.sites\.\<name>\.layers\.\*\.path {#opt-perSystem.emanote.sites._name_.layers._.path}



Directory path to notes



*Type:*
absolute path

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/layer\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/layer.nix)



## perSystem\.emanote\.sites\.\<name>\.layers\.\*\.pathString {#opt-perSystem.emanote.sites._name_.layers._.pathString}



Like ` path ` but local (not in Nix store)



*Type:*
string



*Default:*
toString path

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/layer\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/layer.nix)



## perSystem\.emanote\.sites\.\<name>\.outputs\.package {#opt-perSystem.emanote.sites._name_.outputs.package}



The static website package



*Type:*
package *(read only)*

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/outputs\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/outputs.nix)



## perSystem\.emanote\.sites\.\<name>\.outputs\.app {#opt-perSystem.emanote.sites._name_.outputs.app}



The live server app



*Type:*
attribute set *(read only)*

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/outputs\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/outputs.nix)



## perSystem\.emanote\.sites\.\<name>\.outputs\.check {#opt-perSystem.emanote.sites._name_.outputs.check}



Link check for the static website



*Type:*
null or package *(read only)*

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site/outputs\.nix](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site/outputs.nix)



## perSystem\.emanote\.sites\.\<name>\.port {#opt-perSystem.emanote.sites._name_.port}



Port to listen on



*Type:*
signed integer



*Default:*
` "Random port" `

*Declared by:*
 - [emanote/nix/modules/flake-parts/flake-module/site](https://github.com/srid/emanote/blob/master/nix/modules/flake-parts/flake-module/site)

