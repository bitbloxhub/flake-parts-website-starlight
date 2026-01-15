---
title: dream2nix legacy

---




[`dream2nix`](https://github.com/nix-community/dream2nix#readme) scans your flake files and turns them into packages.

NOTE: a new version of dream2nix, v1, is in the works, and we're figuring out how best to use it.


## Installation

To use these options, add to your flake inputs:

```nix
dream2nix_legacy.url = "github:nix-community/dream2nix/c9c8689f09aa95212e75f3108788862583a1cf5a";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.dream2nix_legacy.flakeModuleBeta
];
```

Run `nix flake lock` and you're set.

## Options

## dream2nix\.config {#opt-dream2nix.config}

The dream2nix config\.



*Type:*
submodule



*Default:*

```
{
  projectRoot = self;
}

```

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/interface.nix)



## dream2nix\.config\.packagesDir {#opt-dream2nix.config.packagesDir}



Relative path to the project root to put generated dream-lock files in\.



*Type:*
Relative path in a string\.



*Default:*
` "./dream2nix-packages" `

*Declared by:*
 - [dream2nix_legacy/src/modules/config/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/config/interface.nix)



## dream2nix\.config\.modules {#opt-dream2nix.config.modules}



Extra modules to import in while evaluating the dream2nix framework\.
This allows you to add new discoverers, translators, builders etc\. and lets you override existing ones\.



*Type:*
list of absolute path



*Default:*
` [ ] `

*Declared by:*
 - [dream2nix_legacy/src/modules/config/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/config/interface.nix)



## dream2nix\.config\.overridesDirs {#opt-dream2nix.config.overridesDirs}



Override directories to pull overrides from\.



*Type:*
list of absolute path



*Default:*
` [ ] `

*Declared by:*
 - [dream2nix_legacy/src/modules/config/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/config/interface.nix)



## dream2nix\.config\.projectRoot {#opt-dream2nix.config.projectRoot}



Absolute path to the root of this project\.



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [dream2nix_legacy/src/modules/config/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/config/interface.nix)



## dream2nix\.config\.repoName {#opt-dream2nix.config.repoName}



Name of the repository this project is in\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [dream2nix_legacy/src/modules/config/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/config/interface.nix)



## dream2nix\.lib {#opt-dream2nix.lib}



The system-less dream2nix library\.
This should be the ` lib ` attribute of the dream2nix flake\.



*Type:*
raw value *(read only)*

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/interface.nix)



## perSystem\.dream2nix\.inputs {#opt-perSystem.dream2nix.inputs}



A list of inputs to generate outputs from\.
Each one takes the same arguments ` makeOutputs ` takes\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/interface.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.packageOverrides {#opt-perSystem.dream2nix.inputs._name_.packageOverrides}



Overrides to customize build logic for dependencies or top-level packages



*Type:*
lazy attribute set of (attribute set)



*Default:*
` { } `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.inject {#opt-perSystem.dream2nix.inputs._name_.inject}



Inject missing dependencies into the dependency tree



*Type:*
lazy attribute set of lazy attribute set of list of list of string



*Default:*
` { } `



*Example:*

```
{
  foo."6.4.1" = [
    ["bar" "13.2.0"]
    ["baz" "1.0.0"]
  ];
  "@tiptap/extension-code"."2.0.0-beta.26" = [
    ["@tiptap/core" "2.0.0-beta.174"]
  ];
};

```

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.pname {#opt-perSystem.dream2nix.inputs._name_.pname}



The name of the package to be built with dream2nix



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects {#opt-perSystem.dream2nix.inputs._name_.projects}



Projects that dream2nix will build



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects\.\<name>\.builder {#opt-perSystem.dream2nix.inputs._name_.projects._name_.builder}



Name of builder to use



*Type:*
null or string



*Default:*
` null `



*Example:*
` "strict-builder" `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects\.\<name>\.name {#opt-perSystem.dream2nix.inputs._name_.projects._name_.name}



Name of the project



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects\.\<name>\.relPath {#opt-perSystem.dream2nix.inputs._name_.projects._name_.relPath}



Relative path to project tree from source



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects\.\<name>\.subsystem {#opt-perSystem.dream2nix.inputs._name_.projects._name_.subsystem}



Name of subsystem to use\. Examples: rust, python, nodejs



*Type:*
string



*Example:*
` "nodejs" `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects\.\<name>\.subsystemInfo {#opt-perSystem.dream2nix.inputs._name_.projects._name_.subsystemInfo}



Translator specific arguments



*Type:*
lazy attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects\.\<name>\.translator {#opt-perSystem.dream2nix.inputs._name_.projects._name_.translator}



Translator to use



*Type:*
string



*Example:*

```
[
  "yarn-lock"
  "package-json"
]
```

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.projects\.\<name>\.version {#opt-perSystem.dream2nix.inputs._name_.projects._name_.version}



Version of the project



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.settings {#opt-perSystem.dream2nix.inputs._name_.settings}



Settings to customize dream2nix’s behaviour\.

```
    This is likely to be removed in the future:
    Quote from DavHau @ https://github.com/nix-community/dream2nix/pull/399/files#r1036801060:
    Eventually this option should be removed.
    This custom settings merging logic I once implemented is an ugly quick hack,
    and not needed anymore since we now have the module system for merging options.
```



*Type:*
list of (attribute set)



*Default:*
` [ ] `



*Example:*

```
[
  {
    aggregate = true;
  }
  {
    filter = <function>;
    subsystemInfo = {
      nodejs = 18;
      npmArgs = "--legacy-peer-deps";
    };
  }
]
```

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.source {#opt-perSystem.dream2nix.inputs._name_.source}



Source of the package to build with dream2nix



*Type:*
absolute path or package

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.inputs\.\<name>\.sourceOverrides {#opt-perSystem.dream2nix.inputs._name_.sourceOverrides}



Override the sources of dependencies or top-level packages\.
Refer to the ` dream-lock.json ` for the package version to override\.
For more details, refer to
https://nix-community\.github\.io/dream2nix/intro/override-system\.html



*Type:*
function that evaluates to a(n) lazy attribute set of attribute set of package



*Default:*
` <function> `



*Example:*

```
oldSources: {
bar."13.2.0" = builtins.fetchTarball {
  url = "https://example.com/example.tar.gz";
  sha256 = "sha256-0000000000000000000000000000000000000000000=";
};
baz."1.0.0" = builtins.fetchTarball {
  url = "https://example2.com/example2.tar.gz";
  sha256 = "sha256-0000000000000000000000000000000000000000000=";
};

```

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/makeOutputsArgs\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/makeOutputsArgs.nix)



## perSystem\.dream2nix\.instance {#opt-perSystem.dream2nix.instance}



The dream2nix instance\.



*Type:*
raw value *(read only)*

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/interface.nix)



## perSystem\.dream2nix\.outputs {#opt-perSystem.dream2nix.outputs}



The raw outputs that were generated for each input\.



*Type:*
lazy attribute set of lazy attribute set of raw value *(read only)*

*Declared by:*
 - [dream2nix_legacy/src/modules/flake-parts/interface\.nix](https://github.com/nix-community/dream2nix/blob/c9c8689f09aa95212e75f3108788862583a1cf5a/src/modules/flake-parts/interface.nix)

