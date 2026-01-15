---
title: nix-cargo-integration

---




Easily integrate your Rust projects into Nix.


## Installation

See the [readme](https://github.com/yusdacra/nix-cargo-integration#readme).

## Options

## nci\.source {#opt-nci.source}

The source path that will be used as the ‘flake root’\.
By default this points to the directory ‘flake\.nix’ is in\.



*Type:*
absolute path



*Default:*
` "self" `

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)



## perSystem\.devshells {#opt-perSystem.devshells}



Configure devshells with flake-parts\.

Not to be confused with ` devShells `, with a capital S\. Yes, this
is unfortunate\.

Each devshell will also configure an equivalent ` devShells `\.

Used to define devshells\. not to be confused with ` devShells `



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [nix-cargo-integration/src/implementation\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/implementation.nix)



## perSystem\.nci\.crates {#opt-perSystem.nci.crates}



Crate configurations



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  my-crate = {
    export = true;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)



## perSystem\.nci\.crates\.\<name>\.checkProfile {#opt-perSystem.nci.crates._name_.checkProfile}



Profile to use for the tests only package



*Type:*
null or string



*Default:*
` null `



*Example:*
` "custom-profile" `

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.clippyProfile {#opt-perSystem.nci.crates._name_.clippyProfile}



Profile to use for clippy only package
Note that you will need to add ‘clippy’ as a component to the rust toolchain you are using yourself



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` "custom-profile" `

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.depsDrvConfig {#opt-perSystem.nci.crates._name_.depsDrvConfig}



Change dependencies derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.crates\.\<name>\.docsProfile {#opt-perSystem.nci.crates._name_.docsProfile}



Profile to use for the docs only package



*Type:*
null or string



*Default:*
` null `



*Example:*
` "custom-profile" `

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.drvConfig {#opt-perSystem.nci.crates._name_.drvConfig}



Change main derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.crates\.\<name>\.export {#opt-perSystem.nci.crates._name_.export}



Whether to export this all of this crate’s outputs (if set will override project-wide setting)



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.includeInProjectDocs {#opt-perSystem.nci.crates._name_.includeInProjectDocs}



Whether to include this crate’s docs in the project docs package



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.numtideDevshell {#opt-perSystem.nci.crates._name_.numtideDevshell}



If set, the given numtide devshell ` devshells.<name> ` will be populated with
the required packages and environment variables to build this crate\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix-cargo-integration/src/options/numtideDevshell\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/numtideDevshell.nix)



## perSystem\.nci\.crates\.\<name>\.profiles {#opt-perSystem.nci.crates._name_.profiles}



Profiles to generate packages for this crate (if set will override project-wide setting)



*Type:*
null or (attribute set of (submodule))



*Default:*
` null `



*Example:*

```
{
  dev = {};
  release.runTests = true;
  custom-profile.features = ["some" "features"];
}

```

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.profiles\.\<name>\.depsDrvConfig {#opt-perSystem.nci.crates._name_.profiles._name_.depsDrvConfig}



Change dependencies derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.crates\.\<name>\.profiles\.\<name>\.drvConfig {#opt-perSystem.nci.crates._name_.profiles._name_.drvConfig}



Change main derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.crates\.\<name>\.profiles\.\<name>\.features {#opt-perSystem.nci.crates._name_.profiles._name_.features}



Features to enable for this profile\. Set to ‘null’ to enable default features only (this is the default)\.
If set to a list of features then ‘–no-default-features’ will be passed to Cargo\.
If you want to also enable default features you can add ‘default’ feature to the list of features\.



*Type:*
null or (list of string)



*Default:*
` "[\"default\"]" `



*Example:*

```
["tracing" "publish"]

```

*Declared by:*
 - [nix-cargo-integration/src/modules/profile\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/profile.nix)



## perSystem\.nci\.crates\.\<name>\.profiles\.\<name>\.runTests {#opt-perSystem.nci.crates._name_.profiles._name_.runTests}



Whether to run tests for this profile



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-cargo-integration/src/modules/profile\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/profile.nix)



## perSystem\.nci\.crates\.\<name>\.renameTo {#opt-perSystem.nci.crates._name_.renameTo}



What to rename this crate’s outputs to in ` nix flake show `



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.runtimeLibs {#opt-perSystem.nci.crates._name_.runtimeLibs}



Runtime libraries that will be:

 - patched into the binary at build time,
 - present in ` LD_LIBRARY_PATH ` environment variable in development shell\.

Note that when it’s patched in at build time, a separate derivation will
be created that “wraps” the original derivation to not cause the whole
crate to recompile when you only change ` runtimeLibs `\. The original
derivation can be accessed via ` .passthru.unwrapped ` attribute\.



*Type:*
list of package



*Default:*
` [ ] `



*Example:*

```
[pkgs.alsa-lib pkgs.libxkbcommon]

```

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.targets {#opt-perSystem.nci.crates._name_.targets}



Targets to generate packages for this crate (if set will override project-wide setting)



*Type:*
null or (attribute set of (submodule))



*Default:*
` null `



*Example:*

```
{
  wasm32-unknown-unknown.profiles = ["release"];
  x86_64-unknown-linux-gnu.default = true;
}

```

*Declared by:*
 - [nix-cargo-integration/src/modules/crate\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/crate.nix)



## perSystem\.nci\.crates\.\<name>\.targets\.\<name>\.default {#opt-perSystem.nci.crates._name_.targets._name_.default}



Whether or not this target is the default target



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-cargo-integration/src/modules/target\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/target.nix)



## perSystem\.nci\.crates\.\<name>\.targets\.\<name>\.depsDrvConfig {#opt-perSystem.nci.crates._name_.targets._name_.depsDrvConfig}



Change dependencies derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.crates\.\<name>\.targets\.\<name>\.drvConfig {#opt-perSystem.nci.crates._name_.targets._name_.drvConfig}



Change main derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.crates\.\<name>\.targets\.\<name>\.profiles {#opt-perSystem.nci.crates._name_.targets._name_.profiles}



The profiles to generate packages for this target\.



*Type:*
null or (list of string)



*Default:*
` "all profiles" `



*Example:*

```
["dev" "release" "custom-profile"]

```

*Declared by:*
 - [nix-cargo-integration/src/modules/target\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/target.nix)



## perSystem\.nci\.lib\.buildCrate {#opt-perSystem.nci.lib.buildCrate}



A function to build a crate from a provided source (and crate path if workspace) automagically

The arguments are:

 - ` src `: the source for the project (or crate if it’s just a crate)
 - ` cratePath `: relative path to the provided ` src `, used to find the crate if it’s a workspace
 - ` mkRustToolchain `: function that outputs a rust toolchain package (like ` nci.toolchains.mkBuild `, which is also the default), will be used when building
 - ` drvConfig ` and ` depsDrvConfig `: see ` nci.crates.<name>.<drvConfig/depsDrvConfig> ` in this documentation (optional)



*Type:*
function that evaluates to a(n) package *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)



## perSystem\.nci\.outputs {#opt-perSystem.nci.outputs}



Each crate’s (or project’s) outputs



*Type:*
lazy attribute set of (submodule) *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)



## perSystem\.nci\.outputs\.\<name>\.packages {#opt-perSystem.nci.outputs._name_.packages}



Packages of this crate mapped to profiles



*Type:*
lazy attribute set of package *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/modules/output\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/output.nix)



## perSystem\.nci\.outputs\.\<name>\.allTargets {#opt-perSystem.nci.outputs._name_.allTargets}



All packages for all targets



*Type:*
lazy attribute set of (submodule) *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/modules/output\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/output.nix)



## perSystem\.nci\.outputs\.\<name>\.allTargets\.\<name>\.packages {#opt-perSystem.nci.outputs._name_.allTargets._name_.packages}



Packages of this crate mapped to profiles



*Type:*
lazy attribute set of package *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/modules/output\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/output.nix)



## perSystem\.nci\.outputs\.\<name>\.check {#opt-perSystem.nci.outputs._name_.check}



Tests only package for this crate



*Type:*
package *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/modules/output\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/output.nix)



## perSystem\.nci\.outputs\.\<name>\.clippy {#opt-perSystem.nci.outputs._name_.clippy}



Clippy only package for this crate



*Type:*
package *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/modules/output\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/output.nix)



## perSystem\.nci\.outputs\.\<name>\.devShell {#opt-perSystem.nci.outputs._name_.devShell}



The development shell for this crate



*Type:*
package *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/modules/output\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/output.nix)



## perSystem\.nci\.outputs\.\<name>\.docs {#opt-perSystem.nci.outputs._name_.docs}



Docs only package for this crate



*Type:*
package *(read only)*

*Declared by:*
 - [nix-cargo-integration/src/modules/output\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/output.nix)



## perSystem\.nci\.projects {#opt-perSystem.nci.projects}



Projects (workspaces / crates) to generate outputs for



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  # define the absolute path to the project
  my-project.path = ./.;
}

```

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)



## perSystem\.nci\.projects\.\<name>\.checkProfile {#opt-perSystem.nci.projects._name_.checkProfile}



` checkProfile ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.checkProfile ` option\.



*Type:*
string



*Default:*
` "release" `



*Example:*
` "custom-profile" `

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.clippyProfile {#opt-perSystem.nci.projects._name_.clippyProfile}



` clippyProfile ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.clippyProfile ` option\.



*Type:*
string



*Default:*
` "dev" `



*Example:*
` "custom-profile" `

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.depsDrvConfig {#opt-perSystem.nci.projects._name_.depsDrvConfig}



Change dependencies derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.projects\.\<name>\.docsIndexCrate {#opt-perSystem.nci.projects._name_.docsIndexCrate}



The crate to link it’s index\.html when building project docs\.

The default will be not symlinking any index\.html\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "my-crate" `

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.docsProfile {#opt-perSystem.nci.projects._name_.docsProfile}



` docsProfile ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.docsProfile ` option\.



*Type:*
string



*Default:*
` "release" `



*Example:*
` "custom-profile" `

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.drvConfig {#opt-perSystem.nci.projects._name_.drvConfig}



Change main derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.projects\.\<name>\.export {#opt-perSystem.nci.projects._name_.export}



` export ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.export ` option\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.includeInProjectDocs {#opt-perSystem.nci.projects._name_.includeInProjectDocs}



` includeInProjectDocs ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.includeInProjectDocs ` option\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.numtideDevshell {#opt-perSystem.nci.projects._name_.numtideDevshell}



If set, the given numtide devshell ` devshells.<name> ` will be populated with
the required packages and environment variables to build this crate\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix-cargo-integration/src/options/numtideDevshell\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/numtideDevshell.nix)



## perSystem\.nci\.projects\.\<name>\.path {#opt-perSystem.nci.projects._name_.path}



The absolute path of this project



*Type:*
absolute path



*Example:*
` ./path/to/project `

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.profiles {#opt-perSystem.nci.projects._name_.profiles}



` profiles ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.profiles ` option\.



*Type:*
attribute set of (submodule)



*Default:*

```
{
  dev = { };
  release = {
    runTests = true;
  };
}
```



*Example:*

```
{
  dev = {};
  release.runTests = true;
  custom-profile.features = ["some" "features"];
}

```

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.profiles\.\<name>\.depsDrvConfig {#opt-perSystem.nci.projects._name_.profiles._name_.depsDrvConfig}



Change dependencies derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.projects\.\<name>\.profiles\.\<name>\.drvConfig {#opt-perSystem.nci.projects._name_.profiles._name_.drvConfig}



Change main derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.projects\.\<name>\.profiles\.\<name>\.features {#opt-perSystem.nci.projects._name_.profiles._name_.features}



Features to enable for this profile\. Set to ‘null’ to enable default features only (this is the default)\.
If set to a list of features then ‘–no-default-features’ will be passed to Cargo\.
If you want to also enable default features you can add ‘default’ feature to the list of features\.



*Type:*
null or (list of string)



*Default:*
` "[\"default\"]" `



*Example:*

```
["tracing" "publish"]

```

*Declared by:*
 - [nix-cargo-integration/src/modules/profile\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/profile.nix)



## perSystem\.nci\.projects\.\<name>\.profiles\.\<name>\.runTests {#opt-perSystem.nci.projects._name_.profiles._name_.runTests}



Whether to run tests for this profile



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-cargo-integration/src/modules/profile\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/profile.nix)



## perSystem\.nci\.projects\.\<name>\.runtimeLibs {#opt-perSystem.nci.projects._name_.runtimeLibs}



` runtimeLibs ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.runtimeLibs ` option\.



*Type:*
list of package



*Default:*
` [ ] `



*Example:*

```
[pkgs.alsa-lib pkgs.libxkbcommon]

```

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.targets {#opt-perSystem.nci.projects._name_.targets}



` targets ` option that will affect all packages in this project\.
For more information refer to ` nci.crates.<name>.targets ` option\.



*Type:*
attribute set of (submodule)



*Default:*

```
''
  {
    <host platform>.default = true;
  }
''
```



*Example:*

```
{
  wasm32-unknown-unknown.profiles = ["release"];
  x86_64-unknown-linux-gnu.default = true;
}

```

*Declared by:*
 - [nix-cargo-integration/src/modules/project\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/project.nix)



## perSystem\.nci\.projects\.\<name>\.targets\.\<name>\.default {#opt-perSystem.nci.projects._name_.targets._name_.default}



Whether or not this target is the default target



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-cargo-integration/src/modules/target\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/target.nix)



## perSystem\.nci\.projects\.\<name>\.targets\.\<name>\.depsDrvConfig {#opt-perSystem.nci.projects._name_.targets._name_.depsDrvConfig}



Change dependencies derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.projects\.\<name>\.targets\.\<name>\.drvConfig {#opt-perSystem.nci.projects._name_.targets._name_.drvConfig}



Change main derivation configuration
` mkDerivation ` options must be defined under the ` mkDerivation ` attribute\.
Environment variables and non-mkDerivation options must be defined under the ` env ` attribute\.
This is passed to ` dream2nix ` as is, so you could also define any other dream2nix module options here (eg\. ` rust-crane `)\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mkDerivation = {
    # inputs and most other stuff will automatically merge
    buildInputs = [pkgs.hello];
  };
  # define env variables and options not defined in standard mkDerivation interface like this
  env = {
    CARGO_TERM_VERBOSE = "true";
    someOtherEnvVar = 1;
  };
}

```

*Declared by:*
 - [nix-cargo-integration/src/options/drvConfig\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/options/drvConfig.nix)



## perSystem\.nci\.projects\.\<name>\.targets\.\<name>\.profiles {#opt-perSystem.nci.projects._name_.targets._name_.profiles}



The profiles to generate packages for this target\.



*Type:*
null or (list of string)



*Default:*
` "all profiles" `



*Example:*

```
["dev" "release" "custom-profile"]

```

*Declared by:*
 - [nix-cargo-integration/src/modules/target\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/modules/target.nix)



## perSystem\.nci\.toolchainConfig {#opt-perSystem.nci.toolchainConfig}



The toolchain configuration that will be used



*Type:*
null or absolute path or (attribute set)



*Default:*
` null `



*Example:*
` ./rust-subproject/rust-toolchain.toml `

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)



## perSystem\.nci\.toolchains\.mkBuild {#opt-perSystem.nci.toolchains.mkBuild}



The function to (given a nixpkgs instance) generate a toolchain that will be used when building derivations



*Type:*
function that evaluates to a(n) package

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)



## perSystem\.nci\.toolchains\.mkShell {#opt-perSystem.nci.toolchains.mkShell}



The function to (given a nixpkgs instance) generate a toolchain that will be used in the development shell



*Type:*
function that evaluates to a(n) package

*Declared by:*
 - [nix-cargo-integration/src/interface\.nix](https://github.com/yusdacra/nix-cargo-integration/blob/master/src/interface.nix)

