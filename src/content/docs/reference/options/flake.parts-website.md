---
title: flake.parts-website

---




This module is used to build the flake.parts website.

Refer to the [Generate Documentation guide](../generate-documentation.md) for more information.

Its interface is subject to change but moves slowly and changes should be simple.


## Installation

To use these options, add to your flake inputs:

```nix
flake.parts-website.url = "github:hercules-ci/flake.parts-website";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.flake.parts-website.flakeModules.empty-site
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.render\.enable {#opt-perSystem.render.enable}

Whether to install the rendered docs to ` perSystem.packages `\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs {#opt-perSystem.render.inputs}



Which modules to render\.

The rendered docs are installed as ` perSystem.packages.generated-docs-<name> `,
unless [` enable `](\#opt-perSystem\.render\.enable) is set to false\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.archived {#opt-perSystem.render.inputs._name_.archived}



Whether this module is archived\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.attributePath {#opt-perSystem.render.inputs._name_.attributePath}



Default value for ` attributePaths `\.



*Type:*
unspecified value



*Default:*

```
[
  "flakeModule"
]
```

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.attributePaths {#opt-perSystem.render.inputs._name_.attributePaths}



Flake output attribute path to import\.



*Type:*
list of list of string



*Default:*

```
[
  [
    "flakeModule"
  ]
]
```



*Example:*

```
[
  [
    "flakeModules"
    "nixos"
  ]
  [
    "flakeModules"
    "home-manager"
  ]
]
```

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.baseUrl {#opt-perSystem.render.inputs._name_.baseUrl}



URL prefix for source location links\.



*Type:*
string

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.extraInputs {#opt-perSystem.render.inputs._name_.extraInputs}



Extra flake inputs to provide to the module evaluation\.

This is a last resort\. Modules should generally query availability of other
modules by looking for their options with ` options ? foo.bar ` and degrading
gracefully when optional integrations are not available\.

Use this only when a module unconditionally requires specific inputs during
evaluation and cannot be modified to degrade gracefully\.



*Type:*
attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.filterTransformOptions {#opt-perSystem.render.inputs._name_.filterTransformOptions}



Function to customize the set of options to render for this input\.

This is mostly for overriding the default behavior, which excludes the options of the flake-parts module itself, unless it’s the flake-parts core itself that’s being rendered\.



*Type:*
unspecified value



*Default:*
` <function, args: {baseUrl, coreOptDecls, sourceName, sourcePath}> `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.fixupAnchorsBaseUrl {#opt-perSystem.render.inputs._name_.fixupAnchorsBaseUrl}



Replace same-page links without ` opt- ` prefix with this prefix\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.flake {#opt-perSystem.render.inputs._name_.flake}



A flake\.



*Type:*
raw value



*Default:*
` inputs.${name} `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.flakeRef {#opt-perSystem.render.inputs._name_.flakeRef}



Flake reference string that refers to the flake to import, used in the generated text for the installation instructions, see ` installation `\.



*Type:*
string



*Default:*
Determined from ` config.baseUrl `\.

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.getModules {#opt-perSystem.render.inputs._name_.getModules}



Get the modules to render\.



*Type:*
function that evaluates to a(n) list of raw value



*Default:*
Derived from ` config.attributePaths `, ` <name> `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.installation {#opt-perSystem.render.inputs._name_.installation}



Installation paragraph between installation and options\.



*Type:*
string



*Default:*
Generated

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.installationDeclareInput {#opt-perSystem.render.inputs._name_.installationDeclareInput}



Whether to show how to declare the input\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.intro {#opt-perSystem.render.inputs._name_.intro}



Introductory paragraph between title and installation\.



*Type:*
string

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.isEmpty {#opt-perSystem.render.inputs._name_.isEmpty}



Whether this input is empty, ie has no documented options\.

Normally this is indicative of a inaccurate tracking of declaration
sources, or declaring options in ` perSystem.config ` instead of
` mkPerSystemOption `\.

If your module really has no options of its own (ie only imports and config), set this to true\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.menu\.enable {#opt-perSystem.render.inputs._name_.menu.enable}



Whether to add this page to the navigation menu\.

Modules in the flake-parts repo disable this, as they’re hardcoded into the menu\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.menu\.title {#opt-perSystem.render.inputs._name_.menu.title}



Title of the menu entry\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.preface {#opt-perSystem.render.inputs._name_.preface}



Stuff between the title and the options\.



*Type:*
string



*Default:*
` intro ` followed by ` installation `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.rendered {#opt-perSystem.render.inputs._name_.rendered}



A package containing the generated documentation page\.



*Type:*
package *(read only)*

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.separateEval {#opt-perSystem.render.inputs._name_.separateEval}



Whether to include this in the main evaluation\.

By default, all modules are evaluated together, except ones that enable this option\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.sourceName {#opt-perSystem.render.inputs._name_.sourceName}



Name by which the source is shown in the list of declarations\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.sourcePath {#opt-perSystem.render.inputs._name_.sourcePath}



Source path in which the modules are contained\.



*Type:*
absolute path



*Default:*
` config.flake.outPath `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.title {#opt-perSystem.render.inputs._name_.title}



Title of the markdown page\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.inputs\.\<name>\.warningsAreErrors {#opt-perSystem.render.inputs._name_.warningsAreErrors}



Whether to treat documentation warnings as errors\.

Set to false for modules with incomplete documentation\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.officialFlakeInputs {#opt-perSystem.render.officialFlakeInputs}



The inputs from the ` flake.parts-website ` flake\.

This supplements the ` inputs ` module argument when the rendering module is used in a different flake\.



*Type:*
raw value *(read only)*

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)



## perSystem\.render\.output {#opt-perSystem.render.output}



The generated-docs package\.

Contains the rendered docs for all of [` inputs `](\#opt-perSystem\.render\.inputs),
along with a ` menu.md ` summary file\.

Installed as ` perSystem.packages.generated-docs `,
unless [` enable `](\#opt-perSystem\.render\.enable) is set to false\.



*Type:*
package *(read only)*

*Declared by:*
 - [flake\.parts-website/render/render-module\.nix](https://github.com/hercules-ci/flake.parts-website/blob/main/render/render-module.nix)

