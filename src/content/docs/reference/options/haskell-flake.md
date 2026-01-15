---
title: haskell-flake

---




[`haskell-flake`](https://community.flake.parts/haskell-flake) scans your flake files for Haskell projects and
turns them into packages using the Nixpkgs Haskell infrastructure.

It also provides [`checks`](flake-parts.html#opt-perSystem.checks) and [`devShells`](flake-parts.html#opt-perSystem.devShells)

Multiple projects can be declared to represent each package set, which is great for GHCJS frontends.


## Installation

To use these options, add to your flake inputs:

```nix
haskell-flake.url = "github:srid/haskell-flake";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.haskell-flake.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## flake\.haskellFlakeProjectModules {#opt-flake.haskellFlakeProjectModules}

A lazy attrset of ` haskellProjects.<name> ` modules that can be
imported in other flakes\.



*Type:*
lazy attribute set of module



*Default:*
Package and dependency information for this project exposed for reuse
in another flake, when using this project as a Haskell dependency\.

The ‘output’ module of the default project is included by default,
returning ` defaults.projectModules.output `\.

*Declared by:*
 - [haskell-flake/nix/modules/project-modules\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project-modules.nix)



## perSystem\.haskellProjectTests {#opt-perSystem.haskellProjectTests}



Patch an existing ` haskellProject ` to run some checks\. This module
will create a flake check automatically\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project-tests\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project-tests.nix)



## perSystem\.haskellProjectTests\.\<name>\.expect {#opt-perSystem.haskellProjectTests._name_.expect}



Arbitrary expression to evaluate as part of the generated
flake check



*Type:*
raw value

*Declared by:*
 - [haskell-flake/nix/modules/project-tests\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project-tests.nix)



## perSystem\.haskellProjectTests\.\<name>\.extraHaskellProjectConfig {#opt-perSystem.haskellProjectTests._name_.extraHaskellProjectConfig}



Extra configuration to apply to the patched haskell-flake project\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project-tests\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project-tests.nix)



## perSystem\.haskellProjectTests\.\<name>\.from {#opt-perSystem.haskellProjectTests._name_.from}



Which ` haskellProjects.?? ` to patch\.



*Type:*
string



*Default:*
` "default" `

*Declared by:*
 - [haskell-flake/nix/modules/project-tests\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project-tests.nix)



## perSystem\.haskellProjectTests\.\<name>\.patches {#opt-perSystem.haskellProjectTests._name_.patches}



List of patches to apply to the project root\.

Each patch can be a path to the diff file, or inline patch string\.



*Type:*
list of (absolute path or string)

*Declared by:*
 - [haskell-flake/nix/modules/project-tests\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project-tests.nix)



## perSystem\.haskellProjects {#opt-perSystem.haskellProjects}



Haskell projects



*Type:*
lazy attribute set of (submodule)

*Declared by:*
 - [haskell-flake/nix/modules/projects\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/projects.nix)



## perSystem\.haskellProjects\.\<name>\.packages {#opt-perSystem.haskellProjects._name_.packages}



Additional packages to add to ` basePackages `\.

Local packages are added automatically (see ` config.defaults.packages `):

You can also override the source for existing packages here\.



*Type:*
lazy attribute set of module



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project/packages](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/packages)



## perSystem\.haskellProjects\.\<name>\.autoWire {#opt-perSystem.haskellProjects._name_.autoWire}



List of flake output types to autowire\.

Using an empty list will disable autowiring entirely,
enabling you to manually wire them using
` config.haskellProjects.<name>.outputs `\.



*Type:*
list of (one of “packages”, “checks”, “apps”, “devShells”)



*Default:*

```
[
  "packages"
  "checks"
  "apps"
  "devShells"
]
```

*Declared by:*
 - [haskell-flake/nix/modules/project](https://github.com/srid/haskell-flake/blob/master/nix/modules/project)



## perSystem\.haskellProjects\.\<name>\.basePackages {#opt-perSystem.haskellProjects._name_.basePackages}



Which Haskell package set / compiler to use\.

You can effectively select the GHC version here\.

To get the appropriate value, run:

```
nix-env -f "<nixpkgs>" -qaP -A haskell.compiler
```

And then, use that in ` pkgs.haskell.packages.ghc<version> `



*Type:*
lazy attribute set of raw value



*Default:*
` pkgs.haskellPackages `



*Example:*
` "pkgs.haskell.packages.ghc924" `

*Declared by:*
 - [haskell-flake/nix/modules/project](https://github.com/srid/haskell-flake/blob/master/nix/modules/project)



## perSystem\.haskellProjects\.\<name>\.defaults\.enable {#opt-perSystem.haskellProjects._name_.defaults.enable}



Whether to enable haskell-flake’s default settings for this project\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [haskell-flake/nix/modules/project/defaults\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/defaults.nix)



## perSystem\.haskellProjects\.\<name>\.defaults\.packages {#opt-perSystem.haskellProjects._name_.defaults.packages}



Local packages scanned from projectRoot



*Type:*
lazy attribute set of module



*Default:*
If you have a ` cabal.project ` file (under ` projectRoot `), those packages
are automatically discovered\. Otherwise, the top-level \.cabal file is
used to discover the only local package\.

haskell-flake currently supports a limited range of syntax for
` cabal.project `\. Specifically it requires an explicit list of package
directories under the “packages” option\.

*Declared by:*
 - [haskell-flake/nix/modules/project/defaults\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/defaults.nix)



## perSystem\.haskellProjects\.\<name>\.defaults\.devShell\.tools {#opt-perSystem.haskellProjects._name_.defaults.devShell.tools}



Build tools always included in devShell



*Type:*
function that evaluates to a(n) lazy attribute set of (null or package)



*Default:*
` <function> `

*Declared by:*
 - [haskell-flake/nix/modules/project/defaults\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/defaults.nix)



## perSystem\.haskellProjects\.\<name>\.defaults\.projectModules\.output {#opt-perSystem.haskellProjects._name_.defaults.projectModules.output}



A haskell-flake project module that exports the ` packages ` and
` settings ` options to the consuming flake\. This enables the use of this
flake’s Haskell package as a dependency, re-using its overrides\.



*Type:*
module



*Default:*
a generated module

*Declared by:*
 - [haskell-flake/nix/modules/project/defaults\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/defaults.nix)



## perSystem\.haskellProjects\.\<name>\.defaults\.settings\.all {#opt-perSystem.haskellProjects._name_.defaults.settings.all}



Default settings for all packages whose derivations are produced by haskell-flake\.

For example,

```nix
{
  # Inside haskellProjects.<name>
  imports = [
    inputs.moo.haskellFlakeProjectModules.output
  ];
  packages = {
    foo.source = "0.1";
    bar.source = inputs.bar;
  };
  settings = {
    baz.check = false;
  };
}
```

and

```cabal
...
build-depends:
    moo
  , foo
  , bar
  , baz
  , qux
...
```

This will apply the settings to ` moo `, ` foo `, ` bar `, ` baz `\. But not to ` qux `\.



*Type:*
module



*Default:*

```
''
  Nothing is changed by default.
''
```

*Declared by:*
 - [haskell-flake/nix/modules/project/defaults\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/defaults.nix)



## perSystem\.haskellProjects\.\<name>\.defaults\.settings\.defined {#opt-perSystem.haskellProjects._name_.defaults.settings.defined}



Default settings for all the packages defined using haskell-flake\.

For example,

```nix
{
  # Inside haskellProjects.<name>
  imports = [
    inputs.moo.haskellFlakeProjectModules.output
  ];
  packages = {
    foo.source = "0.1";
    bar.source = inputs.bar;
  };
  settings = {
    baz.check = false;
  };
}
```

and

```cabal
...
build-depends:
    moo
  , foo
  , bar
  , baz
  , qux
...
```

This will apply the settings to ` moo ` and packages in current project\. But not to ` foo `, ` bar `, ` baz ` and ` qux `\.



*Type:*
module



*Default:*

````
''
  Speed up builds by disabling haddock and library profiling. Also ensures
  release-worthiness.
  
  This uses `local.toDefinedProject` option to determine which packages to
  override. Thus, it applies to both local packages as well as
  transitively imported packags that are local to that flake (managed by
  haskell-flake). The goal being to use the same configuration
  consistently for all packages using haskell-flake.
''
````

*Declared by:*
 - [haskell-flake/nix/modules/project/defaults\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/defaults.nix)



## perSystem\.haskellProjects\.\<name>\.defaults\.settings\.local {#opt-perSystem.haskellProjects._name_.defaults.settings.local}



Default settings for packages local to the current project\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project/defaults\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/defaults.nix)



## perSystem\.haskellProjects\.\<name>\.devShell {#opt-perSystem.haskellProjects._name_.devShell}



Development shell configuration



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project/hls-check\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/hls-check.nix)
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.enable {#opt-perSystem.haskellProjects._name_.devShell.enable}



Whether to enable a development shell for the project\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.benchmark {#opt-perSystem.haskellProjects._name_.devShell.benchmark}



Whether to include benchmark dependencies in the development shell\.
The value of this option will set the corresponding ` doBenchmark ` flag in the
` shellFor ` derivation\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.extraLibraries {#opt-perSystem.haskellProjects._name_.devShell.extraLibraries}



Extra Haskell libraries available in the shell’s environment\.
These can be used in the shell’s ` runghc ` and ` ghci ` for instance\.

The argument is the Haskell package set\.

The return type is an attribute set for overridability and syntax, as only the values are used\.



*Type:*
null or (function that evaluates to a(n) lazy attribute set of (null or package))



*Default:*
` null `



*Example:*
` hp: { inherit (hp) releaser; } `

*Declared by:*
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.hlsCheck {#opt-perSystem.haskellProjects._name_.devShell.hlsCheck}



A [check](flake-parts\.html\#opt-perSystem\.checks) to make sure that your IDE will work\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project/hls-check\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/hls-check.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.hlsCheck\.enable {#opt-perSystem.haskellProjects._name_.devShell.hlsCheck.enable}



Whether to enable a flake check to verify that HLS works\.

This is equivalent to ` nix develop -i -c haskell-language-server `\.

Note that, HLS will try to access the network through Cabal (see
[https://github\.com/haskell/haskell-language-server/issues/3128](https://github\.com/haskell/haskell-language-server/issues/3128)),
therefore sandboxing must be disabled when evaluating this
check\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [haskell-flake/nix/modules/project/hls-check\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/hls-check.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.hlsCheck\.drv {#opt-perSystem.haskellProjects._name_.devShell.hlsCheck.drv}



The ` hlsCheck ` derivation generated for this project\.



*Type:*
package *(read only)*

*Declared by:*
 - [haskell-flake/nix/modules/project/hls-check\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/hls-check.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.hoogle {#opt-perSystem.haskellProjects._name_.devShell.hoogle}



Whether to include Hoogle in the development shell\.
The value of this option will set the corresponding ` withHoogle ` flag in the
` shellFor ` derivation\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.mkShellArgs {#opt-perSystem.haskellProjects._name_.devShell.mkShellArgs}



Extra arguments to pass to ` pkgs.mkShell `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
''
  {
    shellHook = \'\'
      # Re-generate .cabal files so HLS will work (per hie.yaml)
      ''${pkgs.findutils}/bin/find -name package.yaml -exec hpack {} \;
    \'\';
  };
''
```

*Declared by:*
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.devShell\.tools {#opt-perSystem.haskellProjects._name_.devShell.tools}



Build tools for developing the Haskell project\.

These tools are merged with the haskell-flake defaults defined in the
` defaults.devShell.tools ` option\. Set the value to ` null ` to remove
that default tool\.



*Type:*
function that evaluates to a(n) lazy attribute set of (null or package)



*Default:*
` <function> `

*Declared by:*
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.otherOverlays {#opt-perSystem.haskellProjects._name_.otherOverlays}



Extra overlays to apply\.

Normally, you would only use ` packages.* ` and ` settings.* ` (which
translate to overlays), but you can use this option if you want control
over the final overlay\.



*Type:*
list of A Haskell overlay function taking ‘self’ and ‘super’ args\.



*Default:*
` [ ] `

*Declared by:*
 - [haskell-flake/nix/modules/project](https://github.com/srid/haskell-flake/blob/master/nix/modules/project)



## perSystem\.haskellProjects\.\<name>\.outputs {#opt-perSystem.haskellProjects._name_.outputs}



The flake outputs generated for this project\.

This is an internal option, not meant to be set by the user\.



*Type:*
submodule

*Declared by:*
 - [haskell-flake/nix/modules/project/hls-check\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/hls-check.nix)
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.packages {#opt-perSystem.haskellProjects._name_.outputs.packages}



Package information for all local packages\. Contains the following keys:

 - ` package `: The Haskell package derivation
 - ` exes `: Attrset of executables found in the \.cabal file



*Type:*
lazy attribute set of (submodule) *(read only)*

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.packages\.\<name>\.package {#opt-perSystem.haskellProjects._name_.outputs.packages._name_.package}



The local package derivation\.



*Type:*
package

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.packages\.\<name>\.exes {#opt-perSystem.haskellProjects._name_.outputs.packages._name_.exes}



Attrset of executables from ` .cabal ` file\.

If the associated Haskell project has a separate bin output
(cf\. ` enableSeparateBinOutput `), then this exe will refer
only to the bin output\.

NOTE: Evaluating up to this option will involve IFD\.



*Type:*
lazy attribute set of (submodule)

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.packages\.\<name>\.exes\.\<name>\.meta {#opt-perSystem.haskellProjects._name_.outputs.packages._name_.exes._name_.meta}



Metadata information about the app\.
Standardized in Nix at [https://github\.com/NixOS/nix/pull/11297](https://github\.com/NixOS/nix/pull/11297)\.

Note: ` nix flake check ` is only aware of the ` description ` attribute in ` meta `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.packages\.\<name>\.exes\.\<name>\.program {#opt-perSystem.haskellProjects._name_.outputs.packages._name_.exes._name_.program}



A path to an executable or a derivation with ` meta.mainProgram `\.



*Type:*
string or package convertible to it

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.packages\.\<name>\.exes\.\<name>\.type {#opt-perSystem.haskellProjects._name_.outputs.packages._name_.exes._name_.type}



A type tag for ` apps ` consumers\.



*Type:*
value “app” (singular enum)



*Default:*
` "app" `

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.apps {#opt-perSystem.haskellProjects._name_.outputs.apps}



Flake apps for each Cabal executable in the project\.



*Type:*
lazy attribute set of (submodule) *(read only)*

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.apps\.\<name>\.meta {#opt-perSystem.haskellProjects._name_.outputs.apps._name_.meta}



Metadata information about the app\.
Standardized in Nix at [https://github\.com/NixOS/nix/pull/11297](https://github\.com/NixOS/nix/pull/11297)\.

Note: ` nix flake check ` is only aware of the ` description ` attribute in ` meta `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.apps\.\<name>\.program {#opt-perSystem.haskellProjects._name_.outputs.apps._name_.program}



A path to an executable or a derivation with ` meta.mainProgram `\.



*Type:*
string or package convertible to it

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.apps\.\<name>\.type {#opt-perSystem.haskellProjects._name_.outputs.apps._name_.type}



A type tag for ` apps ` consumers\.



*Type:*
value “app” (singular enum)



*Default:*
` "app" `

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.checks {#opt-perSystem.haskellProjects._name_.outputs.checks}



The flake checks generated for this project\.



*Type:*
lazy attribute set of package *(read only)*

*Declared by:*
 - [haskell-flake/nix/modules/project/hls-check\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/hls-check.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.devShell {#opt-perSystem.haskellProjects._name_.outputs.devShell}



The development shell derivation generated for this project\.



*Type:*
package *(read only)*

*Declared by:*
 - [haskell-flake/nix/modules/project/devshell\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/devshell.nix)



## perSystem\.haskellProjects\.\<name>\.outputs\.finalPackages {#opt-perSystem.haskellProjects._name_.outputs.finalPackages}



The final Haskell package set including local packages and any
overrides, on top of ` basePackages `\.



*Type:*
lazy attribute set of raw value *(read only)*

*Declared by:*
 - [haskell-flake/nix/modules/project/outputs\.nix](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/outputs.nix)



## perSystem\.haskellProjects\.\<name>\.projectFlakeName {#opt-perSystem.haskellProjects._name_.projectFlakeName}



A descriptive name for the flake in which this project resides\.

If unspecified, the Nix store path’s basename will be used\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [haskell-flake/nix/modules/project](https://github.com/srid/haskell-flake/blob/master/nix/modules/project)



## perSystem\.haskellProjects\.\<name>\.projectRoot {#opt-perSystem.haskellProjects._name_.projectRoot}



Path to the root of the project directory\.

Chaning this affects certain functionality, like where to
look for the ‘cabal\.project’ file\.



*Type:*
absolute path



*Default:*
` "Top-level directory of the flake" `

*Declared by:*
 - [haskell-flake/nix/modules/project](https://github.com/srid/haskell-flake/blob/master/nix/modules/project)



## perSystem\.haskellProjects\.\<name>\.settings {#opt-perSystem.haskellProjects._name_.settings}



Overrides for packages in ` basePackages ` and ` packages `\.

Attr values are submodules that take the following arguments:

 - ` name `: Package name
 - ` package `: The reference to the package in ` packages ` option if it exists, null otherwise\.
 - ` self `/` super `: The ‘self’ and ‘super’ (aka\. ‘final’ and ‘prev’) used in the Haskell overlay\.
 - ` pkgs `: Nixpkgs instance of the module user (import’er)\.

Default settings are defined in ` project.config.defaults.settings ` which can be overriden\.



*Type:*
lazy attribute set of module



*Default:*
` { } `

*Declared by:*
 - [haskell-flake/nix/modules/project/settings](https://github.com/srid/haskell-flake/blob/master/nix/modules/project/settings)

