---
title: treefmt-nix

---




When working on large code trees, it's common to have multiple code formatters run against it. And have one script that loops over all of them. `treefmt` makes that nicer.

 - A unified CLI and output
 - Run all the formatters in parallel.
 - Cache which files have changed for super fast re-formatting.
 - Just type treefmt in any folder and it reformats the whole code tree.

This module is defined in [`numtide/treefmt-nix`](https://github.com/numtide/treefmt-nix). The `treefmt` repo is about the [tool](https://github.com/numtide/treefmt) itself.


## Installation

To use these options, add to your flake inputs:

```nix
treefmt-nix.url = "github:numtide/treefmt-nix";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.treefmt-nix.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.treefmt {#opt-perSystem.treefmt}

Project-level treefmt configuration

Use ` config.treefmt.build.wrapper ` to get access to the resulting treefmt
package based on this configuration\.

By default treefmt-nix will set the ` formatter.<system> ` attribute of the flake,
used by the ` nix fmt ` command\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/flake-module\.nix](https://github.com/numtide/treefmt-nix/blob/master/flake-module.nix)



## perSystem\.treefmt\.enableDefaultExcludes {#opt-perSystem.treefmt.enableDefaultExcludes}



Enable the default excludes in the treefmt configuration\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.package {#opt-perSystem.treefmt.package}



The treefmt package to use\.



*Type:*
package



*Default:*
` pkgs.treefmt `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.build\.check {#opt-perSystem.treefmt.build.check}



Create a flake check to test that the given project tree is already
formatted\.

Input argument is the path to the project tree (usually ‘self’)\.



*Type:*
function that evaluates to a(n) package



*Default:*
Default check implementation

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.build\.configFile {#opt-perSystem.treefmt.build.configFile}



Contains the generated config file derived from the settings\.



*Type:*
absolute path

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.build\.devShell {#opt-perSystem.treefmt.build.devShell}



The development shell with treefmt and its underlying programs



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.build\.programs {#opt-perSystem.treefmt.build.programs}



Attrset of formatter programs enabled in treefmt configuration\.

The key of the attrset is the formatter name, with the value being the
package used to do the formatting\.



*Type:*
attribute set of package



*Default:*
Programs used in configuration

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.build\.wrapper {#opt-perSystem.treefmt.build.wrapper}



The treefmt package, wrapped with the config file\.



*Type:*
package



*Default:*
wrapped ` treefmt ` command

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.flakeCheck {#opt-perSystem.treefmt.flakeCheck}



Add a flake check to run ` treefmt `



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/flake-module\.nix](https://github.com/numtide/treefmt-nix/blob/master/flake-module.nix)



## perSystem\.treefmt\.flakeFormatter {#opt-perSystem.treefmt.flakeFormatter}



Enables ` treefmt ` the default formatter used by the ` nix fmt ` command



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/flake-module\.nix](https://github.com/numtide/treefmt-nix/blob/master/flake-module.nix)



## perSystem\.treefmt\.pkgs {#opt-perSystem.treefmt.pkgs}



Nixpkgs to use in ` treefmt `\.



*Type:*
lazy attribute set of raw value



*Default:*
` pkgs ` (module argument of ` perSystem `)

*Declared by:*
 - [treefmt-nix/flake-module\.nix](https://github.com/numtide/treefmt-nix/blob/master/flake-module.nix)
 - [treefmt-nix/flake-module\.nix](https://github.com/numtide/treefmt-nix/blob/master/flake-module.nix)



## perSystem\.treefmt\.programs\.actionlint\.enable {#opt-perSystem.treefmt.programs.actionlint.enable}



Whether to enable actionlint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/actionlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/actionlint.nix)



## perSystem\.treefmt\.programs\.actionlint\.package {#opt-perSystem.treefmt.programs.actionlint.package}



The actionlint package to use\.



*Type:*
package



*Default:*
` pkgs.actionlint `

*Declared by:*
 - [treefmt-nix/programs/actionlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/actionlint.nix)



## perSystem\.treefmt\.programs\.actionlint\.excludes {#opt-perSystem.treefmt.programs.actionlint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/actionlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/actionlint.nix)



## perSystem\.treefmt\.programs\.actionlint\.finalPackage {#opt-perSystem.treefmt.programs.actionlint.finalPackage}



Resulting ` actionlint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/actionlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/actionlint.nix)



## perSystem\.treefmt\.programs\.actionlint\.includes {#opt-perSystem.treefmt.programs.actionlint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".github/workflows/*.yml"
  ".github/workflows/*.yaml"
]
```

*Declared by:*
 - [treefmt-nix/programs/actionlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/actionlint.nix)



## perSystem\.treefmt\.programs\.actionlint\.priority {#opt-perSystem.treefmt.programs.actionlint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/actionlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/actionlint.nix)



## perSystem\.treefmt\.programs\.aiken\.enable {#opt-perSystem.treefmt.programs.aiken.enable}



Whether to enable aiken\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/aiken\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/aiken.nix)



## perSystem\.treefmt\.programs\.aiken\.package {#opt-perSystem.treefmt.programs.aiken.package}



The aiken package to use\.



*Type:*
package



*Default:*
` pkgs.aiken `

*Declared by:*
 - [treefmt-nix/programs/aiken\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/aiken.nix)



## perSystem\.treefmt\.programs\.aiken\.excludes {#opt-perSystem.treefmt.programs.aiken.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/aiken\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/aiken.nix)



## perSystem\.treefmt\.programs\.aiken\.finalPackage {#opt-perSystem.treefmt.programs.aiken.finalPackage}



Resulting ` aiken ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/aiken\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/aiken.nix)



## perSystem\.treefmt\.programs\.aiken\.includes {#opt-perSystem.treefmt.programs.aiken.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ak"
]
```

*Declared by:*
 - [treefmt-nix/programs/aiken\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/aiken.nix)



## perSystem\.treefmt\.programs\.aiken\.priority {#opt-perSystem.treefmt.programs.aiken.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/aiken\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/aiken.nix)



## perSystem\.treefmt\.programs\.alejandra\.enable {#opt-perSystem.treefmt.programs.alejandra.enable}



Whether to enable alejandra\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/alejandra\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/alejandra.nix)



## perSystem\.treefmt\.programs\.alejandra\.package {#opt-perSystem.treefmt.programs.alejandra.package}



The alejandra package to use\.



*Type:*
package



*Default:*
` pkgs.alejandra `

*Declared by:*
 - [treefmt-nix/programs/alejandra\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/alejandra.nix)



## perSystem\.treefmt\.programs\.alejandra\.excludes {#opt-perSystem.treefmt.programs.alejandra.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/alejandra\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/alejandra.nix)



## perSystem\.treefmt\.programs\.alejandra\.finalPackage {#opt-perSystem.treefmt.programs.alejandra.finalPackage}



Resulting ` alejandra ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/alejandra\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/alejandra.nix)



## perSystem\.treefmt\.programs\.alejandra\.includes {#opt-perSystem.treefmt.programs.alejandra.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [treefmt-nix/programs/alejandra\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/alejandra.nix)



## perSystem\.treefmt\.programs\.alejandra\.priority {#opt-perSystem.treefmt.programs.alejandra.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/alejandra\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/alejandra.nix)



## perSystem\.treefmt\.programs\.asmfmt\.enable {#opt-perSystem.treefmt.programs.asmfmt.enable}



Whether to enable asmfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/asmfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/asmfmt.nix)



## perSystem\.treefmt\.programs\.asmfmt\.package {#opt-perSystem.treefmt.programs.asmfmt.package}



The asmfmt package to use\.



*Type:*
package



*Default:*
` pkgs.asmfmt `

*Declared by:*
 - [treefmt-nix/programs/asmfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/asmfmt.nix)



## perSystem\.treefmt\.programs\.asmfmt\.excludes {#opt-perSystem.treefmt.programs.asmfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/asmfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/asmfmt.nix)



## perSystem\.treefmt\.programs\.asmfmt\.finalPackage {#opt-perSystem.treefmt.programs.asmfmt.finalPackage}



Resulting ` asmfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/asmfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/asmfmt.nix)



## perSystem\.treefmt\.programs\.asmfmt\.includes {#opt-perSystem.treefmt.programs.asmfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.s"
]
```

*Declared by:*
 - [treefmt-nix/programs/asmfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/asmfmt.nix)



## perSystem\.treefmt\.programs\.asmfmt\.priority {#opt-perSystem.treefmt.programs.asmfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/asmfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/asmfmt.nix)



## perSystem\.treefmt\.programs\.autocorrect\.enable {#opt-perSystem.treefmt.programs.autocorrect.enable}



Whether to enable autocorrect\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.package {#opt-perSystem.treefmt.programs.autocorrect.package}



The autocorrect package to use\.



*Type:*
package



*Default:*
` pkgs.autocorrect `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.excludes {#opt-perSystem.treefmt.programs.autocorrect.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.finalPackage {#opt-perSystem.treefmt.programs.autocorrect.finalPackage}



Resulting ` autocorrect ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.includes {#opt-perSystem.treefmt.programs.autocorrect.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.priority {#opt-perSystem.treefmt.programs.autocorrect.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.context {#opt-perSystem.treefmt.programs.autocorrect.settings.context}



Enable or disable in a specific context\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.context\.codeblock {#opt-perSystem.treefmt.programs.autocorrect.settings.context.codeblock}



Enable or disable to format codeblock in Markdown or AsciiDoc etc\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.fileTypes {#opt-perSystem.treefmt.programs.autocorrect.settings.fileTypes}



Configure the files associations, you config is higher priority than default\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  "*.js" = "javascript";
  ".mdx" = "markdown";
  Rakefile = "ruby";
  rb = "ruby";
}
```

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules {#opt-perSystem.treefmt.programs.autocorrect.settings.rules}



Configure rules for autocorrect formatting\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.fullwidth {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.fullwidth}



Convert to fullwidth\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.halfwidth-punctuation {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.halfwidth-punctuation}



Fullwidth punctuations to halfwidth in english\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.halfwidth-word {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.halfwidth-word}



Fullwidth alphanumeric characters to halfwidth\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.no-space-fullwidth {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.no-space-fullwidth}



Remove space near the fullwidth\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.space-backticks {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.space-backticks}



Add space between \`\`, when near the CJK\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.space-bracket {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.space-bracket}



Add space between brackets (), \[] when near the CJK\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.space-dash {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.space-dash}



Add space between dash ` - `\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "off" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.space-dollar {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.space-dollar}



Add space between dollar $ when near the CJK\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "off" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.space-punctuation {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.space-punctuation}



Add space between some punctuations\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.space-word {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.space-word}



Auto add spacing between CJK (Chinese, Japanese, Korean) and English words\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "off" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.rules\.spellcheck {#opt-perSystem.treefmt.programs.autocorrect.settings.rules.spellcheck}



Spellcheck\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "warning" `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.spellcheck {#opt-perSystem.treefmt.programs.autocorrect.settings.spellcheck}



Spellcheck configuration\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.spellcheck\.words {#opt-perSystem.treefmt.programs.autocorrect.settings.spellcheck.words}



Correct Words (Case insensitive) for by Spellcheck\.



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
[
  "GitHub"
  "App Store"
  "AppStore = App Store"
  "Git"
  "Node.js"
  "nodejs = Node.js"
  "VIM"
  "DNS"
  "HTTP"
  "SSL"
]
```

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.settings\.textRules {#opt-perSystem.treefmt.programs.autocorrect.settings.textRules}



Configure special rules for some texts\.



*Type:*
null or (attribute set of (null or one of “off”, “error”, “warning”))



*Default:*
` null `



*Example:*

```
{
  "Hello你好" = "warning";
  "Hi你好" = "off";
}
```

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.autocorrect\.threads {#opt-perSystem.treefmt.programs.autocorrect.threads}



Number of threads, 0 - use number of CPU\. \[default: 0]



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [treefmt-nix/programs/autocorrect\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/autocorrect.nix)



## perSystem\.treefmt\.programs\.beautysh\.enable {#opt-perSystem.treefmt.programs.beautysh.enable}



Whether to enable beautysh\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/beautysh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/beautysh.nix)



## perSystem\.treefmt\.programs\.beautysh\.package {#opt-perSystem.treefmt.programs.beautysh.package}



The beautysh package to use\.



*Type:*
package



*Default:*
` pkgs.beautysh `

*Declared by:*
 - [treefmt-nix/programs/beautysh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/beautysh.nix)



## perSystem\.treefmt\.programs\.beautysh\.excludes {#opt-perSystem.treefmt.programs.beautysh.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/beautysh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/beautysh.nix)



## perSystem\.treefmt\.programs\.beautysh\.finalPackage {#opt-perSystem.treefmt.programs.beautysh.finalPackage}



Resulting ` beautysh ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/beautysh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/beautysh.nix)



## perSystem\.treefmt\.programs\.beautysh\.includes {#opt-perSystem.treefmt.programs.beautysh.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sh"
  "*.bash"
  "*.envrc"
  "*.envrc.*"
]
```

*Declared by:*
 - [treefmt-nix/programs/beautysh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/beautysh.nix)



## perSystem\.treefmt\.programs\.beautysh\.indent_size {#opt-perSystem.treefmt.programs.beautysh.indent_size}



Sets the number of spaces to be used in indentation\.



*Type:*
signed integer



*Default:*
` 2 `



*Example:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/beautysh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/beautysh.nix)



## perSystem\.treefmt\.programs\.beautysh\.priority {#opt-perSystem.treefmt.programs.beautysh.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/beautysh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/beautysh.nix)



## perSystem\.treefmt\.programs\.biome\.enable {#opt-perSystem.treefmt.programs.biome.enable}



Whether to enable biome\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.package {#opt-perSystem.treefmt.programs.biome.package}



The biome package to use\.



*Type:*
package



*Default:*
` pkgs.biome `

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.excludes {#opt-perSystem.treefmt.programs.biome.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.finalPackage {#opt-perSystem.treefmt.programs.biome.finalPackage}



Resulting ` biome ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.formatCommand {#opt-perSystem.treefmt.programs.biome.formatCommand}



The command to run Biome with\.



*Type:*
one of “format”, “lint”, “check”



*Default:*
` "check" `



*Example:*
` "format" `

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.formatUnsafe {#opt-perSystem.treefmt.programs.biome.formatUnsafe}



Allows to format a document that has unsafe fixes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.includes {#opt-perSystem.treefmt.programs.biome.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.js"
  "*.ts"
  "*.mjs"
  "*.mts"
  "*.cjs"
  "*.cts"
  "*.jsx"
  "*.tsx"
  "*.d.ts"
  "*.d.cts"
  "*.d.mts"
  "*.json"
  "*.jsonc"
  "*.css"
]
```

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.priority {#opt-perSystem.treefmt.programs.biome.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.settings {#opt-perSystem.treefmt.programs.biome.settings}



Raw Biome configuration (must conform to Biome JSON schema)



*Type:*
JSON value



*Default:*
` { } `



*Example:*

```
{
  formatter = {
    indentStyle = "space";
    lineWidth = 100;
  };
  javascript = {
    formatter = {
      lineWidth = 120;
      quoteStyle = "single";
    };
  };
  json = {
    formatter = {
      enabled = false;
    };
  };
}
```

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.validate\.enable {#opt-perSystem.treefmt.programs.biome.validate.enable}



Whether to validate ` perSystem.treefmt.programs.biome.settings `\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.biome\.validate\.schema {#opt-perSystem.treefmt.programs.biome.validate.schema}



The biome schema file to validate against



*Type:*
absolute path



*Default:*
Fetches ` "https://biomejs.dev/schemas/${biomeVersion}/schema.json" ` using ` pkgs.fetchurl `\.



*Example:*

```
pkgs.fetchurl {
  url = "https://biomejs.dev/schemas/2.1.2/schema.json"
  hash = "sha256-n4Y16J7g34e0VdQzRItu/P7n5oppkY4Vm4P1pQxOILU=";
}

```

*Declared by:*
 - [treefmt-nix/programs/biome\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/biome.nix)



## perSystem\.treefmt\.programs\.black\.enable {#opt-perSystem.treefmt.programs.black.enable}



Whether to enable black\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/black\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/black.nix)



## perSystem\.treefmt\.programs\.black\.package {#opt-perSystem.treefmt.programs.black.package}



The black package to use\.



*Type:*
package



*Default:*
` pkgs.black `

*Declared by:*
 - [treefmt-nix/programs/black\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/black.nix)



## perSystem\.treefmt\.programs\.black\.excludes {#opt-perSystem.treefmt.programs.black.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/black\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/black.nix)



## perSystem\.treefmt\.programs\.black\.finalPackage {#opt-perSystem.treefmt.programs.black.finalPackage}



Resulting ` black ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/black\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/black.nix)



## perSystem\.treefmt\.programs\.black\.includes {#opt-perSystem.treefmt.programs.black.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [treefmt-nix/programs/black\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/black.nix)



## perSystem\.treefmt\.programs\.black\.priority {#opt-perSystem.treefmt.programs.black.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/black\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/black.nix)



## perSystem\.treefmt\.programs\.buf\.enable {#opt-perSystem.treefmt.programs.buf.enable}



Whether to enable buf\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/buf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buf.nix)



## perSystem\.treefmt\.programs\.buf\.package {#opt-perSystem.treefmt.programs.buf.package}



The buf package to use\.



*Type:*
package



*Default:*
` pkgs.buf `

*Declared by:*
 - [treefmt-nix/programs/buf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buf.nix)



## perSystem\.treefmt\.programs\.buf\.excludes {#opt-perSystem.treefmt.programs.buf.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/buf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buf.nix)



## perSystem\.treefmt\.programs\.buf\.finalPackage {#opt-perSystem.treefmt.programs.buf.finalPackage}



Resulting ` buf ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/buf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buf.nix)



## perSystem\.treefmt\.programs\.buf\.includes {#opt-perSystem.treefmt.programs.buf.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.proto"
]
```

*Declared by:*
 - [treefmt-nix/programs/buf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buf.nix)



## perSystem\.treefmt\.programs\.buf\.priority {#opt-perSystem.treefmt.programs.buf.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/buf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buf.nix)



## perSystem\.treefmt\.programs\.buildifier\.enable {#opt-perSystem.treefmt.programs.buildifier.enable}



Whether to enable buildifier\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/buildifier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buildifier.nix)



## perSystem\.treefmt\.programs\.buildifier\.package {#opt-perSystem.treefmt.programs.buildifier.package}



The buildifier package to use\.



*Type:*
package



*Default:*
` pkgs.buildifier `

*Declared by:*
 - [treefmt-nix/programs/buildifier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buildifier.nix)



## perSystem\.treefmt\.programs\.buildifier\.excludes {#opt-perSystem.treefmt.programs.buildifier.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/buildifier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buildifier.nix)



## perSystem\.treefmt\.programs\.buildifier\.finalPackage {#opt-perSystem.treefmt.programs.buildifier.finalPackage}



Resulting ` buildifier ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/buildifier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buildifier.nix)



## perSystem\.treefmt\.programs\.buildifier\.includes {#opt-perSystem.treefmt.programs.buildifier.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.bazel"
  "*.bzl"
]
```

*Declared by:*
 - [treefmt-nix/programs/buildifier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buildifier.nix)



## perSystem\.treefmt\.programs\.buildifier\.priority {#opt-perSystem.treefmt.programs.buildifier.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/buildifier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/buildifier.nix)



## perSystem\.treefmt\.programs\.cabal-fmt\.enable {#opt-perSystem.treefmt.programs.cabal-fmt.enable}



Whether to enable cabal-fmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/cabal-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-fmt.nix)



## perSystem\.treefmt\.programs\.cabal-fmt\.package {#opt-perSystem.treefmt.programs.cabal-fmt.package}

The cabal-fmt package to use\.



*Type:*
package



*Default:*
` pkgs.haskellPackages.cabal-fmt `

*Declared by:*
 - [treefmt-nix/programs/cabal-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-fmt.nix)



## perSystem\.treefmt\.programs\.cabal-fmt\.excludes {#opt-perSystem.treefmt.programs.cabal-fmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/cabal-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-fmt.nix)



## perSystem\.treefmt\.programs\.cabal-fmt\.finalPackage {#opt-perSystem.treefmt.programs.cabal-fmt.finalPackage}



Resulting ` cabal-fmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/cabal-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-fmt.nix)



## perSystem\.treefmt\.programs\.cabal-fmt\.includes {#opt-perSystem.treefmt.programs.cabal-fmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cabal"
]
```

*Declared by:*
 - [treefmt-nix/programs/cabal-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-fmt.nix)



## perSystem\.treefmt\.programs\.cabal-fmt\.priority {#opt-perSystem.treefmt.programs.cabal-fmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/cabal-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-fmt.nix)



## perSystem\.treefmt\.programs\.cabal-gild\.enable {#opt-perSystem.treefmt.programs.cabal-gild.enable}



Whether to enable cabal-gild\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/cabal-gild\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-gild.nix)



## perSystem\.treefmt\.programs\.cabal-gild\.package {#opt-perSystem.treefmt.programs.cabal-gild.package}



The cabal-gild package to use\.



*Type:*
package



*Default:*
` pkgs.haskellPackages.cabal-gild `

*Declared by:*
 - [treefmt-nix/programs/cabal-gild\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-gild.nix)



## perSystem\.treefmt\.programs\.cabal-gild\.excludes {#opt-perSystem.treefmt.programs.cabal-gild.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/cabal-gild\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-gild.nix)



## perSystem\.treefmt\.programs\.cabal-gild\.finalPackage {#opt-perSystem.treefmt.programs.cabal-gild.finalPackage}



Resulting ` cabal-gild ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/cabal-gild\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-gild.nix)



## perSystem\.treefmt\.programs\.cabal-gild\.includes {#opt-perSystem.treefmt.programs.cabal-gild.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cabal"
  "cabal.project"
  "cabal.project.local"
]
```

*Declared by:*
 - [treefmt-nix/programs/cabal-gild\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-gild.nix)



## perSystem\.treefmt\.programs\.cabal-gild\.priority {#opt-perSystem.treefmt.programs.cabal-gild.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/cabal-gild\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cabal-gild.nix)



## perSystem\.treefmt\.programs\.clang-format\.enable {#opt-perSystem.treefmt.programs.clang-format.enable}



Whether to enable clang-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/clang-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-format.nix)



## perSystem\.treefmt\.programs\.clang-format\.package {#opt-perSystem.treefmt.programs.clang-format.package}



The clang-tools package to use\.



*Type:*
package



*Default:*
` pkgs.clang-tools `

*Declared by:*
 - [treefmt-nix/programs/clang-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-format.nix)



## perSystem\.treefmt\.programs\.clang-format\.excludes {#opt-perSystem.treefmt.programs.clang-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/clang-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-format.nix)



## perSystem\.treefmt\.programs\.clang-format\.finalPackage {#opt-perSystem.treefmt.programs.clang-format.finalPackage}



Resulting ` clang-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/clang-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-format.nix)



## perSystem\.treefmt\.programs\.clang-format\.includes {#opt-perSystem.treefmt.programs.clang-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.c"
  "*.cc"
  "*.cpp"
  "*.h"
  "*.hh"
  "*.hpp"
  "*.glsl"
  "*.vert"
  ".tesc"
  ".tese"
  ".geom"
  ".frag"
  ".comp"
]
```

*Declared by:*
 - [treefmt-nix/programs/clang-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-format.nix)



## perSystem\.treefmt\.programs\.clang-format\.priority {#opt-perSystem.treefmt.programs.clang-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/clang-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-format.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.enable {#opt-perSystem.treefmt.programs.clang-tidy.enable}



Whether to enable clang-tidy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.package {#opt-perSystem.treefmt.programs.clang-tidy.package}



The clang-tools package to use\.



*Type:*
package



*Default:*
` pkgs.clang-tools `

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.compileCommandsPath {#opt-perSystem.treefmt.programs.clang-tidy.compileCommandsPath}



used to read a compile command database



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` "/my/cmake/build/directory" `

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.configFile {#opt-perSystem.treefmt.programs.clang-tidy.configFile}



Specify the path of \.clang-tidy or custom config file



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` "/some/path/myTidyConfigFile" `

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.excludes {#opt-perSystem.treefmt.programs.clang-tidy.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.finalPackage {#opt-perSystem.treefmt.programs.clang-tidy.finalPackage}



Resulting ` clang-tidy ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.includes {#opt-perSystem.treefmt.programs.clang-tidy.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.c"
  "*.cc"
  "*.cpp"
  "*.h"
  "*.hh"
  "*.hpp"
  "*.glsl"
  "*.vert"
  ".tesc"
  ".tese"
  ".geom"
  ".frag"
  ".comp"
]
```

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.priority {#opt-perSystem.treefmt.programs.clang-tidy.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.clang-tidy\.quiet {#opt-perSystem.treefmt.programs.clang-tidy.quiet}



Run clang-tidy in quiet mode



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/programs/clang-tidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/clang-tidy.nix)



## perSystem\.treefmt\.programs\.cljfmt\.enable {#opt-perSystem.treefmt.programs.cljfmt.enable}



Whether to enable cljfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/cljfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cljfmt.nix)



## perSystem\.treefmt\.programs\.cljfmt\.package {#opt-perSystem.treefmt.programs.cljfmt.package}



The cljfmt package to use\.



*Type:*
package



*Default:*
` pkgs.cljfmt `

*Declared by:*
 - [treefmt-nix/programs/cljfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cljfmt.nix)



## perSystem\.treefmt\.programs\.cljfmt\.excludes {#opt-perSystem.treefmt.programs.cljfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/cljfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cljfmt.nix)



## perSystem\.treefmt\.programs\.cljfmt\.finalPackage {#opt-perSystem.treefmt.programs.cljfmt.finalPackage}



Resulting ` cljfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/cljfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cljfmt.nix)



## perSystem\.treefmt\.programs\.cljfmt\.includes {#opt-perSystem.treefmt.programs.cljfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.clj"
  "*.cljc"
  "*.cljs"
  "*.cljx"
]
```

*Declared by:*
 - [treefmt-nix/programs/cljfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cljfmt.nix)



## perSystem\.treefmt\.programs\.cljfmt\.priority {#opt-perSystem.treefmt.programs.cljfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/cljfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cljfmt.nix)



## perSystem\.treefmt\.programs\.cmake-format\.enable {#opt-perSystem.treefmt.programs.cmake-format.enable}



Whether to enable cmake-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/cmake-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cmake-format.nix)



## perSystem\.treefmt\.programs\.cmake-format\.package {#opt-perSystem.treefmt.programs.cmake-format.package}



The cmake-format package to use\.



*Type:*
package



*Default:*
` pkgs.cmake-format `

*Declared by:*
 - [treefmt-nix/programs/cmake-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cmake-format.nix)



## perSystem\.treefmt\.programs\.cmake-format\.excludes {#opt-perSystem.treefmt.programs.cmake-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/cmake-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cmake-format.nix)



## perSystem\.treefmt\.programs\.cmake-format\.finalPackage {#opt-perSystem.treefmt.programs.cmake-format.finalPackage}



Resulting ` cmake-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/cmake-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cmake-format.nix)



## perSystem\.treefmt\.programs\.cmake-format\.includes {#opt-perSystem.treefmt.programs.cmake-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cmake"
  "CMakeLists.txt"
]
```

*Declared by:*
 - [treefmt-nix/programs/cmake-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cmake-format.nix)



## perSystem\.treefmt\.programs\.cmake-format\.priority {#opt-perSystem.treefmt.programs.cmake-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/cmake-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cmake-format.nix)



## perSystem\.treefmt\.programs\.csharpier\.enable {#opt-perSystem.treefmt.programs.csharpier.enable}



Whether to enable csharpier\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/csharpier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/csharpier.nix)



## perSystem\.treefmt\.programs\.csharpier\.package {#opt-perSystem.treefmt.programs.csharpier.package}



The csharpier package to use\.



*Type:*
package



*Default:*
` pkgs.csharpier `

*Declared by:*
 - [treefmt-nix/programs/csharpier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/csharpier.nix)



## perSystem\.treefmt\.programs\.csharpier\.excludes {#opt-perSystem.treefmt.programs.csharpier.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/csharpier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/csharpier.nix)



## perSystem\.treefmt\.programs\.csharpier\.finalPackage {#opt-perSystem.treefmt.programs.csharpier.finalPackage}



Resulting ` csharpier ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/csharpier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/csharpier.nix)



## perSystem\.treefmt\.programs\.csharpier\.includes {#opt-perSystem.treefmt.programs.csharpier.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cs"
  "*.csproj"
  "*.slnx"
  "*.xaml"
]
```

*Declared by:*
 - [treefmt-nix/programs/csharpier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/csharpier.nix)



## perSystem\.treefmt\.programs\.csharpier\.priority {#opt-perSystem.treefmt.programs.csharpier.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/csharpier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/csharpier.nix)



## perSystem\.treefmt\.programs\.cue\.enable {#opt-perSystem.treefmt.programs.cue.enable}



Whether to enable cue\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/cue\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cue.nix)



## perSystem\.treefmt\.programs\.cue\.package {#opt-perSystem.treefmt.programs.cue.package}



The cue package to use\.



*Type:*
package



*Default:*
` pkgs.cue `

*Declared by:*
 - [treefmt-nix/programs/cue\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cue.nix)



## perSystem\.treefmt\.programs\.cue\.excludes {#opt-perSystem.treefmt.programs.cue.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/cue\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cue.nix)



## perSystem\.treefmt\.programs\.cue\.finalPackage {#opt-perSystem.treefmt.programs.cue.finalPackage}



Resulting ` cue ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/cue\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cue.nix)



## perSystem\.treefmt\.programs\.cue\.includes {#opt-perSystem.treefmt.programs.cue.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cue"
]
```

*Declared by:*
 - [treefmt-nix/programs/cue\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cue.nix)



## perSystem\.treefmt\.programs\.cue\.priority {#opt-perSystem.treefmt.programs.cue.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/cue\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/cue.nix)



## perSystem\.treefmt\.programs\.d2\.enable {#opt-perSystem.treefmt.programs.d2.enable}



Whether to enable d2\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/d2\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/d2.nix)



## perSystem\.treefmt\.programs\.d2\.package {#opt-perSystem.treefmt.programs.d2.package}



The d2 package to use\.



*Type:*
package



*Default:*
` pkgs.d2 `

*Declared by:*
 - [treefmt-nix/programs/d2\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/d2.nix)



## perSystem\.treefmt\.programs\.d2\.excludes {#opt-perSystem.treefmt.programs.d2.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/d2\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/d2.nix)



## perSystem\.treefmt\.programs\.d2\.finalPackage {#opt-perSystem.treefmt.programs.d2.finalPackage}



Resulting ` d2 ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/d2\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/d2.nix)



## perSystem\.treefmt\.programs\.d2\.includes {#opt-perSystem.treefmt.programs.d2.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.d2"
]
```

*Declared by:*
 - [treefmt-nix/programs/d2\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/d2.nix)



## perSystem\.treefmt\.programs\.d2\.priority {#opt-perSystem.treefmt.programs.d2.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/d2\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/d2.nix)



## perSystem\.treefmt\.programs\.dart-format\.enable {#opt-perSystem.treefmt.programs.dart-format.enable}



Whether to enable dart-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dart-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dart-format.nix)



## perSystem\.treefmt\.programs\.dart-format\.package {#opt-perSystem.treefmt.programs.dart-format.package}



The dart package to use\.



*Type:*
package



*Default:*
` pkgs.dart `

*Declared by:*
 - [treefmt-nix/programs/dart-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dart-format.nix)



## perSystem\.treefmt\.programs\.dart-format\.excludes {#opt-perSystem.treefmt.programs.dart-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dart-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dart-format.nix)



## perSystem\.treefmt\.programs\.dart-format\.finalPackage {#opt-perSystem.treefmt.programs.dart-format.finalPackage}



Resulting ` dart-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dart-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dart-format.nix)



## perSystem\.treefmt\.programs\.dart-format\.includes {#opt-perSystem.treefmt.programs.dart-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.dart"
]
```

*Declared by:*
 - [treefmt-nix/programs/dart-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dart-format.nix)



## perSystem\.treefmt\.programs\.dart-format\.priority {#opt-perSystem.treefmt.programs.dart-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dart-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dart-format.nix)



## perSystem\.treefmt\.programs\.deadnix\.enable {#opt-perSystem.treefmt.programs.deadnix.enable}



Whether to enable deadnix\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.package {#opt-perSystem.treefmt.programs.deadnix.package}



The deadnix package to use\.



*Type:*
package



*Default:*
` pkgs.deadnix `

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.excludes {#opt-perSystem.treefmt.programs.deadnix.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.finalPackage {#opt-perSystem.treefmt.programs.deadnix.finalPackage}



Resulting ` deadnix ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.includes {#opt-perSystem.treefmt.programs.deadnix.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.no-lambda-arg {#opt-perSystem.treefmt.programs.deadnix.no-lambda-arg}



Whether to enable Don’t check lambda parameter arguments\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.no-lambda-pattern-names {#opt-perSystem.treefmt.programs.deadnix.no-lambda-pattern-names}



Whether to enable Don’t check lambda attrset pattern names (don’t break nixpkgs callPackage)\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.no-underscore {#opt-perSystem.treefmt.programs.deadnix.no-underscore}



Whether to enable Don’t check any bindings that start with a _\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deadnix\.priority {#opt-perSystem.treefmt.programs.deadnix.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/deadnix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deadnix.nix)



## perSystem\.treefmt\.programs\.deno\.enable {#opt-perSystem.treefmt.programs.deno.enable}



Whether to enable deno\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/deno\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deno.nix)



## perSystem\.treefmt\.programs\.deno\.package {#opt-perSystem.treefmt.programs.deno.package}



The deno package to use\.



*Type:*
package



*Default:*
` pkgs.deno `

*Declared by:*
 - [treefmt-nix/programs/deno\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deno.nix)



## perSystem\.treefmt\.programs\.deno\.excludes {#opt-perSystem.treefmt.programs.deno.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/deno\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deno.nix)



## perSystem\.treefmt\.programs\.deno\.finalPackage {#opt-perSystem.treefmt.programs.deno.finalPackage}



Resulting ` deno ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/deno\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deno.nix)



## perSystem\.treefmt\.programs\.deno\.includes {#opt-perSystem.treefmt.programs.deno.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.css"
  "*.html"
  "*.js"
  "*.json"
  "*.jsonc"
  "*.jsx"
  "*.less"
  "*.markdown"
  "*.md"
  "*.sass"
  "*.scss"
  "*.ts"
  "*.tsx"
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [treefmt-nix/programs/deno\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deno.nix)



## perSystem\.treefmt\.programs\.deno\.priority {#opt-perSystem.treefmt.programs.deno.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/deno\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/deno.nix)



## perSystem\.treefmt\.programs\.dfmt\.enable {#opt-perSystem.treefmt.programs.dfmt.enable}



Whether to enable dfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dfmt.nix)



## perSystem\.treefmt\.programs\.dfmt\.package {#opt-perSystem.treefmt.programs.dfmt.package}



The dformat package to use\.



*Type:*
package



*Default:*
` pkgs.dformat `

*Declared by:*
 - [treefmt-nix/programs/dfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dfmt.nix)



## perSystem\.treefmt\.programs\.dfmt\.excludes {#opt-perSystem.treefmt.programs.dfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dfmt.nix)



## perSystem\.treefmt\.programs\.dfmt\.finalPackage {#opt-perSystem.treefmt.programs.dfmt.finalPackage}



Resulting ` dfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dfmt.nix)



## perSystem\.treefmt\.programs\.dfmt\.includes {#opt-perSystem.treefmt.programs.dfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.d"
]
```

*Declared by:*
 - [treefmt-nix/programs/dfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dfmt.nix)



## perSystem\.treefmt\.programs\.dfmt\.priority {#opt-perSystem.treefmt.programs.dfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dfmt.nix)



## perSystem\.treefmt\.programs\.dhall\.enable {#opt-perSystem.treefmt.programs.dhall.enable}



Whether to enable dhall\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dhall\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dhall.nix)



## perSystem\.treefmt\.programs\.dhall\.package {#opt-perSystem.treefmt.programs.dhall.package}



The dhall package to use\.



*Type:*
package



*Default:*
` pkgs.dhall `

*Declared by:*
 - [treefmt-nix/programs/dhall\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dhall.nix)



## perSystem\.treefmt\.programs\.dhall\.excludes {#opt-perSystem.treefmt.programs.dhall.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dhall\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dhall.nix)



## perSystem\.treefmt\.programs\.dhall\.finalPackage {#opt-perSystem.treefmt.programs.dhall.finalPackage}



Resulting ` dhall ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dhall\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dhall.nix)



## perSystem\.treefmt\.programs\.dhall\.includes {#opt-perSystem.treefmt.programs.dhall.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.dhall"
]
```

*Declared by:*
 - [treefmt-nix/programs/dhall\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dhall.nix)



## perSystem\.treefmt\.programs\.dhall\.lint {#opt-perSystem.treefmt.programs.dhall.lint}



Whether to lint in addition to formatting\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/dhall\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dhall.nix)



## perSystem\.treefmt\.programs\.dhall\.priority {#opt-perSystem.treefmt.programs.dhall.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dhall\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dhall.nix)



## perSystem\.treefmt\.programs\.djlint\.enable {#opt-perSystem.treefmt.programs.djlint.enable}



Whether to enable djlint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.package {#opt-perSystem.treefmt.programs.djlint.package}



The djlint package to use\.



*Type:*
package



*Default:*
` pkgs.djlint `

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.excludes {#opt-perSystem.treefmt.programs.djlint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.finalPackage {#opt-perSystem.treefmt.programs.djlint.finalPackage}



Resulting ` djlint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.ignoreRules {#opt-perSystem.treefmt.programs.djlint.ignoreRules}



Which H-rules to ignore



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.includes {#opt-perSystem.treefmt.programs.djlint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.html"
]
```

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.indent {#opt-perSystem.treefmt.programs.djlint.indent}



Default indentation depth in spaces



*Type:*
unsigned integer, meaning >=0



*Default:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.lint {#opt-perSystem.treefmt.programs.djlint.lint}



Whether to lint in addition to formatting\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.djlint\.priority {#opt-perSystem.treefmt.programs.djlint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/djlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/djlint.nix)



## perSystem\.treefmt\.programs\.dnscontrol\.enable {#opt-perSystem.treefmt.programs.dnscontrol.enable}



Whether to enable dnscontrol\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dnscontrol\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dnscontrol.nix)



## perSystem\.treefmt\.programs\.dnscontrol\.package {#opt-perSystem.treefmt.programs.dnscontrol.package}

The dnscontrol package to use\.



*Type:*
package



*Default:*
` pkgs.dnscontrol `

*Declared by:*
 - [treefmt-nix/programs/dnscontrol\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dnscontrol.nix)



## perSystem\.treefmt\.programs\.dnscontrol\.excludes {#opt-perSystem.treefmt.programs.dnscontrol.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dnscontrol\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dnscontrol.nix)



## perSystem\.treefmt\.programs\.dnscontrol\.finalPackage {#opt-perSystem.treefmt.programs.dnscontrol.finalPackage}



Resulting ` dnscontrol ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dnscontrol\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dnscontrol.nix)



## perSystem\.treefmt\.programs\.dnscontrol\.includes {#opt-perSystem.treefmt.programs.dnscontrol.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "dnsconfig.js"
]
```

*Declared by:*
 - [treefmt-nix/programs/dnscontrol\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dnscontrol.nix)



## perSystem\.treefmt\.programs\.dnscontrol\.priority {#opt-perSystem.treefmt.programs.dnscontrol.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dnscontrol\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dnscontrol.nix)



## perSystem\.treefmt\.programs\.dockerfmt\.enable {#opt-perSystem.treefmt.programs.dockerfmt.enable}



Whether to enable dockerfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dockerfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockerfmt.nix)



## perSystem\.treefmt\.programs\.dockerfmt\.package {#opt-perSystem.treefmt.programs.dockerfmt.package}



The dockerfmt package to use\.



*Type:*
package



*Default:*
` pkgs.dockerfmt `

*Declared by:*
 - [treefmt-nix/programs/dockerfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockerfmt.nix)



## perSystem\.treefmt\.programs\.dockerfmt\.excludes {#opt-perSystem.treefmt.programs.dockerfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dockerfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockerfmt.nix)



## perSystem\.treefmt\.programs\.dockerfmt\.finalPackage {#opt-perSystem.treefmt.programs.dockerfmt.finalPackage}



Resulting ` dockerfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dockerfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockerfmt.nix)



## perSystem\.treefmt\.programs\.dockerfmt\.includes {#opt-perSystem.treefmt.programs.dockerfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "Dockerfile"
  "*/Dockerfile"
  "*.Dockerfile"
  "Dockerfile.*"
  "*/Dockerfile.*"
  "*.dockerfile"
  "dockerfile.*"
  "*/dockerfile.*"
]
```

*Declared by:*
 - [treefmt-nix/programs/dockerfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockerfmt.nix)



## perSystem\.treefmt\.programs\.dockerfmt\.priority {#opt-perSystem.treefmt.programs.dockerfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dockerfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockerfmt.nix)



## perSystem\.treefmt\.programs\.dockfmt\.enable {#opt-perSystem.treefmt.programs.dockfmt.enable}



Whether to enable dockfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dockfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockfmt.nix)



## perSystem\.treefmt\.programs\.dockfmt\.package {#opt-perSystem.treefmt.programs.dockfmt.package}



The dockfmt package to use\.



*Type:*
package



*Default:*
` pkgs.dockfmt `

*Declared by:*
 - [treefmt-nix/programs/dockfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockfmt.nix)



## perSystem\.treefmt\.programs\.dockfmt\.excludes {#opt-perSystem.treefmt.programs.dockfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dockfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockfmt.nix)



## perSystem\.treefmt\.programs\.dockfmt\.finalPackage {#opt-perSystem.treefmt.programs.dockfmt.finalPackage}



Resulting ` dockfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dockfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockfmt.nix)



## perSystem\.treefmt\.programs\.dockfmt\.includes {#opt-perSystem.treefmt.programs.dockfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "Dockerfile"
  "*/Dockerfile"
  "*.Dockerfile"
  "Dockerfile.*"
  "*/Dockerfile.*"
  "*.dockerfile"
  "dockerfile.*"
  "*/dockerfile.*"
]
```

*Declared by:*
 - [treefmt-nix/programs/dockfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockfmt.nix)



## perSystem\.treefmt\.programs\.dockfmt\.priority {#opt-perSystem.treefmt.programs.dockfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dockfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dockfmt.nix)



## perSystem\.treefmt\.programs\.dos2unix\.enable {#opt-perSystem.treefmt.programs.dos2unix.enable}



Whether to enable dos2unix\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dos2unix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dos2unix.nix)



## perSystem\.treefmt\.programs\.dos2unix\.package {#opt-perSystem.treefmt.programs.dos2unix.package}



The dos2unix package to use\.



*Type:*
package



*Default:*
` pkgs.dos2unix `

*Declared by:*
 - [treefmt-nix/programs/dos2unix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dos2unix.nix)



## perSystem\.treefmt\.programs\.dos2unix\.excludes {#opt-perSystem.treefmt.programs.dos2unix.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dos2unix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dos2unix.nix)



## perSystem\.treefmt\.programs\.dos2unix\.finalPackage {#opt-perSystem.treefmt.programs.dos2unix.finalPackage}



Resulting ` dos2unix ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dos2unix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dos2unix.nix)



## perSystem\.treefmt\.programs\.dos2unix\.includes {#opt-perSystem.treefmt.programs.dos2unix.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [treefmt-nix/programs/dos2unix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dos2unix.nix)



## perSystem\.treefmt\.programs\.dos2unix\.priority {#opt-perSystem.treefmt.programs.dos2unix.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dos2unix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dos2unix.nix)



## perSystem\.treefmt\.programs\.dprint\.enable {#opt-perSystem.treefmt.programs.dprint.enable}



Whether to enable dprint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.package {#opt-perSystem.treefmt.programs.dprint.package}



The dprint package to use\.



*Type:*
package



*Default:*
` pkgs.dprint `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.excludes {#opt-perSystem.treefmt.programs.dprint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.finalPackage {#opt-perSystem.treefmt.programs.dprint.finalPackage}



Resulting ` dprint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.includes {#opt-perSystem.treefmt.programs.dprint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".*"
]
```

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.priority {#opt-perSystem.treefmt.programs.dprint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings {#opt-perSystem.treefmt.programs.dprint.settings}



Configuration to generate dprint\.json with



*Type:*
open submodule of (JSON value)



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings\.extends {#opt-perSystem.treefmt.programs.dprint.settings.extends}



Configurations to extend\.



*Type:*
null or string or list of string



*Default:*
` null `



*Example:*
` "https://dprint.dev/path/to/config/file.v1.json" `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings\.incremental {#opt-perSystem.treefmt.programs.dprint.settings.incremental}



Whether to format files only when they change\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings\.indentWidth {#opt-perSystem.treefmt.programs.dprint.settings.indentWidth}



The number of characters for an indent



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings\.lineWidth {#opt-perSystem.treefmt.programs.dprint.settings.lineWidth}



The width of a line the printer will try to stay under\. Note that the
printer may exceed this width in certain cases\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 80 `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings\.newLineKind {#opt-perSystem.treefmt.programs.dprint.settings.newLineKind}



The kind of newline to use (one of: auto, crlf, lf, system)\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "auto" `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings\.plugins {#opt-perSystem.treefmt.programs.dprint.settings.plugins}



Array of plugin URLs to format files\.



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
# (recommended) using plugins from nixpkgs
# plugins is the list of all available dprint plugins in nixpkgs
(pkgs.dprint-plugins.getPluginList (
  plugins: with plugins; [
    dprint-plugin-toml
    dprint-plugin-dockerfile
    g-plane-pretty_yaml
    # (pkgs.callPackage ./dprint/plugins/sample.nix {})
  ]
))
# (not recommended) using url plugins
# treefmt then only works outside the nix sandbox, so treefmt nix flake check will fail
++ [
  "https://plugins.dprint.dev/json-0.17.2.wasm"
  "https://plugins.dprint.dev/markdown-0.15.2.wasm"
  "https://plugins.dprint.dev/typescript-0.84.4.wasm"
]

```

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dprint\.settings\.useTabs {#opt-perSystem.treefmt.programs.dprint.settings.useTabs}



Whether to use tabs (true) or spaces (false) for indentation\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dprint.nix)



## perSystem\.treefmt\.programs\.dscanner\.enable {#opt-perSystem.treefmt.programs.dscanner.enable}



Whether to enable dscanner\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/dscanner\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dscanner.nix)



## perSystem\.treefmt\.programs\.dscanner\.package {#opt-perSystem.treefmt.programs.dscanner.package}



The dscanner package to use\.



*Type:*
package



*Default:*
` pkgs.dscanner `

*Declared by:*
 - [treefmt-nix/programs/dscanner\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dscanner.nix)



## perSystem\.treefmt\.programs\.dscanner\.excludes {#opt-perSystem.treefmt.programs.dscanner.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/dscanner\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dscanner.nix)



## perSystem\.treefmt\.programs\.dscanner\.finalPackage {#opt-perSystem.treefmt.programs.dscanner.finalPackage}



Resulting ` dscanner ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/dscanner\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dscanner.nix)



## perSystem\.treefmt\.programs\.dscanner\.includes {#opt-perSystem.treefmt.programs.dscanner.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.d"
]
```

*Declared by:*
 - [treefmt-nix/programs/dscanner\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dscanner.nix)



## perSystem\.treefmt\.programs\.dscanner\.priority {#opt-perSystem.treefmt.programs.dscanner.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/dscanner\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/dscanner.nix)



## perSystem\.treefmt\.programs\.efmt\.enable {#opt-perSystem.treefmt.programs.efmt.enable}



Whether to enable efmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/efmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/efmt.nix)



## perSystem\.treefmt\.programs\.efmt\.package {#opt-perSystem.treefmt.programs.efmt.package}



The efmt package to use\.



*Type:*
package



*Default:*
` pkgs.efmt `

*Declared by:*
 - [treefmt-nix/programs/efmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/efmt.nix)



## perSystem\.treefmt\.programs\.efmt\.excludes {#opt-perSystem.treefmt.programs.efmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/efmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/efmt.nix)



## perSystem\.treefmt\.programs\.efmt\.finalPackage {#opt-perSystem.treefmt.programs.efmt.finalPackage}



Resulting ` efmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/efmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/efmt.nix)



## perSystem\.treefmt\.programs\.efmt\.includes {#opt-perSystem.treefmt.programs.efmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.erl"
  "*.hrl"
  "*.app"
  "*.app.src"
  "*.config"
  "*.script"
  "*.escript"
]
```

*Declared by:*
 - [treefmt-nix/programs/efmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/efmt.nix)



## perSystem\.treefmt\.programs\.efmt\.priority {#opt-perSystem.treefmt.programs.efmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/efmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/efmt.nix)



## perSystem\.treefmt\.programs\.elm-format\.enable {#opt-perSystem.treefmt.programs.elm-format.enable}



Whether to enable elm-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/elm-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/elm-format.nix)



## perSystem\.treefmt\.programs\.elm-format\.package {#opt-perSystem.treefmt.programs.elm-format.package}



The elm-format package to use\.



*Type:*
package



*Default:*
` pkgs.elmPackages.elm-format `

*Declared by:*
 - [treefmt-nix/programs/elm-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/elm-format.nix)



## perSystem\.treefmt\.programs\.elm-format\.excludes {#opt-perSystem.treefmt.programs.elm-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/elm-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/elm-format.nix)



## perSystem\.treefmt\.programs\.elm-format\.finalPackage {#opt-perSystem.treefmt.programs.elm-format.finalPackage}



Resulting ` elm-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/elm-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/elm-format.nix)



## perSystem\.treefmt\.programs\.elm-format\.includes {#opt-perSystem.treefmt.programs.elm-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.elm"
]
```

*Declared by:*
 - [treefmt-nix/programs/elm-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/elm-format.nix)



## perSystem\.treefmt\.programs\.elm-format\.priority {#opt-perSystem.treefmt.programs.elm-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/elm-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/elm-format.nix)



## perSystem\.treefmt\.programs\.erlfmt\.enable {#opt-perSystem.treefmt.programs.erlfmt.enable}



Whether to enable erlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/erlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/erlfmt.nix)



## perSystem\.treefmt\.programs\.erlfmt\.package {#opt-perSystem.treefmt.programs.erlfmt.package}



The erlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.erlfmt `

*Declared by:*
 - [treefmt-nix/programs/erlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/erlfmt.nix)



## perSystem\.treefmt\.programs\.erlfmt\.excludes {#opt-perSystem.treefmt.programs.erlfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/erlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/erlfmt.nix)



## perSystem\.treefmt\.programs\.erlfmt\.finalPackage {#opt-perSystem.treefmt.programs.erlfmt.finalPackage}



Resulting ` erlfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/erlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/erlfmt.nix)



## perSystem\.treefmt\.programs\.erlfmt\.includes {#opt-perSystem.treefmt.programs.erlfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.erl"
  "*.hrl"
  "*.app"
  "*.app.src"
  "*.config"
  "*.script"
  "*.escript"
]
```

*Declared by:*
 - [treefmt-nix/programs/erlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/erlfmt.nix)



## perSystem\.treefmt\.programs\.erlfmt\.print-width {#opt-perSystem.treefmt.programs.erlfmt.print-width}



The line length that formatter would wrap on



*Type:*
signed integer



*Default:*
` 100 `



*Example:*
` 80 `

*Declared by:*
 - [treefmt-nix/programs/erlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/erlfmt.nix)



## perSystem\.treefmt\.programs\.erlfmt\.priority {#opt-perSystem.treefmt.programs.erlfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/erlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/erlfmt.nix)



## perSystem\.treefmt\.programs\.fantomas\.enable {#opt-perSystem.treefmt.programs.fantomas.enable}



Whether to enable fantomas\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/fantomas\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fantomas.nix)



## perSystem\.treefmt\.programs\.fantomas\.package {#opt-perSystem.treefmt.programs.fantomas.package}



The fantomas package to use\.



*Type:*
package



*Default:*
` pkgs.fantomas `

*Declared by:*
 - [treefmt-nix/programs/fantomas\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fantomas.nix)



## perSystem\.treefmt\.programs\.fantomas\.dotnet-sdk {#opt-perSystem.treefmt.programs.fantomas.dotnet-sdk}



The dotnet-sdk package to use\.



*Type:*
package



*Default:*
` pkgs.dotnet-sdk `

*Declared by:*
 - [treefmt-nix/programs/fantomas\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fantomas.nix)



## perSystem\.treefmt\.programs\.fantomas\.excludes {#opt-perSystem.treefmt.programs.fantomas.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/fantomas\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fantomas.nix)



## perSystem\.treefmt\.programs\.fantomas\.finalPackage {#opt-perSystem.treefmt.programs.fantomas.finalPackage}



Resulting ` fantomas ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/fantomas\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fantomas.nix)



## perSystem\.treefmt\.programs\.fantomas\.includes {#opt-perSystem.treefmt.programs.fantomas.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.fs"
  "*.fsx"
  "*.fsi"
  "*.ml"
  "*.mli"
]
```

*Declared by:*
 - [treefmt-nix/programs/fantomas\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fantomas.nix)



## perSystem\.treefmt\.programs\.fantomas\.priority {#opt-perSystem.treefmt.programs.fantomas.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/fantomas\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fantomas.nix)



## perSystem\.treefmt\.programs\.fish_indent\.enable {#opt-perSystem.treefmt.programs.fish_indent.enable}



Whether to enable fish_indent\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/fish_indent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fish_indent.nix)



## perSystem\.treefmt\.programs\.fish_indent\.package {#opt-perSystem.treefmt.programs.fish_indent.package}



The fish package to use\.



*Type:*
package



*Default:*
` pkgs.fish `

*Declared by:*
 - [treefmt-nix/programs/fish_indent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fish_indent.nix)



## perSystem\.treefmt\.programs\.fish_indent\.excludes {#opt-perSystem.treefmt.programs.fish_indent.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/fish_indent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fish_indent.nix)



## perSystem\.treefmt\.programs\.fish_indent\.finalPackage {#opt-perSystem.treefmt.programs.fish_indent.finalPackage}



Resulting ` fish_indent ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/fish_indent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fish_indent.nix)



## perSystem\.treefmt\.programs\.fish_indent\.includes {#opt-perSystem.treefmt.programs.fish_indent.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.fish"
]
```

*Declared by:*
 - [treefmt-nix/programs/fish_indent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fish_indent.nix)



## perSystem\.treefmt\.programs\.fish_indent\.priority {#opt-perSystem.treefmt.programs.fish_indent.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/fish_indent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fish_indent.nix)



## perSystem\.treefmt\.programs\.fnlfmt\.enable {#opt-perSystem.treefmt.programs.fnlfmt.enable}



Whether to enable fnlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/fnlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fnlfmt.nix)



## perSystem\.treefmt\.programs\.fnlfmt\.package {#opt-perSystem.treefmt.programs.fnlfmt.package}



The fnlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.fnlfmt `

*Declared by:*
 - [treefmt-nix/programs/fnlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fnlfmt.nix)



## perSystem\.treefmt\.programs\.fnlfmt\.excludes {#opt-perSystem.treefmt.programs.fnlfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/fnlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fnlfmt.nix)



## perSystem\.treefmt\.programs\.fnlfmt\.finalPackage {#opt-perSystem.treefmt.programs.fnlfmt.finalPackage}



Resulting ` fnlfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/fnlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fnlfmt.nix)



## perSystem\.treefmt\.programs\.fnlfmt\.includes {#opt-perSystem.treefmt.programs.fnlfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.fnl"
]
```

*Declared by:*
 - [treefmt-nix/programs/fnlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fnlfmt.nix)



## perSystem\.treefmt\.programs\.fnlfmt\.priority {#opt-perSystem.treefmt.programs.fnlfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/fnlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fnlfmt.nix)



## perSystem\.treefmt\.programs\.formatjson5\.enable {#opt-perSystem.treefmt.programs.formatjson5.enable}



Whether to enable formatjson5\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.package {#opt-perSystem.treefmt.programs.formatjson5.package}



The formatjson5 package to use\.



*Type:*
package



*Default:*
` pkgs.formatjson5 `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.excludes {#opt-perSystem.treefmt.programs.formatjson5.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.finalPackage {#opt-perSystem.treefmt.programs.formatjson5.finalPackage}



Resulting ` formatjson5 ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.includes {#opt-perSystem.treefmt.programs.formatjson5.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.json5"
]
```

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.indent {#opt-perSystem.treefmt.programs.formatjson5.indent}



Indent by the given number of spaces



*Type:*
signed integer



*Default:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.noTrailingCommas {#opt-perSystem.treefmt.programs.formatjson5.noTrailingCommas}



Suppress trailing commas (otherwise added by default)



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.oneElementLines {#opt-perSystem.treefmt.programs.formatjson5.oneElementLines}



Objects or arrays with a single child should collapse to a single line



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.priority {#opt-perSystem.treefmt.programs.formatjson5.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.formatjson5\.sortArrays {#opt-perSystem.treefmt.programs.formatjson5.sortArrays}



Sort arrays of primitive values (string, number, boolean, or null) lexicographically



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/formatjson5\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/formatjson5.nix)



## perSystem\.treefmt\.programs\.fourmolu\.enable {#opt-perSystem.treefmt.programs.fourmolu.enable}



Whether to enable fourmolu\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/fourmolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fourmolu.nix)



## perSystem\.treefmt\.programs\.fourmolu\.package {#opt-perSystem.treefmt.programs.fourmolu.package}



The fourmolu package to use\.



*Type:*
package



*Default:*
` pkgs.haskellPackages.fourmolu `

*Declared by:*
 - [treefmt-nix/programs/fourmolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fourmolu.nix)



## perSystem\.treefmt\.programs\.fourmolu\.excludes {#opt-perSystem.treefmt.programs.fourmolu.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/fourmolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fourmolu.nix)



## perSystem\.treefmt\.programs\.fourmolu\.finalPackage {#opt-perSystem.treefmt.programs.fourmolu.finalPackage}



Resulting ` fourmolu ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/fourmolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fourmolu.nix)



## perSystem\.treefmt\.programs\.fourmolu\.ghcOpts {#opt-perSystem.treefmt.programs.fourmolu.ghcOpts}



Which GHC language extensions to enable



*Type:*
unspecified value



*Default:*

```
[
  "BangPatterns"
  "PatternSynonyms"
  "TypeApplications"
]
```

*Declared by:*
 - [treefmt-nix/programs/fourmolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fourmolu.nix)



## perSystem\.treefmt\.programs\.fourmolu\.includes {#opt-perSystem.treefmt.programs.fourmolu.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [treefmt-nix/programs/fourmolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fourmolu.nix)



## perSystem\.treefmt\.programs\.fourmolu\.priority {#opt-perSystem.treefmt.programs.fourmolu.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/fourmolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fourmolu.nix)



## perSystem\.treefmt\.programs\.fprettify\.enable {#opt-perSystem.treefmt.programs.fprettify.enable}



Whether to enable fprettify\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/fprettify\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fprettify.nix)



## perSystem\.treefmt\.programs\.fprettify\.package {#opt-perSystem.treefmt.programs.fprettify.package}



The fprettify package to use\.



*Type:*
package



*Default:*
` pkgs.fprettify `

*Declared by:*
 - [treefmt-nix/programs/fprettify\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fprettify.nix)



## perSystem\.treefmt\.programs\.fprettify\.excludes {#opt-perSystem.treefmt.programs.fprettify.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/fprettify\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fprettify.nix)



## perSystem\.treefmt\.programs\.fprettify\.finalPackage {#opt-perSystem.treefmt.programs.fprettify.finalPackage}



Resulting ` fprettify ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/fprettify\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fprettify.nix)



## perSystem\.treefmt\.programs\.fprettify\.includes {#opt-perSystem.treefmt.programs.fprettify.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.f90"
]
```

*Declared by:*
 - [treefmt-nix/programs/fprettify\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fprettify.nix)



## perSystem\.treefmt\.programs\.fprettify\.priority {#opt-perSystem.treefmt.programs.fprettify.priority}

Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/fprettify\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/fprettify.nix)



## perSystem\.treefmt\.programs\.gdformat\.enable {#opt-perSystem.treefmt.programs.gdformat.enable}



Whether to enable gdformat\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/gdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gdformat.nix)



## perSystem\.treefmt\.programs\.gdformat\.package {#opt-perSystem.treefmt.programs.gdformat.package}



The gdtoolkit_4 package to use\.



*Type:*
package



*Default:*
` pkgs.gdtoolkit_4 `

*Declared by:*
 - [treefmt-nix/programs/gdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gdformat.nix)



## perSystem\.treefmt\.programs\.gdformat\.excludes {#opt-perSystem.treefmt.programs.gdformat.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/gdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gdformat.nix)



## perSystem\.treefmt\.programs\.gdformat\.finalPackage {#opt-perSystem.treefmt.programs.gdformat.finalPackage}



Resulting ` gdformat ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/gdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gdformat.nix)



## perSystem\.treefmt\.programs\.gdformat\.includes {#opt-perSystem.treefmt.programs.gdformat.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.gd"
]
```

*Declared by:*
 - [treefmt-nix/programs/gdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gdformat.nix)



## perSystem\.treefmt\.programs\.gdformat\.priority {#opt-perSystem.treefmt.programs.gdformat.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/gdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gdformat.nix)



## perSystem\.treefmt\.programs\.genemichaels\.enable {#opt-perSystem.treefmt.programs.genemichaels.enable}



Whether to enable [` genemichaels `](https://github\.com/andrewbaxter/genemichaels/blob/master/readme_genemichaels\.md), a Rust code formatter\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.package {#opt-perSystem.treefmt.programs.genemichaels.package}



The genemichaels package to use\.



*Type:*
package



*Default:*
` pkgs.genemichaels `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.excludes {#opt-perSystem.treefmt.programs.genemichaels.excludes}



Path / file patterns to exclude for genemichaels\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.includes {#opt-perSystem.treefmt.programs.genemichaels.includes}



Path / file patterns to include for genemichaels\.



*Type:*
list of string



*Default:*

```
[
  "*.rs"
]
```

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.comment_errors_fatal {#opt-perSystem.treefmt.programs.genemichaels.settings.comment_errors_fatal}



If reformatting comments results in an error, abort formatting the
document\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.comment_width {#opt-perSystem.treefmt.programs.genemichaels.settings.comment_width}



Maximum relative line length for comments (past the comment
indentation level)\. Can be ` null ` to disable relative wrapping\. If
disabled, still wraps at ` max_width `\.



*Type:*
null or (positive integer, meaning >0)



*Default:*
` 80 `



*Example:*
` null `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.keep_max_blank_lines {#opt-perSystem.treefmt.programs.genemichaels.settings.keep_max_blank_lines}



Genemichaels will replace line breaks with it’s own deterministic
line breaks\. You can use this to keep extra line breaks (1 will keep
up to 1 extra line break) during comment extraction\. This is unused
during formatting\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 0 `



*Example:*
` 1 `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.max_width {#opt-perSystem.treefmt.programs.genemichaels.settings.max_width}



Ideal maximum line width\. If there’s an unbreakable element the line
won’t be split\.



*Type:*
positive integer, meaning >0



*Default:*
` 120 `



*Example:*
` 80 `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.root_splits {#opt-perSystem.treefmt.programs.genemichaels.settings.root_splits}



When breaking a child element, also break all parent elements\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.split_attributes {#opt-perSystem.treefmt.programs.genemichaels.settings.split_attributes}



Break a ` #[] ` on a separate line before the element it’s associated
with\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.split_brace_threshold {#opt-perSystem.treefmt.programs.genemichaels.settings.split_brace_threshold}



Break a ` () ` or ` {} ` if it has greater than this number of children\.
Set to ` null ` to disable breaking due to high child counts\.



*Type:*
null or (positive integer, meaning >0)



*Default:*
` 1 `



*Example:*
` null `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settings\.split_where {#opt-perSystem.treefmt.programs.genemichaels.settings.split_where}



Put the ` where ` clause on a new line\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.settingsFile {#opt-perSystem.treefmt.programs.genemichaels.settingsFile}



The configuration file used by ` genemichaels `\.



*Type:*
absolute path



*Default:*
Generated JSON file from ` perSystem.treefmt.programs.genemichaels.settings `



*Example:*
` ./.genemichaels.json `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.genemichaels\.threadCount {#opt-perSystem.treefmt.programs.genemichaels.threadCount}



How many threads to use for formatting multiple files\. Set to ` null ` to
default to the number of cores on the system\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 1 `

*Declared by:*
 - [treefmt-nix/programs/genemichaels\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/genemichaels.nix)



## perSystem\.treefmt\.programs\.gleam\.enable {#opt-perSystem.treefmt.programs.gleam.enable}



Whether to enable gleam\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/gleam\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gleam.nix)



## perSystem\.treefmt\.programs\.gleam\.package {#opt-perSystem.treefmt.programs.gleam.package}



The gleam package to use\.



*Type:*
package



*Default:*
` pkgs.gleam `

*Declared by:*
 - [treefmt-nix/programs/gleam\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gleam.nix)



## perSystem\.treefmt\.programs\.gleam\.excludes {#opt-perSystem.treefmt.programs.gleam.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/gleam\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gleam.nix)



## perSystem\.treefmt\.programs\.gleam\.finalPackage {#opt-perSystem.treefmt.programs.gleam.finalPackage}



Resulting ` gleam ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/gleam\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gleam.nix)



## perSystem\.treefmt\.programs\.gleam\.includes {#opt-perSystem.treefmt.programs.gleam.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.gleam"
]
```

*Declared by:*
 - [treefmt-nix/programs/gleam\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gleam.nix)



## perSystem\.treefmt\.programs\.gleam\.priority {#opt-perSystem.treefmt.programs.gleam.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/gleam\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gleam.nix)



## perSystem\.treefmt\.programs\.gofmt\.enable {#opt-perSystem.treefmt.programs.gofmt.enable}



Whether to enable gofmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/gofmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofmt.nix)



## perSystem\.treefmt\.programs\.gofmt\.package {#opt-perSystem.treefmt.programs.gofmt.package}



The go package to use\.



*Type:*
package



*Default:*
` pkgs.go `

*Declared by:*
 - [treefmt-nix/programs/gofmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofmt.nix)



## perSystem\.treefmt\.programs\.gofmt\.excludes {#opt-perSystem.treefmt.programs.gofmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [treefmt-nix/programs/gofmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofmt.nix)



## perSystem\.treefmt\.programs\.gofmt\.finalPackage {#opt-perSystem.treefmt.programs.gofmt.finalPackage}



Resulting ` gofmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/gofmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofmt.nix)



## perSystem\.treefmt\.programs\.gofmt\.includes {#opt-perSystem.treefmt.programs.gofmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [treefmt-nix/programs/gofmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofmt.nix)



## perSystem\.treefmt\.programs\.gofmt\.priority {#opt-perSystem.treefmt.programs.gofmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/gofmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofmt.nix)



## perSystem\.treefmt\.programs\.gofumpt\.enable {#opt-perSystem.treefmt.programs.gofumpt.enable}



Whether to enable gofumpt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/gofumpt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofumpt.nix)



## perSystem\.treefmt\.programs\.gofumpt\.package {#opt-perSystem.treefmt.programs.gofumpt.package}



The gofumpt package to use\.



*Type:*
package



*Default:*
` pkgs.gofumpt `

*Declared by:*
 - [treefmt-nix/programs/gofumpt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofumpt.nix)



## perSystem\.treefmt\.programs\.gofumpt\.excludes {#opt-perSystem.treefmt.programs.gofumpt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [treefmt-nix/programs/gofumpt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofumpt.nix)



## perSystem\.treefmt\.programs\.gofumpt\.extra {#opt-perSystem.treefmt.programs.gofumpt.extra}



Whether to enable extra rules\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/gofumpt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofumpt.nix)



## perSystem\.treefmt\.programs\.gofumpt\.finalPackage {#opt-perSystem.treefmt.programs.gofumpt.finalPackage}



Resulting ` gofumpt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/gofumpt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofumpt.nix)



## perSystem\.treefmt\.programs\.gofumpt\.includes {#opt-perSystem.treefmt.programs.gofumpt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [treefmt-nix/programs/gofumpt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofumpt.nix)



## perSystem\.treefmt\.programs\.gofumpt\.priority {#opt-perSystem.treefmt.programs.gofumpt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/gofumpt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/gofumpt.nix)



## perSystem\.treefmt\.programs\.goimports\.enable {#opt-perSystem.treefmt.programs.goimports.enable}



Whether to enable goimports\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/goimports\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/goimports.nix)



## perSystem\.treefmt\.programs\.goimports\.package {#opt-perSystem.treefmt.programs.goimports.package}



The gotools package to use\.



*Type:*
package



*Default:*
` pkgs.gotools `

*Declared by:*
 - [treefmt-nix/programs/goimports\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/goimports.nix)



## perSystem\.treefmt\.programs\.goimports\.excludes {#opt-perSystem.treefmt.programs.goimports.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [treefmt-nix/programs/goimports\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/goimports.nix)



## perSystem\.treefmt\.programs\.goimports\.finalPackage {#opt-perSystem.treefmt.programs.goimports.finalPackage}



Resulting ` goimports ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/goimports\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/goimports.nix)



## perSystem\.treefmt\.programs\.goimports\.includes {#opt-perSystem.treefmt.programs.goimports.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [treefmt-nix/programs/goimports\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/goimports.nix)



## perSystem\.treefmt\.programs\.goimports\.priority {#opt-perSystem.treefmt.programs.goimports.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/goimports\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/goimports.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.enable {#opt-perSystem.treefmt.programs.golangci-lint.enable}



Whether to enable golangci-lint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.enableLinters {#opt-perSystem.treefmt.programs.golangci-lint.enableLinters}



Enable specific linters



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "govet"
  "errcheck"
  "staticcheck"
]
```

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.enableOnly {#opt-perSystem.treefmt.programs.golangci-lint.enableOnly}



Override configuration to run only specific linter(s)



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "govet"
  "gofmt"
]
```

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.package {#opt-perSystem.treefmt.programs.golangci-lint.package}



The golangci-lint package to use\.



*Type:*
package



*Default:*
` pkgs.golangci-lint `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.buildTags {#opt-perSystem.treefmt.programs.golangci-lint.buildTags}



Build tags to use during analysis



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "integration"
  "e2e"
]
```

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.concurrency {#opt-perSystem.treefmt.programs.golangci-lint.concurrency}



Number of CPUs to use (auto-configured by default)



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.configFile {#opt-perSystem.treefmt.programs.golangci-lint.configFile}



Path to golangci-lint configuration file



*Type:*
null or string



*Default:*
` null `



*Example:*
` ".golangci.yml" `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.disableLinters {#opt-perSystem.treefmt.programs.golangci-lint.disableLinters}



Disable specific linters



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "typecheck"
]
```

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.excludes {#opt-perSystem.treefmt.programs.golangci-lint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.fastOnly {#opt-perSystem.treefmt.programs.golangci-lint.fastOnly}



Run only fast linters from enabled linters set



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.finalPackage {#opt-perSystem.treefmt.programs.golangci-lint.finalPackage}



Resulting ` golangci-lint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.includes {#opt-perSystem.treefmt.programs.golangci-lint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.maxIssuesPerLinter {#opt-perSystem.treefmt.programs.golangci-lint.maxIssuesPerLinter}



Maximum issues per linter (default: 50)



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 50 `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.maxSameIssues {#opt-perSystem.treefmt.programs.golangci-lint.maxSameIssues}



Maximum count of same issues (default: 3)



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 3 `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.newFromRev {#opt-perSystem.treefmt.programs.golangci-lint.newFromRev}



Show only new issues created after git revision REV



*Type:*
null or string



*Default:*
` null `



*Example:*
` "HEAD~1" `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.noConfig {#opt-perSystem.treefmt.programs.golangci-lint.noConfig}



Don’t read any configuration file



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.priority {#opt-perSystem.treefmt.programs.golangci-lint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.tests {#opt-perSystem.treefmt.programs.golangci-lint.tests}



Analyze test files



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.timeout {#opt-perSystem.treefmt.programs.golangci-lint.timeout}



Timeout for total work (e\.g\., ‘5m’, ‘1h’, ‘10s’)



*Type:*
null or string



*Default:*
` null `



*Example:*
` "5m" `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golangci-lint\.verbose {#opt-perSystem.treefmt.programs.golangci-lint.verbose}



Enable verbose output



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/golangci-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golangci-lint.nix)



## perSystem\.treefmt\.programs\.golines\.enable {#opt-perSystem.treefmt.programs.golines.enable}



Whether to enable golines\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.golines\.package {#opt-perSystem.treefmt.programs.golines.package}



The golines package to use\.



*Type:*
package



*Default:*
` pkgs.golines `

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.golines\.excludes {#opt-perSystem.treefmt.programs.golines.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.golines\.finalPackage {#opt-perSystem.treefmt.programs.golines.finalPackage}



Resulting ` golines ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.golines\.includes {#opt-perSystem.treefmt.programs.golines.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.golines\.maxLength {#opt-perSystem.treefmt.programs.golines.maxLength}



Target maximum line length (default: 100)



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 100 `

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.golines\.priority {#opt-perSystem.treefmt.programs.golines.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.golines\.tabLength {#opt-perSystem.treefmt.programs.golines.tabLength}



Length of a tab (default: 4)



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/golines\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/golines.nix)



## perSystem\.treefmt\.programs\.google-java-format\.enable {#opt-perSystem.treefmt.programs.google-java-format.enable}



Whether to enable google-java-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/google-java-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/google-java-format.nix)



## perSystem\.treefmt\.programs\.google-java-format\.package {#opt-perSystem.treefmt.programs.google-java-format.package}



The google-java-format package to use\.



*Type:*
package



*Default:*
` pkgs.google-java-format `

*Declared by:*
 - [treefmt-nix/programs/google-java-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/google-java-format.nix)



## perSystem\.treefmt\.programs\.google-java-format\.aospStyle {#opt-perSystem.treefmt.programs.google-java-format.aospStyle}



Whether to use AOSP (Android Open Source Project) indentation\.
In a few words, use 4-space indentation rather than the conventional
2-space indentation width that Google uses\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/google-java-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/google-java-format.nix)



## perSystem\.treefmt\.programs\.google-java-format\.excludes {#opt-perSystem.treefmt.programs.google-java-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/google-java-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/google-java-format.nix)



## perSystem\.treefmt\.programs\.google-java-format\.finalPackage {#opt-perSystem.treefmt.programs.google-java-format.finalPackage}



Resulting ` google-java-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/google-java-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/google-java-format.nix)



## perSystem\.treefmt\.programs\.google-java-format\.includes {#opt-perSystem.treefmt.programs.google-java-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.java"
]
```

*Declared by:*
 - [treefmt-nix/programs/google-java-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/google-java-format.nix)



## perSystem\.treefmt\.programs\.google-java-format\.priority {#opt-perSystem.treefmt.programs.google-java-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/google-java-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/google-java-format.nix)



## perSystem\.treefmt\.programs\.hclfmt\.enable {#opt-perSystem.treefmt.programs.hclfmt.enable}



Whether to enable hclfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/hclfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hclfmt.nix)



## perSystem\.treefmt\.programs\.hclfmt\.package {#opt-perSystem.treefmt.programs.hclfmt.package}



The hclfmt package to use\.



*Type:*
package



*Default:*
` pkgs.hclfmt `

*Declared by:*
 - [treefmt-nix/programs/hclfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hclfmt.nix)



## perSystem\.treefmt\.programs\.hclfmt\.excludes {#opt-perSystem.treefmt.programs.hclfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/hclfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hclfmt.nix)



## perSystem\.treefmt\.programs\.hclfmt\.finalPackage {#opt-perSystem.treefmt.programs.hclfmt.finalPackage}



Resulting ` hclfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/hclfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hclfmt.nix)



## perSystem\.treefmt\.programs\.hclfmt\.includes {#opt-perSystem.treefmt.programs.hclfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hcl"
]
```

*Declared by:*
 - [treefmt-nix/programs/hclfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hclfmt.nix)



## perSystem\.treefmt\.programs\.hclfmt\.priority {#opt-perSystem.treefmt.programs.hclfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/hclfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hclfmt.nix)



## perSystem\.treefmt\.programs\.hlint\.enable {#opt-perSystem.treefmt.programs.hlint.enable}



Whether to enable hlint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/hlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hlint.nix)



## perSystem\.treefmt\.programs\.hlint\.package {#opt-perSystem.treefmt.programs.hlint.package}



The hlint package to use\.



*Type:*
package



*Default:*
` pkgs.hlint `

*Declared by:*
 - [treefmt-nix/programs/hlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hlint.nix)



## perSystem\.treefmt\.programs\.hlint\.excludes {#opt-perSystem.treefmt.programs.hlint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/hlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hlint.nix)



## perSystem\.treefmt\.programs\.hlint\.finalPackage {#opt-perSystem.treefmt.programs.hlint.finalPackage}



Resulting ` hlint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/hlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hlint.nix)



## perSystem\.treefmt\.programs\.hlint\.includes {#opt-perSystem.treefmt.programs.hlint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [treefmt-nix/programs/hlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hlint.nix)



## perSystem\.treefmt\.programs\.hlint\.priority {#opt-perSystem.treefmt.programs.hlint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/hlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hlint.nix)



## perSystem\.treefmt\.programs\.hujsonfmt\.enable {#opt-perSystem.treefmt.programs.hujsonfmt.enable}



Whether to enable hujsonfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/hujsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hujsonfmt.nix)



## perSystem\.treefmt\.programs\.hujsonfmt\.package {#opt-perSystem.treefmt.programs.hujsonfmt.package}



The hujsonfmt package to use\.



*Type:*
package



*Default:*
` pkgs.hujsonfmt `

*Declared by:*
 - [treefmt-nix/programs/hujsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hujsonfmt.nix)



## perSystem\.treefmt\.programs\.hujsonfmt\.excludes {#opt-perSystem.treefmt.programs.hujsonfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/hujsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hujsonfmt.nix)



## perSystem\.treefmt\.programs\.hujsonfmt\.finalPackage {#opt-perSystem.treefmt.programs.hujsonfmt.finalPackage}



Resulting ` hujsonfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/hujsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hujsonfmt.nix)



## perSystem\.treefmt\.programs\.hujsonfmt\.includes {#opt-perSystem.treefmt.programs.hujsonfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hujson"
]
```

*Declared by:*
 - [treefmt-nix/programs/hujsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hujsonfmt.nix)



## perSystem\.treefmt\.programs\.hujsonfmt\.priority {#opt-perSystem.treefmt.programs.hujsonfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/hujsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/hujsonfmt.nix)



## perSystem\.treefmt\.programs\.isort\.enable {#opt-perSystem.treefmt.programs.isort.enable}



Whether to enable isort\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/isort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/isort.nix)



## perSystem\.treefmt\.programs\.isort\.package {#opt-perSystem.treefmt.programs.isort.package}



The isort package to use\.



*Type:*
package



*Default:*
` pkgs.isort `

*Declared by:*
 - [treefmt-nix/programs/isort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/isort.nix)



## perSystem\.treefmt\.programs\.isort\.excludes {#opt-perSystem.treefmt.programs.isort.excludes}

Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/isort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/isort.nix)



## perSystem\.treefmt\.programs\.isort\.finalPackage {#opt-perSystem.treefmt.programs.isort.finalPackage}



Resulting ` isort ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/isort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/isort.nix)



## perSystem\.treefmt\.programs\.isort\.includes {#opt-perSystem.treefmt.programs.isort.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [treefmt-nix/programs/isort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/isort.nix)



## perSystem\.treefmt\.programs\.isort\.priority {#opt-perSystem.treefmt.programs.isort.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/isort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/isort.nix)



## perSystem\.treefmt\.programs\.isort\.profile {#opt-perSystem.treefmt.programs.isort.profile}



The profile to use for isort\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [treefmt-nix/programs/isort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/isort.nix)



## perSystem\.treefmt\.programs\.jsonfmt\.enable {#opt-perSystem.treefmt.programs.jsonfmt.enable}



Whether to enable jsonfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/jsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonfmt.nix)



## perSystem\.treefmt\.programs\.jsonfmt\.package {#opt-perSystem.treefmt.programs.jsonfmt.package}



The jsonfmt package to use\.



*Type:*
package



*Default:*
` pkgs.jsonfmt `

*Declared by:*
 - [treefmt-nix/programs/jsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonfmt.nix)



## perSystem\.treefmt\.programs\.jsonfmt\.excludes {#opt-perSystem.treefmt.programs.jsonfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/jsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonfmt.nix)



## perSystem\.treefmt\.programs\.jsonfmt\.finalPackage {#opt-perSystem.treefmt.programs.jsonfmt.finalPackage}



Resulting ` jsonfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/jsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonfmt.nix)



## perSystem\.treefmt\.programs\.jsonfmt\.includes {#opt-perSystem.treefmt.programs.jsonfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.json"
]
```

*Declared by:*
 - [treefmt-nix/programs/jsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonfmt.nix)



## perSystem\.treefmt\.programs\.jsonfmt\.priority {#opt-perSystem.treefmt.programs.jsonfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/jsonfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonfmt.nix)



## perSystem\.treefmt\.programs\.jsonnet-lint\.enable {#opt-perSystem.treefmt.programs.jsonnet-lint.enable}



Whether to enable jsonnet-lint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/jsonnet-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnet-lint.nix)



## perSystem\.treefmt\.programs\.jsonnet-lint\.package {#opt-perSystem.treefmt.programs.jsonnet-lint.package}



The go-jsonnet package to use\.



*Type:*
package



*Default:*
` pkgs.go-jsonnet `

*Declared by:*
 - [treefmt-nix/programs/jsonnet-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnet-lint.nix)



## perSystem\.treefmt\.programs\.jsonnet-lint\.excludes {#opt-perSystem.treefmt.programs.jsonnet-lint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/jsonnet-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnet-lint.nix)



## perSystem\.treefmt\.programs\.jsonnet-lint\.finalPackage {#opt-perSystem.treefmt.programs.jsonnet-lint.finalPackage}



Resulting ` jsonnet-lint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/jsonnet-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnet-lint.nix)



## perSystem\.treefmt\.programs\.jsonnet-lint\.includes {#opt-perSystem.treefmt.programs.jsonnet-lint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.jsonnet"
  "*.libsonnet"
]
```

*Declared by:*
 - [treefmt-nix/programs/jsonnet-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnet-lint.nix)



## perSystem\.treefmt\.programs\.jsonnet-lint\.priority {#opt-perSystem.treefmt.programs.jsonnet-lint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/jsonnet-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnet-lint.nix)



## perSystem\.treefmt\.programs\.jsonnetfmt\.enable {#opt-perSystem.treefmt.programs.jsonnetfmt.enable}



Whether to enable jsonnetfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/jsonnetfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnetfmt.nix)



## perSystem\.treefmt\.programs\.jsonnetfmt\.package {#opt-perSystem.treefmt.programs.jsonnetfmt.package}



The go-jsonnet package to use\.



*Type:*
package



*Default:*
` pkgs.go-jsonnet `

*Declared by:*
 - [treefmt-nix/programs/jsonnetfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnetfmt.nix)



## perSystem\.treefmt\.programs\.jsonnetfmt\.excludes {#opt-perSystem.treefmt.programs.jsonnetfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/jsonnetfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnetfmt.nix)



## perSystem\.treefmt\.programs\.jsonnetfmt\.finalPackage {#opt-perSystem.treefmt.programs.jsonnetfmt.finalPackage}



Resulting ` jsonnetfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/jsonnetfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnetfmt.nix)



## perSystem\.treefmt\.programs\.jsonnetfmt\.includes {#opt-perSystem.treefmt.programs.jsonnetfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.jsonnet"
  "*.libsonnet"
]
```

*Declared by:*
 - [treefmt-nix/programs/jsonnetfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnetfmt.nix)



## perSystem\.treefmt\.programs\.jsonnetfmt\.priority {#opt-perSystem.treefmt.programs.jsonnetfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/jsonnetfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/jsonnetfmt.nix)



## perSystem\.treefmt\.programs\.just\.enable {#opt-perSystem.treefmt.programs.just.enable}



Whether to enable just\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/just\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/just.nix)



## perSystem\.treefmt\.programs\.just\.package {#opt-perSystem.treefmt.programs.just.package}



The just package to use\.



*Type:*
package



*Default:*
` pkgs.just `

*Declared by:*
 - [treefmt-nix/programs/just\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/just.nix)



## perSystem\.treefmt\.programs\.just\.excludes {#opt-perSystem.treefmt.programs.just.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/just\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/just.nix)



## perSystem\.treefmt\.programs\.just\.finalPackage {#opt-perSystem.treefmt.programs.just.finalPackage}



Resulting ` just ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/just\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/just.nix)



## perSystem\.treefmt\.programs\.just\.includes {#opt-perSystem.treefmt.programs.just.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  "*/[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  ".[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  "*/.[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  "*.[Jj][Uu][Ss][Tt]"
  "*.[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
]
```

*Declared by:*
 - [treefmt-nix/programs/just\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/just.nix)



## perSystem\.treefmt\.programs\.just\.priority {#opt-perSystem.treefmt.programs.just.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/just\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/just.nix)



## perSystem\.treefmt\.programs\.kdlfmt\.enable {#opt-perSystem.treefmt.programs.kdlfmt.enable}



Whether to enable kdlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/kdlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/kdlfmt.nix)



## perSystem\.treefmt\.programs\.kdlfmt\.package {#opt-perSystem.treefmt.programs.kdlfmt.package}



The kdlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.kdlfmt `

*Declared by:*
 - [treefmt-nix/programs/kdlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/kdlfmt.nix)



## perSystem\.treefmt\.programs\.kdlfmt\.excludes {#opt-perSystem.treefmt.programs.kdlfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/kdlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/kdlfmt.nix)



## perSystem\.treefmt\.programs\.kdlfmt\.finalPackage {#opt-perSystem.treefmt.programs.kdlfmt.finalPackage}



Resulting ` kdlfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/kdlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/kdlfmt.nix)



## perSystem\.treefmt\.programs\.kdlfmt\.includes {#opt-perSystem.treefmt.programs.kdlfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.kdl"
]
```

*Declared by:*
 - [treefmt-nix/programs/kdlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/kdlfmt.nix)



## perSystem\.treefmt\.programs\.kdlfmt\.priority {#opt-perSystem.treefmt.programs.kdlfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/kdlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/kdlfmt.nix)



## perSystem\.treefmt\.programs\.keep-sorted\.enable {#opt-perSystem.treefmt.programs.keep-sorted.enable}



Whether to enable keep-sorted\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/keep-sorted\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/keep-sorted.nix)



## perSystem\.treefmt\.programs\.keep-sorted\.package {#opt-perSystem.treefmt.programs.keep-sorted.package}



The keep-sorted package to use\.



*Type:*
package



*Default:*
` pkgs.keep-sorted `

*Declared by:*
 - [treefmt-nix/programs/keep-sorted\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/keep-sorted.nix)



## perSystem\.treefmt\.programs\.keep-sorted\.excludes {#opt-perSystem.treefmt.programs.keep-sorted.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/keep-sorted\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/keep-sorted.nix)



## perSystem\.treefmt\.programs\.keep-sorted\.finalPackage {#opt-perSystem.treefmt.programs.keep-sorted.finalPackage}



Resulting ` keep-sorted ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/keep-sorted\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/keep-sorted.nix)



## perSystem\.treefmt\.programs\.keep-sorted\.includes {#opt-perSystem.treefmt.programs.keep-sorted.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [treefmt-nix/programs/keep-sorted\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/keep-sorted.nix)



## perSystem\.treefmt\.programs\.keep-sorted\.priority {#opt-perSystem.treefmt.programs.keep-sorted.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/keep-sorted\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/keep-sorted.nix)



## perSystem\.treefmt\.programs\.ktfmt\.enable {#opt-perSystem.treefmt.programs.ktfmt.enable}



Whether to enable ktfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/ktfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktfmt.nix)



## perSystem\.treefmt\.programs\.ktfmt\.package {#opt-perSystem.treefmt.programs.ktfmt.package}



The ktfmt package to use\.



*Type:*
package



*Default:*
` pkgs.ktfmt `

*Declared by:*
 - [treefmt-nix/programs/ktfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktfmt.nix)



## perSystem\.treefmt\.programs\.ktfmt\.excludes {#opt-perSystem.treefmt.programs.ktfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/ktfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktfmt.nix)



## perSystem\.treefmt\.programs\.ktfmt\.finalPackage {#opt-perSystem.treefmt.programs.ktfmt.finalPackage}



Resulting ` ktfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/ktfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktfmt.nix)



## perSystem\.treefmt\.programs\.ktfmt\.includes {#opt-perSystem.treefmt.programs.ktfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.kt"
  "*.kts"
]
```

*Declared by:*
 - [treefmt-nix/programs/ktfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktfmt.nix)



## perSystem\.treefmt\.programs\.ktfmt\.priority {#opt-perSystem.treefmt.programs.ktfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/ktfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktfmt.nix)



## perSystem\.treefmt\.programs\.ktlint\.enable {#opt-perSystem.treefmt.programs.ktlint.enable}



Whether to enable ktlint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/ktlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktlint.nix)



## perSystem\.treefmt\.programs\.ktlint\.package {#opt-perSystem.treefmt.programs.ktlint.package}



The ktlint package to use\.



*Type:*
package



*Default:*
` pkgs.ktlint `

*Declared by:*
 - [treefmt-nix/programs/ktlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktlint.nix)



## perSystem\.treefmt\.programs\.ktlint\.excludes {#opt-perSystem.treefmt.programs.ktlint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/ktlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktlint.nix)



## perSystem\.treefmt\.programs\.ktlint\.finalPackage {#opt-perSystem.treefmt.programs.ktlint.finalPackage}



Resulting ` ktlint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/ktlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktlint.nix)



## perSystem\.treefmt\.programs\.ktlint\.includes {#opt-perSystem.treefmt.programs.ktlint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.kt"
  "*.kts"
]
```

*Declared by:*
 - [treefmt-nix/programs/ktlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktlint.nix)



## perSystem\.treefmt\.programs\.ktlint\.priority {#opt-perSystem.treefmt.programs.ktlint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/ktlint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ktlint.nix)



## perSystem\.treefmt\.programs\.latexindent\.enable {#opt-perSystem.treefmt.programs.latexindent.enable}



Whether to enable latexindent\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/latexindent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/latexindent.nix)



## perSystem\.treefmt\.programs\.latexindent\.package {#opt-perSystem.treefmt.programs.latexindent.package}



The texliveMedium package to use\.



*Type:*
package



*Default:*
` pkgs.texliveMedium `

*Declared by:*
 - [treefmt-nix/programs/latexindent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/latexindent.nix)



## perSystem\.treefmt\.programs\.latexindent\.excludes {#opt-perSystem.treefmt.programs.latexindent.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/latexindent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/latexindent.nix)



## perSystem\.treefmt\.programs\.latexindent\.finalPackage {#opt-perSystem.treefmt.programs.latexindent.finalPackage}



Resulting ` latexindent ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/latexindent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/latexindent.nix)



## perSystem\.treefmt\.programs\.latexindent\.includes {#opt-perSystem.treefmt.programs.latexindent.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.tex"
  "*.sty"
  "*.cls"
  "*.bib"
  "*.cmh"
]
```

*Declared by:*
 - [treefmt-nix/programs/latexindent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/latexindent.nix)



## perSystem\.treefmt\.programs\.latexindent\.priority {#opt-perSystem.treefmt.programs.latexindent.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/latexindent\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/latexindent.nix)



## perSystem\.treefmt\.programs\.leptosfmt\.enable {#opt-perSystem.treefmt.programs.leptosfmt.enable}



Whether to enable leptosfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/leptosfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/leptosfmt.nix)



## perSystem\.treefmt\.programs\.leptosfmt\.package {#opt-perSystem.treefmt.programs.leptosfmt.package}



The leptosfmt package to use\.



*Type:*
package



*Default:*
` pkgs.leptosfmt `

*Declared by:*
 - [treefmt-nix/programs/leptosfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/leptosfmt.nix)



## perSystem\.treefmt\.programs\.leptosfmt\.excludes {#opt-perSystem.treefmt.programs.leptosfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/leptosfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/leptosfmt.nix)



## perSystem\.treefmt\.programs\.leptosfmt\.finalPackage {#opt-perSystem.treefmt.programs.leptosfmt.finalPackage}



Resulting ` leptosfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/leptosfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/leptosfmt.nix)



## perSystem\.treefmt\.programs\.leptosfmt\.includes {#opt-perSystem.treefmt.programs.leptosfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rs"
]
```

*Declared by:*
 - [treefmt-nix/programs/leptosfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/leptosfmt.nix)



## perSystem\.treefmt\.programs\.leptosfmt\.priority {#opt-perSystem.treefmt.programs.leptosfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/leptosfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/leptosfmt.nix)



## perSystem\.treefmt\.programs\.mbake\.enable {#opt-perSystem.treefmt.programs.mbake.enable}



Whether to enable mbake\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.package {#opt-perSystem.treefmt.programs.mbake.package}



The mbake package to use\.



*Type:*
package



*Default:*
` pkgs.mbake `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.excludes {#opt-perSystem.treefmt.programs.mbake.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.finalPackage {#opt-perSystem.treefmt.programs.mbake.finalPackage}



Resulting ` mbake ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.includes {#opt-perSystem.treefmt.programs.mbake.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "Makefile"
  "*/Makefile"
  "*.Makefile"
  "Makefile.*"
  "makefile"
  "*/makefile"
  "*.makefile"
  "makefile.*"
  "*.mk"
]
```

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.priority {#opt-perSystem.treefmt.programs.mbake.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.auto_insert_phony_declarations {#opt-perSystem.treefmt.programs.mbake.settings.auto_insert_phony_declarations}



Whether to automatically insert \.PHONY declarations for non-file targets



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.ensure_final_newline {#opt-perSystem.treefmt.programs.mbake.settings.ensure_final_newline}



Whether to ensure the file ends with a newline



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.fix_missing_recipe_tabs {#opt-perSystem.treefmt.programs.mbake.settings.fix_missing_recipe_tabs}



Whether to fix recipe lines that are missing tabs



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.group_phony_declarations {#opt-perSystem.treefmt.programs.mbake.settings.group_phony_declarations}



Whether to group all \.PHONY declarations together



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.indent_nested_conditionals {#opt-perSystem.treefmt.programs.mbake.settings.indent_nested_conditionals}



Whether to indent nested conditional blocks (ifdef, ifndef, etc\.)



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.max_consecutive_empty_lines {#opt-perSystem.treefmt.programs.mbake.settings.max_consecutive_empty_lines}



Maximum number of consecutive empty lines allowed



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.max_line_length {#opt-perSystem.treefmt.programs.mbake.settings.max_line_length}



Maximum line length before wrapping



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.normalize_empty_lines {#opt-perSystem.treefmt.programs.mbake.settings.normalize_empty_lines}



Whether to normalize empty lines



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.normalize_line_continuations {#opt-perSystem.treefmt.programs.mbake.settings.normalize_line_continuations}



Whether to normalize line continuation backslashes



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.phony_at_top {#opt-perSystem.treefmt.programs.mbake.settings.phony_at_top}



Whether to place \.PHONY declarations at the top of the file



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.remove_trailing_whitespace {#opt-perSystem.treefmt.programs.mbake.settings.remove_trailing_whitespace}



Whether to remove trailing whitespace from lines



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.space_after_colon {#opt-perSystem.treefmt.programs.mbake.settings.space_after_colon}



Whether to add a space after colons in rules



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.space_around_assignment {#opt-perSystem.treefmt.programs.mbake.settings.space_around_assignment}



Whether to add spaces around assignment operators (=, :=, etc\.)



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.space_before_colon {#opt-perSystem.treefmt.programs.mbake.settings.space_before_colon}



Whether to add a space before colons in rules



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mbake\.settings\.tab_width {#opt-perSystem.treefmt.programs.mbake.settings.tab_width}



Tab width in spaces for display purposes



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mbake\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mbake.nix)



## perSystem\.treefmt\.programs\.mdformat\.enable {#opt-perSystem.treefmt.programs.mdformat.enable}



Whether to enable mdformat\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.package {#opt-perSystem.treefmt.programs.mdformat.package}



The mdformat package to use\.



*Type:*
package



*Default:*
` pkgs.mdformat `

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.excludes {#opt-perSystem.treefmt.programs.mdformat.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.finalPackage {#opt-perSystem.treefmt.programs.mdformat.finalPackage}



Resulting ` mdformat ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.includes {#opt-perSystem.treefmt.programs.mdformat.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.md"
]
```

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.plugins {#opt-perSystem.treefmt.programs.mdformat.plugins}



Plugins for mdformat that extend its functionality (for Markdown
extensions, formatting code blocks, etc)\.

See [mdformat docs](https://mdformat\.readthedocs\.io/en/stable/users/plugins\.html)
for a (non-exhaustive) list of plugins\.



*Type:*
function that evaluates to a(n) list of package



*Default:*

```
ps: [ ];

```



*Example:*

```
ps: [
  ps.mdformat-footnote
  ps.mdformat-gfm
];

```

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.priority {#opt-perSystem.treefmt.programs.mdformat.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.settings\.end-of-line {#opt-perSystem.treefmt.programs.mdformat.settings.end-of-line}



Output file line ending mode\.



*Type:*
null or one of “crlf”, “lf”, “keep”



*Default:*
` null `



*Example:*
` "lf" `

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.settings\.number {#opt-perSystem.treefmt.programs.mdformat.settings.number}



Apply consecutive numbering to ordered lists\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdformat\.settings\.wrap {#opt-perSystem.treefmt.programs.mdformat.settings.wrap}



Paragraph word wrap mode\.
Set to an INTEGER to wrap at that length\.



*Type:*
null or signed integer or one of “keep”, “no”



*Default:*
` null `



*Example:*
` "keep" `

*Declared by:*
 - [treefmt-nix/programs/mdformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdformat.nix)



## perSystem\.treefmt\.programs\.mdsh\.enable {#opt-perSystem.treefmt.programs.mdsh.enable}



Whether to enable mdsh\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/mdsh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdsh.nix)



## perSystem\.treefmt\.programs\.mdsh\.package {#opt-perSystem.treefmt.programs.mdsh.package}



The mdsh package to use\.



*Type:*
package



*Default:*
` pkgs.mdsh `

*Declared by:*
 - [treefmt-nix/programs/mdsh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdsh.nix)



## perSystem\.treefmt\.programs\.mdsh\.excludes {#opt-perSystem.treefmt.programs.mdsh.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/mdsh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdsh.nix)



## perSystem\.treefmt\.programs\.mdsh\.finalPackage {#opt-perSystem.treefmt.programs.mdsh.finalPackage}



Resulting ` mdsh ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/mdsh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdsh.nix)



## perSystem\.treefmt\.programs\.mdsh\.includes {#opt-perSystem.treefmt.programs.mdsh.includes}

Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "README.md"
]
```

*Declared by:*
 - [treefmt-nix/programs/mdsh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdsh.nix)



## perSystem\.treefmt\.programs\.mdsh\.priority {#opt-perSystem.treefmt.programs.mdsh.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mdsh\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mdsh.nix)



## perSystem\.treefmt\.programs\.meson\.enable {#opt-perSystem.treefmt.programs.meson.enable}



Whether to enable meson\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/meson\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/meson.nix)



## perSystem\.treefmt\.programs\.meson\.package {#opt-perSystem.treefmt.programs.meson.package}



The meson package to use\.



*Type:*
package



*Default:*
` pkgs.meson `

*Declared by:*
 - [treefmt-nix/programs/meson\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/meson.nix)



## perSystem\.treefmt\.programs\.meson\.editorconfig {#opt-perSystem.treefmt.programs.meson.editorconfig}



Try to read configuration from \.editorconfig



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/meson\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/meson.nix)



## perSystem\.treefmt\.programs\.meson\.excludes {#opt-perSystem.treefmt.programs.meson.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/meson\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/meson.nix)



## perSystem\.treefmt\.programs\.meson\.finalPackage {#opt-perSystem.treefmt.programs.meson.finalPackage}



Resulting ` meson ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/meson\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/meson.nix)



## perSystem\.treefmt\.programs\.meson\.includes {#opt-perSystem.treefmt.programs.meson.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "meson.build"
  "meson.options"
  "meson_options.txt"
  "*/meson.build"
  "*/meson.options"
  "*/meson_options.txt"
]
```

*Declared by:*
 - [treefmt-nix/programs/meson\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/meson.nix)



## perSystem\.treefmt\.programs\.meson\.priority {#opt-perSystem.treefmt.programs.meson.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/meson\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/meson.nix)



## perSystem\.treefmt\.programs\.mix-format\.enable {#opt-perSystem.treefmt.programs.mix-format.enable}



Whether to enable mix-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/mix-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mix-format.nix)



## perSystem\.treefmt\.programs\.mix-format\.package {#opt-perSystem.treefmt.programs.mix-format.package}



The elixir package to use\.



*Type:*
package



*Default:*
` pkgs.elixir `

*Declared by:*
 - [treefmt-nix/programs/mix-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mix-format.nix)



## perSystem\.treefmt\.programs\.mix-format\.excludes {#opt-perSystem.treefmt.programs.mix-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/mix-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mix-format.nix)



## perSystem\.treefmt\.programs\.mix-format\.finalPackage {#opt-perSystem.treefmt.programs.mix-format.finalPackage}



Resulting ` mix-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/mix-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mix-format.nix)



## perSystem\.treefmt\.programs\.mix-format\.includes {#opt-perSystem.treefmt.programs.mix-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ex"
  "*.exs"
]
```

*Declared by:*
 - [treefmt-nix/programs/mix-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mix-format.nix)



## perSystem\.treefmt\.programs\.mix-format\.priority {#opt-perSystem.treefmt.programs.mix-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/mix-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mix-format.nix)



## perSystem\.treefmt\.programs\.muon\.enable {#opt-perSystem.treefmt.programs.muon.enable}



Whether to enable muon\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/muon\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/muon.nix)



## perSystem\.treefmt\.programs\.muon\.package {#opt-perSystem.treefmt.programs.muon.package}



The muon package to use\.



*Type:*
package



*Default:*
` pkgs.muon `

*Declared by:*
 - [treefmt-nix/programs/muon\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/muon.nix)



## perSystem\.treefmt\.programs\.muon\.editorconfig {#opt-perSystem.treefmt.programs.muon.editorconfig}



Try to read configuration from \.editorconfig



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/muon\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/muon.nix)



## perSystem\.treefmt\.programs\.muon\.excludes {#opt-perSystem.treefmt.programs.muon.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/muon\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/muon.nix)



## perSystem\.treefmt\.programs\.muon\.finalPackage {#opt-perSystem.treefmt.programs.muon.finalPackage}



Resulting ` muon ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/muon\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/muon.nix)



## perSystem\.treefmt\.programs\.muon\.includes {#opt-perSystem.treefmt.programs.muon.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "meson.build"
  "meson.options"
  "meson_options.txt"
  "*/meson.build"
  "*/meson.options"
  "*/meson_options.txt"
]
```

*Declared by:*
 - [treefmt-nix/programs/muon\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/muon.nix)



## perSystem\.treefmt\.programs\.muon\.priority {#opt-perSystem.treefmt.programs.muon.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/muon\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/muon.nix)



## perSystem\.treefmt\.programs\.mypy\.enable {#opt-perSystem.treefmt.programs.mypy.enable}



Whether to enable mypy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.mypy\.package {#opt-perSystem.treefmt.programs.mypy.package}



The mypy package to use\.



*Type:*
package



*Default:*
` pkgs.mypy `

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.mypy\.directories {#opt-perSystem.treefmt.programs.mypy.directories}



Directories to run mypy in



*Type:*
attribute set of (submodule)



*Default:*

```
{
  "" = { };
}
```



*Example:*

```
{
  "" = {
    modules = [
      "mymodule"
      "tests"
    ];
  };
  subdir = { };
}
```

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.mypy\.directories\.\<name>\.directory {#opt-perSystem.treefmt.programs.mypy.directories._name_.directory}



Directory to run mypy in



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.mypy\.directories\.\<name>\.extraPythonPackages {#opt-perSystem.treefmt.programs.mypy.directories._name_.extraPythonPackages}



Extra packages to add to PYTHONPATH



*Type:*
list of package



*Default:*
` [ ] `



*Example:*
\[ pkgs\.python3\.pkgs\.requests ]

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.mypy\.directories\.\<name>\.extraPythonPaths {#opt-perSystem.treefmt.programs.mypy.directories._name_.extraPythonPaths}



Extra paths to add to PYTHONPATH\.
Paths are interpreted relative to the directory options and are added before extraPythonPackages\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "path/to/my/module"
]
```

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.mypy\.directories\.\<name>\.modules {#opt-perSystem.treefmt.programs.mypy.directories._name_.modules}



Modules to check



*Type:*
list of string



*Default:*

```
[
  ""
]
```



*Example:*

```
[
  "mymodule"
  "tests"
]
```

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.mypy\.directories\.\<name>\.options {#opt-perSystem.treefmt.programs.mypy.directories._name_.options}



Options to pass to mypy



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "--ignore-missing-imports"
]
```

*Declared by:*
 - [treefmt-nix/programs/mypy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/mypy.nix)



## perSystem\.treefmt\.programs\.nbstripout\.enable {#opt-perSystem.treefmt.programs.nbstripout.enable}



Whether to enable nbstripout\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/nbstripout\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nbstripout.nix)



## perSystem\.treefmt\.programs\.nbstripout\.package {#opt-perSystem.treefmt.programs.nbstripout.package}



The nbstripout package to use\.



*Type:*
package



*Default:*
` pkgs.nbstripout `

*Declared by:*
 - [treefmt-nix/programs/nbstripout\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nbstripout.nix)



## perSystem\.treefmt\.programs\.nbstripout\.excludes {#opt-perSystem.treefmt.programs.nbstripout.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/nbstripout\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nbstripout.nix)



## perSystem\.treefmt\.programs\.nbstripout\.finalPackage {#opt-perSystem.treefmt.programs.nbstripout.finalPackage}



Resulting ` nbstripout ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/nbstripout\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nbstripout.nix)



## perSystem\.treefmt\.programs\.nbstripout\.includes {#opt-perSystem.treefmt.programs.nbstripout.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ipynb"
]
```

*Declared by:*
 - [treefmt-nix/programs/nbstripout\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nbstripout.nix)



## perSystem\.treefmt\.programs\.nbstripout\.priority {#opt-perSystem.treefmt.programs.nbstripout.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/nbstripout\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nbstripout.nix)



## perSystem\.treefmt\.programs\.nickel\.enable {#opt-perSystem.treefmt.programs.nickel.enable}



Whether to enable nickel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/nickel\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nickel.nix)



## perSystem\.treefmt\.programs\.nickel\.package {#opt-perSystem.treefmt.programs.nickel.package}



The nickel package to use\.



*Type:*
package



*Default:*
` pkgs.nickel `

*Declared by:*
 - [treefmt-nix/programs/nickel\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nickel.nix)



## perSystem\.treefmt\.programs\.nickel\.excludes {#opt-perSystem.treefmt.programs.nickel.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/nickel\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nickel.nix)



## perSystem\.treefmt\.programs\.nickel\.finalPackage {#opt-perSystem.treefmt.programs.nickel.finalPackage}



Resulting ` nickel ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/nickel\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nickel.nix)



## perSystem\.treefmt\.programs\.nickel\.includes {#opt-perSystem.treefmt.programs.nickel.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ncl"
  "*.nickel"
]
```

*Declared by:*
 - [treefmt-nix/programs/nickel\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nickel.nix)



## perSystem\.treefmt\.programs\.nickel\.priority {#opt-perSystem.treefmt.programs.nickel.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/nickel\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nickel.nix)



## perSystem\.treefmt\.programs\.nimpretty\.enable {#opt-perSystem.treefmt.programs.nimpretty.enable}



Whether to enable nimpretty\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/nimpretty\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nimpretty.nix)



## perSystem\.treefmt\.programs\.nimpretty\.package {#opt-perSystem.treefmt.programs.nimpretty.package}



The nim package to use\.



*Type:*
package



*Default:*
` pkgs.nim `

*Declared by:*
 - [treefmt-nix/programs/nimpretty\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nimpretty.nix)



## perSystem\.treefmt\.programs\.nimpretty\.excludes {#opt-perSystem.treefmt.programs.nimpretty.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/nimpretty\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nimpretty.nix)



## perSystem\.treefmt\.programs\.nimpretty\.finalPackage {#opt-perSystem.treefmt.programs.nimpretty.finalPackage}



Resulting ` nimpretty ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/nimpretty\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nimpretty.nix)



## perSystem\.treefmt\.programs\.nimpretty\.includes {#opt-perSystem.treefmt.programs.nimpretty.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nim"
]
```

*Declared by:*
 - [treefmt-nix/programs/nimpretty\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nimpretty.nix)



## perSystem\.treefmt\.programs\.nimpretty\.priority {#opt-perSystem.treefmt.programs.nimpretty.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/nimpretty\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nimpretty.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.enable {#opt-perSystem.treefmt.programs.nixf-diagnose.enable}



Whether to enable nixf-diagnose\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.package {#opt-perSystem.treefmt.programs.nixf-diagnose.package}



The nixf-diagnose package to use\.



*Type:*
package



*Default:*
` pkgs.nixf-diagnose `

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.autoFix {#opt-perSystem.treefmt.programs.nixf-diagnose.autoFix}



Whether to automatically apply fixes to source files\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.excludes {#opt-perSystem.treefmt.programs.nixf-diagnose.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.finalPackage {#opt-perSystem.treefmt.programs.nixf-diagnose.finalPackage}



Resulting ` nixf-diagnose ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.ignore {#opt-perSystem.treefmt.programs.nixf-diagnose.ignore}



Diagnostics to ignore, specified by their ID\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "sema-primop-overridden"
]
```

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.includes {#opt-perSystem.treefmt.programs.nixf-diagnose.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.only {#opt-perSystem.treefmt.programs.nixf-diagnose.only}



Only run this diagnostic\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "sema-primop-overridden" `

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.priority {#opt-perSystem.treefmt.programs.nixf-diagnose.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixf-diagnose\.variableLookup {#opt-perSystem.treefmt.programs.nixf-diagnose.variableLookup}



Whether to enable variable lookup analysis\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/nixf-diagnose\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixf-diagnose.nix)



## perSystem\.treefmt\.programs\.nixfmt\.enable {#opt-perSystem.treefmt.programs.nixfmt.enable}



Whether to enable nixfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.package {#opt-perSystem.treefmt.programs.nixfmt.package}



The nixfmt package to use\.



*Type:*
package



*Default:*
` pkgs.nixfmt `

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.excludes {#opt-perSystem.treefmt.programs.nixfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.finalPackage {#opt-perSystem.treefmt.programs.nixfmt.finalPackage}



Resulting ` nixfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.includes {#opt-perSystem.treefmt.programs.nixfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.indent {#opt-perSystem.treefmt.programs.nixfmt.indent}



Number of spaces to use for indentation \[default: 2]



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.priority {#opt-perSystem.treefmt.programs.nixfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.strict {#opt-perSystem.treefmt.programs.nixfmt.strict}



Enable a stricter formatting mode that isn’t influenced
as much by how the input is formatted\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixfmt\.width {#opt-perSystem.treefmt.programs.nixfmt.width}



Maximum width in characters \[default: 100]



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 120 `

*Declared by:*
 - [treefmt-nix/programs/nixfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixfmt.nix)



## perSystem\.treefmt\.programs\.nixpkgs-fmt\.enable {#opt-perSystem.treefmt.programs.nixpkgs-fmt.enable}



Whether to enable nixpkgs-fmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/nixpkgs-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixpkgs-fmt.nix)



## perSystem\.treefmt\.programs\.nixpkgs-fmt\.package {#opt-perSystem.treefmt.programs.nixpkgs-fmt.package}



The nixpkgs-fmt package to use\.



*Type:*
package



*Default:*
` pkgs.nixpkgs-fmt `

*Declared by:*
 - [treefmt-nix/programs/nixpkgs-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixpkgs-fmt.nix)



## perSystem\.treefmt\.programs\.nixpkgs-fmt\.excludes {#opt-perSystem.treefmt.programs.nixpkgs-fmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/nixpkgs-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixpkgs-fmt.nix)



## perSystem\.treefmt\.programs\.nixpkgs-fmt\.finalPackage {#opt-perSystem.treefmt.programs.nixpkgs-fmt.finalPackage}



Resulting ` nixpkgs-fmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/nixpkgs-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixpkgs-fmt.nix)



## perSystem\.treefmt\.programs\.nixpkgs-fmt\.includes {#opt-perSystem.treefmt.programs.nixpkgs-fmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [treefmt-nix/programs/nixpkgs-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixpkgs-fmt.nix)



## perSystem\.treefmt\.programs\.nixpkgs-fmt\.priority {#opt-perSystem.treefmt.programs.nixpkgs-fmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/nixpkgs-fmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/nixpkgs-fmt.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.enable {#opt-perSystem.treefmt.programs.ocamlformat.enable}



Whether to enable ocamlformat\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.package {#opt-perSystem.treefmt.programs.ocamlformat.package}



The ocamlformat package to use\.



*Type:*
package



*Default:*
` pkgs.ocamlformat `

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.configFile {#opt-perSystem.treefmt.programs.ocamlformat.configFile}



Path to the \.ocamlformat file\. Used to pick the right version of ocamlformat if passed\.



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.excludes {#opt-perSystem.treefmt.programs.ocamlformat.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.finalPackage {#opt-perSystem.treefmt.programs.ocamlformat.finalPackage}



Resulting ` ocamlformat ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.includes {#opt-perSystem.treefmt.programs.ocamlformat.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ml"
  "*.mli"
]
```

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.pkgs {#opt-perSystem.treefmt.programs.ocamlformat.pkgs}



The package set used to get the ocamlformat package at a specific version\.



*Type:*
lazy attribute set of raw value



*Default:*
Nixpkgs from context

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.ocamlformat\.priority {#opt-perSystem.treefmt.programs.ocamlformat.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/ocamlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ocamlformat.nix)



## perSystem\.treefmt\.programs\.odinfmt\.enable {#opt-perSystem.treefmt.programs.odinfmt.enable}



Whether to enable odinfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/odinfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/odinfmt.nix)



## perSystem\.treefmt\.programs\.odinfmt\.package {#opt-perSystem.treefmt.programs.odinfmt.package}



The ols package to use\.



*Type:*
package



*Default:*
` pkgs.ols `

*Declared by:*
 - [treefmt-nix/programs/odinfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/odinfmt.nix)



## perSystem\.treefmt\.programs\.odinfmt\.excludes {#opt-perSystem.treefmt.programs.odinfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/odinfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/odinfmt.nix)



## perSystem\.treefmt\.programs\.odinfmt\.finalPackage {#opt-perSystem.treefmt.programs.odinfmt.finalPackage}



Resulting ` odinfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/odinfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/odinfmt.nix)



## perSystem\.treefmt\.programs\.odinfmt\.includes {#opt-perSystem.treefmt.programs.odinfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.odin"
]
```

*Declared by:*
 - [treefmt-nix/programs/odinfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/odinfmt.nix)



## perSystem\.treefmt\.programs\.odinfmt\.priority {#opt-perSystem.treefmt.programs.odinfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/odinfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/odinfmt.nix)



## perSystem\.treefmt\.programs\.opa\.enable {#opt-perSystem.treefmt.programs.opa.enable}



Whether to enable opa\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/opa\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/opa.nix)



## perSystem\.treefmt\.programs\.opa\.package {#opt-perSystem.treefmt.programs.opa.package}



The open-policy-agent package to use\.



*Type:*
package



*Default:*
` pkgs.open-policy-agent `

*Declared by:*
 - [treefmt-nix/programs/opa\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/opa.nix)



## perSystem\.treefmt\.programs\.opa\.excludes {#opt-perSystem.treefmt.programs.opa.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/opa\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/opa.nix)



## perSystem\.treefmt\.programs\.opa\.finalPackage {#opt-perSystem.treefmt.programs.opa.finalPackage}



Resulting ` opa ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/opa\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/opa.nix)



## perSystem\.treefmt\.programs\.opa\.includes {#opt-perSystem.treefmt.programs.opa.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rego"
]
```

*Declared by:*
 - [treefmt-nix/programs/opa\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/opa.nix)



## perSystem\.treefmt\.programs\.opa\.priority {#opt-perSystem.treefmt.programs.opa.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/opa\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/opa.nix)



## perSystem\.treefmt\.programs\.ormolu\.enable {#opt-perSystem.treefmt.programs.ormolu.enable}



Whether to enable ormolu\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/ormolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ormolu.nix)



## perSystem\.treefmt\.programs\.ormolu\.package {#opt-perSystem.treefmt.programs.ormolu.package}



The ormolu package to use\.



*Type:*
package



*Default:*
` pkgs.ormolu `

*Declared by:*
 - [treefmt-nix/programs/ormolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ormolu.nix)



## perSystem\.treefmt\.programs\.ormolu\.excludes {#opt-perSystem.treefmt.programs.ormolu.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/ormolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ormolu.nix)



## perSystem\.treefmt\.programs\.ormolu\.finalPackage {#opt-perSystem.treefmt.programs.ormolu.finalPackage}



Resulting ` ormolu ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/ormolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ormolu.nix)



## perSystem\.treefmt\.programs\.ormolu\.ghcOpts {#opt-perSystem.treefmt.programs.ormolu.ghcOpts}



Which GHC language extensions to enable



*Type:*
unspecified value



*Default:*

```
[
  "BangPatterns"
  "PatternSynonyms"
  "TypeApplications"
]
```

*Declared by:*
 - [treefmt-nix/programs/ormolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ormolu.nix)



## perSystem\.treefmt\.programs\.ormolu\.includes {#opt-perSystem.treefmt.programs.ormolu.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [treefmt-nix/programs/ormolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ormolu.nix)



## perSystem\.treefmt\.programs\.ormolu\.priority {#opt-perSystem.treefmt.programs.ormolu.priority}

Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/ormolu\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ormolu.nix)



## perSystem\.treefmt\.programs\.oxfmt\.enable {#opt-perSystem.treefmt.programs.oxfmt.enable}



Whether to enable oxfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/oxfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxfmt.nix)



## perSystem\.treefmt\.programs\.oxfmt\.package {#opt-perSystem.treefmt.programs.oxfmt.package}



The oxfmt package to use\.



*Type:*
package



*Default:*
` pkgs.oxfmt `

*Declared by:*
 - [treefmt-nix/programs/oxfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxfmt.nix)



## perSystem\.treefmt\.programs\.oxfmt\.excludes {#opt-perSystem.treefmt.programs.oxfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/oxfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxfmt.nix)



## perSystem\.treefmt\.programs\.oxfmt\.finalPackage {#opt-perSystem.treefmt.programs.oxfmt.finalPackage}



Resulting ` oxfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/oxfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxfmt.nix)



## perSystem\.treefmt\.programs\.oxfmt\.includes {#opt-perSystem.treefmt.programs.oxfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cjs"
  "*.css"
  "*.graphql"
  "*.hbs"
  "*.html"
  "*.js"
  "*.json"
  "*.json5"
  "*.jsonc"
  "*.jsx"
  "*.md"
  "*.mdx"
  "*.mjs"
  "*.mustache"
  "*.scss"
  "*.ts"
  "*.tsx"
  "*.vue"
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [treefmt-nix/programs/oxfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxfmt.nix)



## perSystem\.treefmt\.programs\.oxfmt\.priority {#opt-perSystem.treefmt.programs.oxfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/oxfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxfmt.nix)



## perSystem\.treefmt\.programs\.oxipng\.enable {#opt-perSystem.treefmt.programs.oxipng.enable}



Whether to enable oxipng\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.package {#opt-perSystem.treefmt.programs.oxipng.package}



The oxipng package to use\.



*Type:*
package



*Default:*
` pkgs.oxipng `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.alpha {#opt-perSystem.treefmt.programs.oxipng.alpha}



Whether to enable Perform additional optimization on images with an alpha channel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.excludes {#opt-perSystem.treefmt.programs.oxipng.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.finalPackage {#opt-perSystem.treefmt.programs.oxipng.finalPackage}



Resulting ` oxipng ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.includes {#opt-perSystem.treefmt.programs.oxipng.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.png"
]
```

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.opt {#opt-perSystem.treefmt.programs.oxipng.opt}



Set the optimization level preset



*Type:*
string



*Default:*
` "2" `



*Example:*
` "max" `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.priority {#opt-perSystem.treefmt.programs.oxipng.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.scale16 {#opt-perSystem.treefmt.programs.oxipng.scale16}



Whether to enable Forcibly reduce images with 16 bits per channel to 8 bits per channel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.oxipng\.strip {#opt-perSystem.treefmt.programs.oxipng.strip}



Strip metadata chunks



*Type:*
null or string



*Default:*
` null `



*Example:*
` "safe" `

*Declared by:*
 - [treefmt-nix/programs/oxipng\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/oxipng.nix)



## perSystem\.treefmt\.programs\.packer\.enable {#opt-perSystem.treefmt.programs.packer.enable}



Whether to enable packer\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/packer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/packer.nix)



## perSystem\.treefmt\.programs\.packer\.package {#opt-perSystem.treefmt.programs.packer.package}



The packer package to use\.



*Type:*
package



*Default:*
` pkgs.packer `

*Declared by:*
 - [treefmt-nix/programs/packer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/packer.nix)



## perSystem\.treefmt\.programs\.packer\.excludes {#opt-perSystem.treefmt.programs.packer.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/packer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/packer.nix)



## perSystem\.treefmt\.programs\.packer\.finalPackage {#opt-perSystem.treefmt.programs.packer.finalPackage}



Resulting ` packer ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/packer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/packer.nix)



## perSystem\.treefmt\.programs\.packer\.includes {#opt-perSystem.treefmt.programs.packer.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.pkr.hcl"
  "*.pkrvars.hcl"
]
```

*Declared by:*
 - [treefmt-nix/programs/packer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/packer.nix)



## perSystem\.treefmt\.programs\.packer\.priority {#opt-perSystem.treefmt.programs.packer.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/packer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/packer.nix)



## perSystem\.treefmt\.programs\.perltidy\.enable {#opt-perSystem.treefmt.programs.perltidy.enable}



Whether to enable perltidy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/perltidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/perltidy.nix)



## perSystem\.treefmt\.programs\.perltidy\.package {#opt-perSystem.treefmt.programs.perltidy.package}



The PerlTidy package to use\.



*Type:*
package



*Default:*
` pkgs.perlPackages.PerlTidy `

*Declared by:*
 - [treefmt-nix/programs/perltidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/perltidy.nix)



## perSystem\.treefmt\.programs\.perltidy\.excludes {#opt-perSystem.treefmt.programs.perltidy.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/perltidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/perltidy.nix)



## perSystem\.treefmt\.programs\.perltidy\.finalPackage {#opt-perSystem.treefmt.programs.perltidy.finalPackage}



Resulting ` perltidy ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/perltidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/perltidy.nix)



## perSystem\.treefmt\.programs\.perltidy\.includes {#opt-perSystem.treefmt.programs.perltidy.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.pl"
]
```

*Declared by:*
 - [treefmt-nix/programs/perltidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/perltidy.nix)



## perSystem\.treefmt\.programs\.perltidy\.perltidyrc {#opt-perSystem.treefmt.programs.perltidy.perltidyrc}



A path for perltidy’s configuration file, usually named \.perltidyrc



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/perltidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/perltidy.nix)



## perSystem\.treefmt\.programs\.perltidy\.priority {#opt-perSystem.treefmt.programs.perltidy.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/perltidy\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/perltidy.nix)



## perSystem\.treefmt\.programs\.php-cs-fixer\.enable {#opt-perSystem.treefmt.programs.php-cs-fixer.enable}



Whether to enable php-cs-fixer\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/php-cs-fixer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/php-cs-fixer.nix)



## perSystem\.treefmt\.programs\.php-cs-fixer\.package {#opt-perSystem.treefmt.programs.php-cs-fixer.package}



The php-cs-fixer package to use\.



*Type:*
package



*Default:*
` pkgs.php83Packages.php-cs-fixer `

*Declared by:*
 - [treefmt-nix/programs/php-cs-fixer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/php-cs-fixer.nix)



## perSystem\.treefmt\.programs\.php-cs-fixer\.configFile {#opt-perSystem.treefmt.programs.php-cs-fixer.configFile}



Path to php-cs-fixer config file\.



*Type:*
string or absolute path



*Default:*
` "./.php-cs-fixer.php" `



*Example:*
` "./.php-cs-fixer.dist.php" `

*Declared by:*
 - [treefmt-nix/programs/php-cs-fixer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/php-cs-fixer.nix)



## perSystem\.treefmt\.programs\.php-cs-fixer\.excludes {#opt-perSystem.treefmt.programs.php-cs-fixer.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/php-cs-fixer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/php-cs-fixer.nix)



## perSystem\.treefmt\.programs\.php-cs-fixer\.finalPackage {#opt-perSystem.treefmt.programs.php-cs-fixer.finalPackage}



Resulting ` php-cs-fixer ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/php-cs-fixer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/php-cs-fixer.nix)



## perSystem\.treefmt\.programs\.php-cs-fixer\.includes {#opt-perSystem.treefmt.programs.php-cs-fixer.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.php"
]
```

*Declared by:*
 - [treefmt-nix/programs/php-cs-fixer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/php-cs-fixer.nix)



## perSystem\.treefmt\.programs\.php-cs-fixer\.priority {#opt-perSystem.treefmt.programs.php-cs-fixer.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/php-cs-fixer\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/php-cs-fixer.nix)



## perSystem\.treefmt\.programs\.pinact\.enable {#opt-perSystem.treefmt.programs.pinact.enable}



Whether to enable pinact\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.package {#opt-perSystem.treefmt.programs.pinact.package}



The pinact package to use\.



*Type:*
package



*Default:*
` pkgs.pinact `

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.excludes {#opt-perSystem.treefmt.programs.pinact.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.finalPackage {#opt-perSystem.treefmt.programs.pinact.finalPackage}



Resulting ` pinact ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.includes {#opt-perSystem.treefmt.programs.pinact.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".github/workflows/*.yml"
  ".github/workflows/*.yaml"
  "**/action.yml"
  "**/action.yaml"
]
```

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.priority {#opt-perSystem.treefmt.programs.pinact.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.settings {#opt-perSystem.treefmt.programs.pinact.settings}



Configuration for pinact, see
\<link xlink:href=“https://github\.com/suzuki-shunsuke/pinact?tab=readme-ov-file\#configuration”/>
for supported values\.



*Type:*
open submodule of (YAML 1\.1 value)



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.update {#opt-perSystem.treefmt.programs.pinact.update}



Update actions to latest versions\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.pinact\.verify {#opt-perSystem.treefmt.programs.pinact.verify}



Verify if pairs of commit SHA and version are correct\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/programs/pinact\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/pinact.nix)



## perSystem\.treefmt\.programs\.prettier\.enable {#opt-perSystem.treefmt.programs.prettier.enable}



Whether to enable prettier\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.package {#opt-perSystem.treefmt.programs.prettier.package}



The prettier package to use\.



*Type:*
package



*Default:*
` pkgs.nodePackages.prettier `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.excludes {#opt-perSystem.treefmt.programs.prettier.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.finalPackage {#opt-perSystem.treefmt.programs.prettier.finalPackage}



Resulting ` prettier ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.includes {#opt-perSystem.treefmt.programs.prettier.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cjs"
  "*.css"
  "*.html"
  "*.js"
  "*.json"
  "*.json5"
  "*.jsx"
  "*.md"
  "*.mdx"
  "*.mjs"
  "*.scss"
  "*.ts"
  "*.tsx"
  "*.vue"
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.priority {#opt-perSystem.treefmt.programs.prettier.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.arrowParens {#opt-perSystem.treefmt.programs.prettier.settings.arrowParens}



Include parentheses around a sole arrow function parameter\.



*Type:*
null or one of “always”, “avoid”



*Default:*
` null `



*Example:*
` "always" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.bracketSameLine {#opt-perSystem.treefmt.programs.prettier.settings.bracketSameLine}



Put > of opening tags on the last line instead of on a new line\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.bracketSpacing {#opt-perSystem.treefmt.programs.prettier.settings.bracketSpacing}



Print spaces between brackets



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.cursorOffset {#opt-perSystem.treefmt.programs.prettier.settings.cursorOffset}



Print (to stderr) where a cursor at the given position would move to
after formatting\. This option cannot be used with --range-start and
–range-end\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` -1 `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.editorconfig {#opt-perSystem.treefmt.programs.prettier.settings.editorconfig}



Whether parse the \.editorconfig file in your project and convert its
properties to the corresponding Prettier configuration\. This
configuration will be overridden by \.prettierrc, etc\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.embeddedLanguageFormatting {#opt-perSystem.treefmt.programs.prettier.settings.embeddedLanguageFormatting}



Control how Prettier formats quoted code embedded in the file\.



*Type:*
null or one of “auto”, “off”



*Default:*
` null `



*Example:*
` "auto" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.endOfLine {#opt-perSystem.treefmt.programs.prettier.settings.endOfLine}



Which end of line characters to apply\.



*Type:*
null or one of “lf”, “crlf”, “cr”, “auto”



*Default:*
` null `



*Example:*
` "lf" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.filepath {#opt-perSystem.treefmt.programs.prettier.settings.filepath}



Specify the input filepath\. This will be used to do parser inference\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "example.js" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.htmlWhitespaceSensitivity {#opt-perSystem.treefmt.programs.prettier.settings.htmlWhitespaceSensitivity}



How to handle whitespaces in HTML\.



*Type:*
null or one of “css”, “strict”, “ignore”



*Default:*
` null `



*Example:*
` "css" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.insertPragma {#opt-perSystem.treefmt.programs.prettier.settings.insertPragma}



Insert @format pragma into file’s first docblock commentypes\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.jsxSingleQuote {#opt-perSystem.treefmt.programs.prettier.settings.jsxSingleQuote}



Use single quotes in JSX



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.overrides {#opt-perSystem.treefmt.programs.prettier.settings.overrides}



Provide a list of patterns to override prettier configuration\.



*Type:*
null or (list of (attribute set))



*Default:*
` null `



*Example:*

```
{
  files = [
    "*.html"
    "legacy/**/*.js"
  ];
  options = {
    tabwidth = 4;
  };
}
```

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.parser {#opt-perSystem.treefmt.programs.prettier.settings.parser}



Which parser to use\.



*Type:*
null or one of “flow”, “babel”, “babel-flow”, “babel-ts”, “typescript”, “acorn”, “espree”, “meriyah”, “css”, “less”, “scss”, “json”, “json5”, “json-stringify”, “graphql”, “markdown”, “mdx”, “vue”, “yaml”, “glimmer”, “html”, “angular”, “lwc” or string



*Default:*
` null `



*Example:*
` "typescript" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.pluginSearchDirs {#opt-perSystem.treefmt.programs.prettier.settings.pluginSearchDirs}



Custom directory that contains prettier plugins in node_modules
subdirectory\. Overrides default behavior when plugins are searched
relatively to the location of Prettier\.\\nMultiple values are accepted\.



*Type:*
null or (list of string) or value false (singular enum)



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.plugins {#opt-perSystem.treefmt.programs.prettier.settings.plugins}



Add a plugin\. Multiple plugins can be passed as separate ` --plugin `s\.



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
[
  "@prettier/plugin-xml"
]
```

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.printWidth {#opt-perSystem.treefmt.programs.prettier.settings.printWidth}



The line length where Prettier will try wrap\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 80 `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.proseWrap {#opt-perSystem.treefmt.programs.prettier.settings.proseWrap}



How to wrap prose\.



*Type:*
null or one of “always”, “never”, “preserve”



*Default:*
` null `



*Example:*
` "preserve" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.quoteProps {#opt-perSystem.treefmt.programs.prettier.settings.quoteProps}



Change when properties in objects are quoted



*Type:*
null or one of “as-needed”, “consistent”, “preserve”



*Default:*
` null `



*Example:*
` "as-needed" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.rangeEnd {#opt-perSystem.treefmt.programs.prettier.settings.rangeEnd}



Format code ending at a given character offset (exclusive)\. The range
will extend forwards to the end of the selected statementypes\. This
option cannot be used with --cursor-offsetypes\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` 0 `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.rangeStart {#opt-perSystem.treefmt.programs.prettier.settings.rangeStart}



Format code starting at a given character offsetypes\. The range will
extend backwards to the start of the first line containing the selected
statementypes\. his option cannot be used with --cursor-offsetypes\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 0 `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.requirePragma {#opt-perSystem.treefmt.programs.prettier.settings.requirePragma}



Require either ‘@prettier’ or ‘@format’ to be present in the file’s
first docblock comment\\nin order for it to be formatted\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.semi {#opt-perSystem.treefmt.programs.prettier.settings.semi}



Print semicolons\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.singleAttributePerLine {#opt-perSystem.treefmt.programs.prettier.settings.singleAttributePerLine}



Enforce single attribute per line in HTML, Vue and JSX\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.singleQuote {#opt-perSystem.treefmt.programs.prettier.settings.singleQuote}



Use single quotes instead of double quotes\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.tabWidth {#opt-perSystem.treefmt.programs.prettier.settings.tabWidth}



Number of spaces per indentation level\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.trailingComma {#opt-perSystem.treefmt.programs.prettier.settings.trailingComma}



Print trailing commas wherever possible when multi-line\.



*Type:*
null or one of “es5”, “none”, “all”



*Default:*
` null `



*Example:*
` "es5" `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.useTabs {#opt-perSystem.treefmt.programs.prettier.settings.useTabs}



Indent with tabs instead of spaces



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.prettier\.settings\.vueIndentScriptAndStyle {#opt-perSystem.treefmt.programs.prettier.settings.vueIndentScriptAndStyle}



Indent script and style tags in Vue files\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/prettier\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/prettier.nix)



## perSystem\.treefmt\.programs\.protolint\.enable {#opt-perSystem.treefmt.programs.protolint.enable}



Whether to enable protolint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/protolint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/protolint.nix)



## perSystem\.treefmt\.programs\.protolint\.package {#opt-perSystem.treefmt.programs.protolint.package}



The protolint package to use\.



*Type:*
package



*Default:*
` pkgs.protolint `

*Declared by:*
 - [treefmt-nix/programs/protolint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/protolint.nix)



## perSystem\.treefmt\.programs\.protolint\.excludes {#opt-perSystem.treefmt.programs.protolint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/protolint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/protolint.nix)



## perSystem\.treefmt\.programs\.protolint\.finalPackage {#opt-perSystem.treefmt.programs.protolint.finalPackage}



Resulting ` protolint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/protolint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/protolint.nix)



## perSystem\.treefmt\.programs\.protolint\.includes {#opt-perSystem.treefmt.programs.protolint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.proto"
]
```

*Declared by:*
 - [treefmt-nix/programs/protolint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/protolint.nix)



## perSystem\.treefmt\.programs\.protolint\.priority {#opt-perSystem.treefmt.programs.protolint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/protolint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/protolint.nix)



## perSystem\.treefmt\.programs\.qmlformat\.enable {#opt-perSystem.treefmt.programs.qmlformat.enable}



Whether to enable qmlformat\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/qmlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/qmlformat.nix)



## perSystem\.treefmt\.programs\.qmlformat\.package {#opt-perSystem.treefmt.programs.qmlformat.package}



The qtdeclarative package to use\.



*Type:*
package



*Default:*
` pkgs.kdePackages.qtdeclarative `

*Declared by:*
 - [treefmt-nix/programs/qmlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/qmlformat.nix)



## perSystem\.treefmt\.programs\.qmlformat\.excludes {#opt-perSystem.treefmt.programs.qmlformat.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/qmlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/qmlformat.nix)



## perSystem\.treefmt\.programs\.qmlformat\.finalPackage {#opt-perSystem.treefmt.programs.qmlformat.finalPackage}



Resulting ` qmlformat ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/qmlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/qmlformat.nix)



## perSystem\.treefmt\.programs\.qmlformat\.includes {#opt-perSystem.treefmt.programs.qmlformat.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.qml"
]
```

*Declared by:*
 - [treefmt-nix/programs/qmlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/qmlformat.nix)



## perSystem\.treefmt\.programs\.qmlformat\.priority {#opt-perSystem.treefmt.programs.qmlformat.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/qmlformat\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/qmlformat.nix)



## perSystem\.treefmt\.programs\.rstfmt\.enable {#opt-perSystem.treefmt.programs.rstfmt.enable}



Whether to enable rstfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/rstfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rstfmt.nix)



## perSystem\.treefmt\.programs\.rstfmt\.package {#opt-perSystem.treefmt.programs.rstfmt.package}



The rstfmt package to use\.



*Type:*
package



*Default:*
` pkgs.rstfmt `

*Declared by:*
 - [treefmt-nix/programs/rstfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rstfmt.nix)



## perSystem\.treefmt\.programs\.rstfmt\.excludes {#opt-perSystem.treefmt.programs.rstfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/rstfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rstfmt.nix)



## perSystem\.treefmt\.programs\.rstfmt\.finalPackage {#opt-perSystem.treefmt.programs.rstfmt.finalPackage}



Resulting ` rstfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/rstfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rstfmt.nix)



## perSystem\.treefmt\.programs\.rstfmt\.includes {#opt-perSystem.treefmt.programs.rstfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rst"
  "*.txt"
]
```

*Declared by:*
 - [treefmt-nix/programs/rstfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rstfmt.nix)



## perSystem\.treefmt\.programs\.rstfmt\.line_length {#opt-perSystem.treefmt.programs.rstfmt.line_length}



Sets the line length\.



*Type:*
signed integer



*Default:*
` 72 `



*Example:*
` 80 `

*Declared by:*
 - [treefmt-nix/programs/rstfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rstfmt.nix)



## perSystem\.treefmt\.programs\.rstfmt\.priority {#opt-perSystem.treefmt.programs.rstfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/rstfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rstfmt.nix)



## perSystem\.treefmt\.programs\.rubocop\.enable {#opt-perSystem.treefmt.programs.rubocop.enable}



Whether to enable rubocop\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/rubocop\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rubocop.nix)



## perSystem\.treefmt\.programs\.rubocop\.package {#opt-perSystem.treefmt.programs.rubocop.package}



The rubocop package to use\.



*Type:*
package



*Default:*
` pkgs.rubocop `

*Declared by:*
 - [treefmt-nix/programs/rubocop\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rubocop.nix)



## perSystem\.treefmt\.programs\.rubocop\.excludes {#opt-perSystem.treefmt.programs.rubocop.excludes}

Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/rubocop\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rubocop.nix)



## perSystem\.treefmt\.programs\.rubocop\.finalPackage {#opt-perSystem.treefmt.programs.rubocop.finalPackage}



Resulting ` rubocop ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/rubocop\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rubocop.nix)



## perSystem\.treefmt\.programs\.rubocop\.includes {#opt-perSystem.treefmt.programs.rubocop.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rb"
]
```

*Declared by:*
 - [treefmt-nix/programs/rubocop\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rubocop.nix)



## perSystem\.treefmt\.programs\.rubocop\.priority {#opt-perSystem.treefmt.programs.rubocop.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/rubocop\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rubocop.nix)



## perSystem\.treefmt\.programs\.ruff-check\.enable {#opt-perSystem.treefmt.programs.ruff-check.enable}



Whether to enable ruff-check\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/ruff-check\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-check.nix)



## perSystem\.treefmt\.programs\.ruff-check\.package {#opt-perSystem.treefmt.programs.ruff-check.package}



The ruff package to use\.



*Type:*
package



*Default:*
` pkgs.ruff `

*Declared by:*
 - [treefmt-nix/programs/ruff-check\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-check.nix)



## perSystem\.treefmt\.programs\.ruff-check\.excludes {#opt-perSystem.treefmt.programs.ruff-check.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/ruff-check\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-check.nix)



## perSystem\.treefmt\.programs\.ruff-check\.extendSelect {#opt-perSystem.treefmt.programs.ruff-check.extendSelect}



–extend-select options



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "I"
]
```

*Declared by:*
 - [treefmt-nix/programs/ruff-check\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-check.nix)



## perSystem\.treefmt\.programs\.ruff-check\.finalPackage {#opt-perSystem.treefmt.programs.ruff-check.finalPackage}



Resulting ` ruff-check ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/ruff-check\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-check.nix)



## perSystem\.treefmt\.programs\.ruff-check\.includes {#opt-perSystem.treefmt.programs.ruff-check.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [treefmt-nix/programs/ruff-check\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-check.nix)



## perSystem\.treefmt\.programs\.ruff-check\.priority {#opt-perSystem.treefmt.programs.ruff-check.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/ruff-check\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-check.nix)



## perSystem\.treefmt\.programs\.ruff-format\.enable {#opt-perSystem.treefmt.programs.ruff-format.enable}



Whether to enable ruff-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/ruff-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-format.nix)



## perSystem\.treefmt\.programs\.ruff-format\.package {#opt-perSystem.treefmt.programs.ruff-format.package}



The ruff package to use\.



*Type:*
package



*Default:*
` pkgs.ruff `

*Declared by:*
 - [treefmt-nix/programs/ruff-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-format.nix)



## perSystem\.treefmt\.programs\.ruff-format\.excludes {#opt-perSystem.treefmt.programs.ruff-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/ruff-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-format.nix)



## perSystem\.treefmt\.programs\.ruff-format\.finalPackage {#opt-perSystem.treefmt.programs.ruff-format.finalPackage}



Resulting ` ruff-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/ruff-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-format.nix)



## perSystem\.treefmt\.programs\.ruff-format\.includes {#opt-perSystem.treefmt.programs.ruff-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [treefmt-nix/programs/ruff-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-format.nix)



## perSystem\.treefmt\.programs\.ruff-format\.lineLength {#opt-perSystem.treefmt.programs.ruff-format.lineLength}



Set the line-length\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 79 `

*Declared by:*
 - [treefmt-nix/programs/ruff-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-format.nix)



## perSystem\.treefmt\.programs\.ruff-format\.priority {#opt-perSystem.treefmt.programs.ruff-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/ruff-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/ruff-format.nix)



## perSystem\.treefmt\.programs\.rufo\.enable {#opt-perSystem.treefmt.programs.rufo.enable}



Whether to enable rufo\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/rufo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rufo.nix)



## perSystem\.treefmt\.programs\.rufo\.package {#opt-perSystem.treefmt.programs.rufo.package}



The rufo package to use\.



*Type:*
package



*Default:*
` pkgs.rufo `

*Declared by:*
 - [treefmt-nix/programs/rufo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rufo.nix)



## perSystem\.treefmt\.programs\.rufo\.excludes {#opt-perSystem.treefmt.programs.rufo.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/rufo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rufo.nix)



## perSystem\.treefmt\.programs\.rufo\.finalPackage {#opt-perSystem.treefmt.programs.rufo.finalPackage}



Resulting ` rufo ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/rufo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rufo.nix)



## perSystem\.treefmt\.programs\.rufo\.includes {#opt-perSystem.treefmt.programs.rufo.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rb"
]
```

*Declared by:*
 - [treefmt-nix/programs/rufo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rufo.nix)



## perSystem\.treefmt\.programs\.rufo\.priority {#opt-perSystem.treefmt.programs.rufo.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/rufo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rufo.nix)



## perSystem\.treefmt\.programs\.rustfmt\.enable {#opt-perSystem.treefmt.programs.rustfmt.enable}



Whether to enable rustfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/rustfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rustfmt.nix)



## perSystem\.treefmt\.programs\.rustfmt\.package {#opt-perSystem.treefmt.programs.rustfmt.package}



The rustfmt package to use\.



*Type:*
package



*Default:*
` pkgs.rustfmt `

*Declared by:*
 - [treefmt-nix/programs/rustfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rustfmt.nix)



## perSystem\.treefmt\.programs\.rustfmt\.edition {#opt-perSystem.treefmt.programs.rustfmt.edition}



Rust edition to target when formatting



*Type:*
string



*Default:*
` "2024" `

*Declared by:*
 - [treefmt-nix/programs/rustfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rustfmt.nix)



## perSystem\.treefmt\.programs\.rustfmt\.excludes {#opt-perSystem.treefmt.programs.rustfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/rustfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rustfmt.nix)



## perSystem\.treefmt\.programs\.rustfmt\.finalPackage {#opt-perSystem.treefmt.programs.rustfmt.finalPackage}



Resulting ` rustfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/rustfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rustfmt.nix)



## perSystem\.treefmt\.programs\.rustfmt\.includes {#opt-perSystem.treefmt.programs.rustfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rs"
]
```

*Declared by:*
 - [treefmt-nix/programs/rustfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rustfmt.nix)



## perSystem\.treefmt\.programs\.rustfmt\.priority {#opt-perSystem.treefmt.programs.rustfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/rustfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/rustfmt.nix)



## perSystem\.treefmt\.programs\.scalafmt\.enable {#opt-perSystem.treefmt.programs.scalafmt.enable}



Whether to enable scalafmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/scalafmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/scalafmt.nix)



## perSystem\.treefmt\.programs\.scalafmt\.package {#opt-perSystem.treefmt.programs.scalafmt.package}



The scalafmt package to use\.



*Type:*
package



*Default:*
` pkgs.scalafmt `

*Declared by:*
 - [treefmt-nix/programs/scalafmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/scalafmt.nix)



## perSystem\.treefmt\.programs\.scalafmt\.excludes {#opt-perSystem.treefmt.programs.scalafmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/scalafmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/scalafmt.nix)



## perSystem\.treefmt\.programs\.scalafmt\.finalPackage {#opt-perSystem.treefmt.programs.scalafmt.finalPackage}



Resulting ` scalafmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/scalafmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/scalafmt.nix)



## perSystem\.treefmt\.programs\.scalafmt\.includes {#opt-perSystem.treefmt.programs.scalafmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sbt"
  "*.scala"
]
```

*Declared by:*
 - [treefmt-nix/programs/scalafmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/scalafmt.nix)



## perSystem\.treefmt\.programs\.scalafmt\.priority {#opt-perSystem.treefmt.programs.scalafmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/scalafmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/scalafmt.nix)



## perSystem\.treefmt\.programs\.shellcheck\.enable {#opt-perSystem.treefmt.programs.shellcheck.enable}



Whether to enable shellcheck\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.package {#opt-perSystem.treefmt.programs.shellcheck.package}



The shellcheck package to use\.



*Type:*
package



*Default:*
` pkgs.shellcheck `

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.excludes {#opt-perSystem.treefmt.programs.shellcheck.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.external-sources {#opt-perSystem.treefmt.programs.shellcheck.external-sources}



Whether to enable Allow sources outside of ` includes `\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.extra-checks {#opt-perSystem.treefmt.programs.shellcheck.extra-checks}



List of optional checks to enable (or “all”)



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "all"
]
```

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.finalPackage {#opt-perSystem.treefmt.programs.shellcheck.finalPackage}



Resulting ` shellcheck ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.includes {#opt-perSystem.treefmt.programs.shellcheck.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sh"
  "*.bash"
  "*.envrc"
  "*.envrc.*"
]
```

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.priority {#opt-perSystem.treefmt.programs.shellcheck.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.severity {#opt-perSystem.treefmt.programs.shellcheck.severity}



Minimum severity of errors to consider (“error”, “warning”, “info”, “style”)



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shellcheck\.source-path {#opt-perSystem.treefmt.programs.shellcheck.source-path}



Specify path when looking for sourced files (“SCRIPTDIR” for script’s dir)



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/shellcheck\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shellcheck.nix)



## perSystem\.treefmt\.programs\.shfmt\.enable {#opt-perSystem.treefmt.programs.shfmt.enable}



Whether to enable shfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.package {#opt-perSystem.treefmt.programs.shfmt.package}



The shfmt package to use\.



*Type:*
package



*Default:*
` pkgs.shfmt `

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.excludes {#opt-perSystem.treefmt.programs.shfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.finalPackage {#opt-perSystem.treefmt.programs.shfmt.finalPackage}



Resulting ` shfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.includes {#opt-perSystem.treefmt.programs.shfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sh"
  "*.bash"
  "*.envrc"
  "*.envrc.*"
]
```

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.indent_size {#opt-perSystem.treefmt.programs.shfmt.indent_size}



Sets the number of spaces to be used in indentation\. Uses tabs if set to
zero\.



*Type:*
null or signed integer



*Default:*
` 2 `



*Example:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.priority {#opt-perSystem.treefmt.programs.shfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.simplify {#opt-perSystem.treefmt.programs.shfmt.simplify}



Enables the ` -s ` (` --simplify `) flag, which simplifies code where possible\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.shfmt\.useEditorConfig {#opt-perSystem.treefmt.programs.shfmt.useEditorConfig}



Whether to enable Use \.editorconfig file for
formatting\. This is mutually exlusive with all other settings\. See [shfmt
docs](https://github\.com/mvdan/sh/blob/v3\.12\.0/cmd/shfmt/shfmt\.1\.scd?plain=1\#L20-L21)\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/shfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/shfmt.nix)



## perSystem\.treefmt\.programs\.sizelint\.enable {#opt-perSystem.treefmt.programs.sizelint.enable}



Whether to enable sizelint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sizelint\.package {#opt-perSystem.treefmt.programs.sizelint.package}



The sizelint package to use\.



*Type:*
package



*Default:*
` pkgs.sizelint `

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sizelint\.excludes {#opt-perSystem.treefmt.programs.sizelint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sizelint\.failOnWarn {#opt-perSystem.treefmt.programs.sizelint.failOnWarn}



Whether to enable fail-on-warn\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sizelint\.finalPackage {#opt-perSystem.treefmt.programs.sizelint.finalPackage}



Resulting ` sizelint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sizelint\.includes {#opt-perSystem.treefmt.programs.sizelint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sizelint\.priority {#opt-perSystem.treefmt.programs.sizelint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sizelint\.settings {#opt-perSystem.treefmt.programs.sizelint.settings}



Configuration to generate sizelint\.toml with



*Type:*
open submodule of (TOML value)



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/programs/sizelint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sizelint.nix)



## perSystem\.treefmt\.programs\.sql-formatter\.enable {#opt-perSystem.treefmt.programs.sql-formatter.enable}



Whether to enable sql-formatter\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/sql-formatter\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sql-formatter.nix)



## perSystem\.treefmt\.programs\.sql-formatter\.package {#opt-perSystem.treefmt.programs.sql-formatter.package}



The sql-formatter package to use\.



*Type:*
package



*Default:*
` pkgs.sql-formatter `

*Declared by:*
 - [treefmt-nix/programs/sql-formatter\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sql-formatter.nix)



## perSystem\.treefmt\.programs\.sql-formatter\.dialect {#opt-perSystem.treefmt.programs.sql-formatter.dialect}



The sql dialect to use for formatting



*Type:*
null or one of “bigquery”, “db2”, “db2i”, “hive”, “mariadb”, “mysql”, “n1ql”, “plsql”, “postgresql”, “redshift”, “spark”, “sqlite”, “sql”, “tidb”, “trino”, “transactsql”, “tsql”, “singlestoredb”, “snowflake”



*Default:*
` null `



*Example:*
` "postgresql" `

*Declared by:*
 - [treefmt-nix/programs/sql-formatter\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sql-formatter.nix)



## perSystem\.treefmt\.programs\.sql-formatter\.excludes {#opt-perSystem.treefmt.programs.sql-formatter.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/sql-formatter\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sql-formatter.nix)



## perSystem\.treefmt\.programs\.sql-formatter\.finalPackage {#opt-perSystem.treefmt.programs.sql-formatter.finalPackage}



Resulting ` sql-formatter ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/sql-formatter\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sql-formatter.nix)



## perSystem\.treefmt\.programs\.sql-formatter\.includes {#opt-perSystem.treefmt.programs.sql-formatter.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [treefmt-nix/programs/sql-formatter\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sql-formatter.nix)



## perSystem\.treefmt\.programs\.sql-formatter\.priority {#opt-perSystem.treefmt.programs.sql-formatter.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/sql-formatter\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sql-formatter.nix)



## perSystem\.treefmt\.programs\.sqlfluff\.enable {#opt-perSystem.treefmt.programs.sqlfluff.enable}



Whether to enable sqlfluff\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff.nix)



## perSystem\.treefmt\.programs\.sqlfluff\.package {#opt-perSystem.treefmt.programs.sqlfluff.package}



The sqlfluff package to use\.



*Type:*
package



*Default:*
` pkgs.sqlfluff `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff.nix)



## perSystem\.treefmt\.programs\.sqlfluff\.dialect {#opt-perSystem.treefmt.programs.sqlfluff.dialect}



The sql dialect to use for formatting



*Type:*
null or one of “db2”, “ansi”, “soql”, “tsql”, “hive”, “trino”, “mysql”, “oracle”, “sqlite”, “duckdb”, “exasol”, “athena”, “mariadb”, “vertica”, “teradata”, “redshift”, “sparksql”, “bigquery”, “postgres”, “greenplum”, “snowflake”, “materializ”, “clickhouse”, “databricks”



*Default:*
` null `



*Example:*
` "sqlite" `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff.nix)



## perSystem\.treefmt\.programs\.sqlfluff\.excludes {#opt-perSystem.treefmt.programs.sqlfluff.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff.nix)



## perSystem\.treefmt\.programs\.sqlfluff\.finalPackage {#opt-perSystem.treefmt.programs.sqlfluff.finalPackage}



Resulting ` sqlfluff ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/sqlfluff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff.nix)



## perSystem\.treefmt\.programs\.sqlfluff\.includes {#opt-perSystem.treefmt.programs.sqlfluff.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [treefmt-nix/programs/sqlfluff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff.nix)



## perSystem\.treefmt\.programs\.sqlfluff\.priority {#opt-perSystem.treefmt.programs.sqlfluff.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff.nix)



## perSystem\.treefmt\.programs\.sqlfluff-lint\.enable {#opt-perSystem.treefmt.programs.sqlfluff-lint.enable}



Whether to enable sqlfluff-lint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff-lint.nix)



## perSystem\.treefmt\.programs\.sqlfluff-lint\.package {#opt-perSystem.treefmt.programs.sqlfluff-lint.package}



The sqlfluff package to use\.



*Type:*
package



*Default:*
` pkgs.sqlfluff `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff-lint.nix)



## perSystem\.treefmt\.programs\.sqlfluff-lint\.excludes {#opt-perSystem.treefmt.programs.sqlfluff-lint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff-lint.nix)



## perSystem\.treefmt\.programs\.sqlfluff-lint\.finalPackage {#opt-perSystem.treefmt.programs.sqlfluff-lint.finalPackage}



Resulting ` sqlfluff-lint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/sqlfluff-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff-lint.nix)



## perSystem\.treefmt\.programs\.sqlfluff-lint\.includes {#opt-perSystem.treefmt.programs.sqlfluff-lint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [treefmt-nix/programs/sqlfluff-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff-lint.nix)



## perSystem\.treefmt\.programs\.sqlfluff-lint\.priority {#opt-perSystem.treefmt.programs.sqlfluff-lint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/sqlfluff-lint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqlfluff-lint.nix)



## perSystem\.treefmt\.programs\.sqruff\.enable {#opt-perSystem.treefmt.programs.sqruff.enable}



Whether to enable sqruff\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/sqruff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqruff.nix)



## perSystem\.treefmt\.programs\.sqruff\.package {#opt-perSystem.treefmt.programs.sqruff.package}



The sqruff package to use\.



*Type:*
package



*Default:*
` pkgs.sqruff `

*Declared by:*
 - [treefmt-nix/programs/sqruff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqruff.nix)



## perSystem\.treefmt\.programs\.sqruff\.excludes {#opt-perSystem.treefmt.programs.sqruff.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/sqruff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqruff.nix)



## perSystem\.treefmt\.programs\.sqruff\.finalPackage {#opt-perSystem.treefmt.programs.sqruff.finalPackage}



Resulting ` sqruff ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/sqruff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqruff.nix)



## perSystem\.treefmt\.programs\.sqruff\.includes {#opt-perSystem.treefmt.programs.sqruff.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [treefmt-nix/programs/sqruff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqruff.nix)



## perSystem\.treefmt\.programs\.sqruff\.priority {#opt-perSystem.treefmt.programs.sqruff.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/sqruff\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/sqruff.nix)



## perSystem\.treefmt\.programs\.statix\.enable {#opt-perSystem.treefmt.programs.statix.enable}



Whether to enable statix\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/statix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/statix.nix)



## perSystem\.treefmt\.programs\.statix\.package {#opt-perSystem.treefmt.programs.statix.package}



The statix package to use\.



*Type:*
package



*Default:*
` pkgs.statix `

*Declared by:*
 - [treefmt-nix/programs/statix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/statix.nix)



## perSystem\.treefmt\.programs\.statix\.disabled-lints {#opt-perSystem.treefmt.programs.statix.disabled-lints}



List of ignored lints\. Run ` statix list ` to see all available lints\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "empty_pattern"
]
```

*Declared by:*
 - [treefmt-nix/programs/statix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/statix.nix)



## perSystem\.treefmt\.programs\.statix\.excludes {#opt-perSystem.treefmt.programs.statix.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/statix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/statix.nix)



## perSystem\.treefmt\.programs\.statix\.finalPackage {#opt-perSystem.treefmt.programs.statix.finalPackage}



Resulting ` statix ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/statix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/statix.nix)



## perSystem\.treefmt\.programs\.statix\.includes {#opt-perSystem.treefmt.programs.statix.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [treefmt-nix/programs/statix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/statix.nix)



## perSystem\.treefmt\.programs\.statix\.priority {#opt-perSystem.treefmt.programs.statix.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/statix\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/statix.nix)



## perSystem\.treefmt\.programs\.stylish-haskell\.enable {#opt-perSystem.treefmt.programs.stylish-haskell.enable}



Whether to enable stylish-haskell\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/stylish-haskell\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylish-haskell.nix)



## perSystem\.treefmt\.programs\.stylish-haskell\.package {#opt-perSystem.treefmt.programs.stylish-haskell.package}



The stylish-haskell package to use\.



*Type:*
package



*Default:*
` pkgs.stylish-haskell `

*Declared by:*
 - [treefmt-nix/programs/stylish-haskell\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylish-haskell.nix)



## perSystem\.treefmt\.programs\.stylish-haskell\.excludes {#opt-perSystem.treefmt.programs.stylish-haskell.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/stylish-haskell\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylish-haskell.nix)



## perSystem\.treefmt\.programs\.stylish-haskell\.finalPackage {#opt-perSystem.treefmt.programs.stylish-haskell.finalPackage}

Resulting ` stylish-haskell ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/stylish-haskell\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylish-haskell.nix)



## perSystem\.treefmt\.programs\.stylish-haskell\.includes {#opt-perSystem.treefmt.programs.stylish-haskell.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [treefmt-nix/programs/stylish-haskell\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylish-haskell.nix)



## perSystem\.treefmt\.programs\.stylish-haskell\.priority {#opt-perSystem.treefmt.programs.stylish-haskell.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/stylish-haskell\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylish-haskell.nix)



## perSystem\.treefmt\.programs\.stylua\.enable {#opt-perSystem.treefmt.programs.stylua.enable}



Whether to enable stylua\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.package {#opt-perSystem.treefmt.programs.stylua.package}



The stylua package to use\.



*Type:*
package



*Default:*
` pkgs.stylua `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.excludes {#opt-perSystem.treefmt.programs.stylua.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.finalPackage {#opt-perSystem.treefmt.programs.stylua.finalPackage}



Resulting ` stylua ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.includes {#opt-perSystem.treefmt.programs.stylua.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.lua"
]
```

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.priority {#opt-perSystem.treefmt.programs.stylua.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.call_parentheses {#opt-perSystem.treefmt.programs.stylua.settings.call_parentheses}



Whether parentheses should be applied on
function calls with a single string/table
argument\.  ` Always ` applies parentheses in
all cases\. ` NoSingleString ` omits
parentheses on calls with a single string
argument\. Similarly, ` NoSingleTable ` omits
parentheses on calls with a single table
argument\. ` None ` omits parentheses in both
cases\.

Note: parentheses are still kept in situations
where removal can lead to obscurity
(e\.g\. ` foo "bar".setup -> foo("bar").setup `,
since the index is on the call result, not the string)\.

` Input ` removes all automation and preserves
parentheses only if they were present in input code:
consistency is not enforced\.



*Type:*
null or one of “Always”, “NoSingleString”, “NoSingleTable”, “None”, “Input”



*Default:*
` null `



*Example:*
` "Always" `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.collapse_simple_statement {#opt-perSystem.treefmt.programs.stylua.settings.collapse_simple_statement}



Specify whether to collapse simple statements\.



*Type:*
null or one of “Never”, “FunctionOnly”, “ConditionalOnly”, “Always”



*Default:*
` null `



*Example:*
` "Never" `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.column_width {#opt-perSystem.treefmt.programs.stylua.settings.column_width}



Approximate line length for printing\.

Used as a guide for line wrapping -
this is not a hard requirement:
lines may fall under or over the limit\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 120 `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.indent_type {#opt-perSystem.treefmt.programs.stylua.settings.indent_type}



Indent type\.



*Type:*
null or one of “Tabs”, “Spaces”



*Default:*
` null `



*Example:*
` "Tabs" `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.indent_width {#opt-perSystem.treefmt.programs.stylua.settings.indent_width}



Character size of single indentation\.

If ` indent_type ` is set to ` Tabs `,
this option is used as a heuristic to
determine column width only\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.line_endings {#opt-perSystem.treefmt.programs.stylua.settings.line_endings}



Line endings type\.



*Type:*
null or one of “Unix”, “Windows”



*Default:*
` null `



*Example:*
` "Unix" `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.quote_style {#opt-perSystem.treefmt.programs.stylua.settings.quote_style}



Quote style for string literals\.

` AutoPrefer ` styles will prefer the
specified quote style, but fall back to
the alternative if it has fewer string
escapes\. ` Force ` styles always use the
specified style regardless of escapes\.



*Type:*
null or one of “AutoPreferDouble”, “AutoPreferSingle”, “ForceDouble”, “ForceSingle”



*Default:*
` null `



*Example:*
` "AutoPreferDouble" `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.stylua\.settings\.sort_requires\.enabled {#opt-perSystem.treefmt.programs.stylua.settings.sort_requires.enabled}



StyLua has built-in support for sorting
require statements\. We group consecutive
require statements into a single “block”,
and then requires are sorted only within
that block\. Blocks of requires do not
move around the file\.

We only include requires of the form
` local NAME = require(EXPR) `, and sort
lexicographically based on ` NAME `\.
(We also sort Roblox services of the form
` local NAME = game:GetService(EXPR) `)



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [treefmt-nix/programs/stylua\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/stylua.nix)



## perSystem\.treefmt\.programs\.swift-format\.enable {#opt-perSystem.treefmt.programs.swift-format.enable}



Whether to enable swift-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/swift-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/swift-format.nix)



## perSystem\.treefmt\.programs\.swift-format\.package {#opt-perSystem.treefmt.programs.swift-format.package}



The swift-format package to use\.



*Type:*
package



*Default:*
` pkgs.swift-format `

*Declared by:*
 - [treefmt-nix/programs/swift-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/swift-format.nix)



## perSystem\.treefmt\.programs\.swift-format\.excludes {#opt-perSystem.treefmt.programs.swift-format.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/swift-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/swift-format.nix)



## perSystem\.treefmt\.programs\.swift-format\.finalPackage {#opt-perSystem.treefmt.programs.swift-format.finalPackage}



Resulting ` swift-format ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/swift-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/swift-format.nix)



## perSystem\.treefmt\.programs\.swift-format\.includes {#opt-perSystem.treefmt.programs.swift-format.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.swift"
]
```

*Declared by:*
 - [treefmt-nix/programs/swift-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/swift-format.nix)



## perSystem\.treefmt\.programs\.swift-format\.priority {#opt-perSystem.treefmt.programs.swift-format.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/swift-format\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/swift-format.nix)



## perSystem\.treefmt\.programs\.taplo\.enable {#opt-perSystem.treefmt.programs.taplo.enable}



Whether to enable taplo\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/taplo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/taplo.nix)



## perSystem\.treefmt\.programs\.taplo\.package {#opt-perSystem.treefmt.programs.taplo.package}



The taplo package to use\.



*Type:*
package



*Default:*
` pkgs.taplo `

*Declared by:*
 - [treefmt-nix/programs/taplo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/taplo.nix)



## perSystem\.treefmt\.programs\.taplo\.excludes {#opt-perSystem.treefmt.programs.taplo.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/taplo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/taplo.nix)



## perSystem\.treefmt\.programs\.taplo\.finalPackage {#opt-perSystem.treefmt.programs.taplo.finalPackage}



Resulting ` taplo ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/taplo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/taplo.nix)



## perSystem\.treefmt\.programs\.taplo\.includes {#opt-perSystem.treefmt.programs.taplo.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.toml"
]
```

*Declared by:*
 - [treefmt-nix/programs/taplo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/taplo.nix)



## perSystem\.treefmt\.programs\.taplo\.priority {#opt-perSystem.treefmt.programs.taplo.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/taplo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/taplo.nix)



## perSystem\.treefmt\.programs\.taplo\.settings {#opt-perSystem.treefmt.programs.taplo.settings}



Configuration to generate taplo\.toml with



*Type:*
open submodule of (TOML value)



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/programs/taplo\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/taplo.nix)



## perSystem\.treefmt\.programs\.templ\.enable {#opt-perSystem.treefmt.programs.templ.enable}



Whether to enable templ\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/templ\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/templ.nix)



## perSystem\.treefmt\.programs\.templ\.package {#opt-perSystem.treefmt.programs.templ.package}



The templ package to use\.



*Type:*
package



*Default:*
` pkgs.templ `

*Declared by:*
 - [treefmt-nix/programs/templ\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/templ.nix)



## perSystem\.treefmt\.programs\.templ\.excludes {#opt-perSystem.treefmt.programs.templ.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/templ\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/templ.nix)



## perSystem\.treefmt\.programs\.templ\.finalPackage {#opt-perSystem.treefmt.programs.templ.finalPackage}



Resulting ` templ ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/templ\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/templ.nix)



## perSystem\.treefmt\.programs\.templ\.includes {#opt-perSystem.treefmt.programs.templ.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.templ"
]
```

*Declared by:*
 - [treefmt-nix/programs/templ\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/templ.nix)



## perSystem\.treefmt\.programs\.templ\.priority {#opt-perSystem.treefmt.programs.templ.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/templ\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/templ.nix)



## perSystem\.treefmt\.programs\.terraform\.enable {#opt-perSystem.treefmt.programs.terraform.enable}



Whether to enable terraform\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/terraform\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/terraform.nix)



## perSystem\.treefmt\.programs\.terraform\.package {#opt-perSystem.treefmt.programs.terraform.package}



The opentofu package to use\.



*Type:*
package



*Default:*
` pkgs.opentofu `

*Declared by:*
 - [treefmt-nix/programs/terraform\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/terraform.nix)



## perSystem\.treefmt\.programs\.terraform\.excludes {#opt-perSystem.treefmt.programs.terraform.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/terraform\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/terraform.nix)



## perSystem\.treefmt\.programs\.terraform\.finalPackage {#opt-perSystem.treefmt.programs.terraform.finalPackage}



Resulting ` terraform ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/terraform\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/terraform.nix)



## perSystem\.treefmt\.programs\.terraform\.includes {#opt-perSystem.treefmt.programs.terraform.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.tf"
  "*.tfvars"
  "*.tftest.hcl"
]
```

*Declared by:*
 - [treefmt-nix/programs/terraform\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/terraform.nix)



## perSystem\.treefmt\.programs\.terraform\.priority {#opt-perSystem.treefmt.programs.terraform.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/terraform\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/terraform.nix)



## perSystem\.treefmt\.programs\.texfmt\.enable {#opt-perSystem.treefmt.programs.texfmt.enable}



Whether to enable texfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/texfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/texfmt.nix)



## perSystem\.treefmt\.programs\.texfmt\.package {#opt-perSystem.treefmt.programs.texfmt.package}



The tex-fmt package to use\.



*Type:*
package



*Default:*
` pkgs.tex-fmt `

*Declared by:*
 - [treefmt-nix/programs/texfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/texfmt.nix)



## perSystem\.treefmt\.programs\.texfmt\.excludes {#opt-perSystem.treefmt.programs.texfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/texfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/texfmt.nix)



## perSystem\.treefmt\.programs\.texfmt\.finalPackage {#opt-perSystem.treefmt.programs.texfmt.finalPackage}



Resulting ` texfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/texfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/texfmt.nix)



## perSystem\.treefmt\.programs\.texfmt\.includes {#opt-perSystem.treefmt.programs.texfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.tex"
  "*.sty"
  "*.cls"
  "*.bib"
  "*.cmh"
]
```

*Declared by:*
 - [treefmt-nix/programs/texfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/texfmt.nix)



## perSystem\.treefmt\.programs\.texfmt\.priority {#opt-perSystem.treefmt.programs.texfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/texfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/texfmt.nix)



## perSystem\.treefmt\.programs\.toml-sort\.enable {#opt-perSystem.treefmt.programs.toml-sort.enable}



Whether to enable toml-sort\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/toml-sort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/toml-sort.nix)



## perSystem\.treefmt\.programs\.toml-sort\.package {#opt-perSystem.treefmt.programs.toml-sort.package}



The toml-sort package to use\.



*Type:*
package



*Default:*
` pkgs.toml-sort `

*Declared by:*
 - [treefmt-nix/programs/toml-sort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/toml-sort.nix)



## perSystem\.treefmt\.programs\.toml-sort\.all {#opt-perSystem.treefmt.programs.toml-sort.all}



Whether to enable sort ALL keys\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/toml-sort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/toml-sort.nix)



## perSystem\.treefmt\.programs\.toml-sort\.excludes {#opt-perSystem.treefmt.programs.toml-sort.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/toml-sort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/toml-sort.nix)



## perSystem\.treefmt\.programs\.toml-sort\.finalPackage {#opt-perSystem.treefmt.programs.toml-sort.finalPackage}



Resulting ` toml-sort ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/toml-sort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/toml-sort.nix)



## perSystem\.treefmt\.programs\.toml-sort\.includes {#opt-perSystem.treefmt.programs.toml-sort.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.toml"
]
```

*Declared by:*
 - [treefmt-nix/programs/toml-sort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/toml-sort.nix)



## perSystem\.treefmt\.programs\.toml-sort\.priority {#opt-perSystem.treefmt.programs.toml-sort.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/toml-sort\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/toml-sort.nix)



## perSystem\.treefmt\.programs\.typos\.enable {#opt-perSystem.treefmt.programs.typos.enable}



Whether to enable typos\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.package {#opt-perSystem.treefmt.programs.typos.package}



The typos package to use\.



*Type:*
package



*Default:*
` pkgs.typos `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.binary {#opt-perSystem.treefmt.programs.typos.binary}



Search binary files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.configFile {#opt-perSystem.treefmt.programs.typos.configFile}



Custom config file



*Type:*
null or string



*Default:*
` null `



*Example:*
` "typos.toml" `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.excludes {#opt-perSystem.treefmt.programs.typos.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.finalPackage {#opt-perSystem.treefmt.programs.typos.finalPackage}



Resulting ` typos ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.hidden {#opt-perSystem.treefmt.programs.typos.hidden}



Search hidden files and directories



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.includes {#opt-perSystem.treefmt.programs.typos.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.isolated {#opt-perSystem.treefmt.programs.typos.isolated}



Ignore implicit configuration files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.locale {#opt-perSystem.treefmt.programs.typos.locale}



Language locale to suggest corrections for \[possible values: en, en-us, en-gb, en-ca, en-au]



*Type:*
null or one of “en”, “en-us”, “en-gb”, “en-ca”, “en-au”



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noCheckFilenames {#opt-perSystem.treefmt.programs.typos.noCheckFilenames}



Skip verifying spelling in file names



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noCheckFiles {#opt-perSystem.treefmt.programs.typos.noCheckFiles}



Skip verifying spelling in files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noIgnore {#opt-perSystem.treefmt.programs.typos.noIgnore}



Don’t respect ignore files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noIgnoreDot {#opt-perSystem.treefmt.programs.typos.noIgnoreDot}



Don’t respect \.ignore files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noIgnoreGlobal {#opt-perSystem.treefmt.programs.typos.noIgnoreGlobal}



Don’t respect global ignore files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noIgnoreParent {#opt-perSystem.treefmt.programs.typos.noIgnoreParent}



Don’t respect ignore files in parent directories



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noIgnoreVCS {#opt-perSystem.treefmt.programs.typos.noIgnoreVCS}



Don’t respect ignore files in vsc directories



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.noUnicode {#opt-perSystem.treefmt.programs.typos.noUnicode}



Only allow ASCII characters in identifiers



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.priority {#opt-perSystem.treefmt.programs.typos.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.sort {#opt-perSystem.treefmt.programs.typos.sort}



Sort results



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typos\.threads {#opt-perSystem.treefmt.programs.typos.threads}



The approximate number of threads to use \[default: 0]



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [treefmt-nix/programs/typos\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typos.nix)



## perSystem\.treefmt\.programs\.typstyle\.enable {#opt-perSystem.treefmt.programs.typstyle.enable}



Whether to enable typstyle\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.package {#opt-perSystem.treefmt.programs.typstyle.package}



The typstyle package to use\.



*Type:*
package



*Default:*
` pkgs.typstyle `

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.excludes {#opt-perSystem.treefmt.programs.typstyle.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.finalPackage {#opt-perSystem.treefmt.programs.typstyle.finalPackage}



Resulting ` typstyle ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.includes {#opt-perSystem.treefmt.programs.typstyle.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.typ"
  "*.typst"
]
```

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.indentWidth {#opt-perSystem.treefmt.programs.typstyle.indentWidth}



Number of spaces per indent level (default: 2)\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 4 `

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.lineWidth {#opt-perSystem.treefmt.programs.typstyle.lineWidth}



Maximum line width in characters (default: 80)\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 100 `

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.priority {#opt-perSystem.treefmt.programs.typstyle.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.typstyle\.wrapText {#opt-perSystem.treefmt.programs.typstyle.wrapText}



Whether to enable line wrapping of markup text\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/typstyle\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/typstyle.nix)



## perSystem\.treefmt\.programs\.wgslfmt\.enable {#opt-perSystem.treefmt.programs.wgslfmt.enable}



Whether to enable wgslfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/wgslfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/wgslfmt.nix)



## perSystem\.treefmt\.programs\.wgslfmt\.package {#opt-perSystem.treefmt.programs.wgslfmt.package}



The wgsl-analyzer package to use\.



*Type:*
package



*Default:*
` pkgs.wgsl-analyzer `

*Declared by:*
 - [treefmt-nix/programs/wgslfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/wgslfmt.nix)



## perSystem\.treefmt\.programs\.wgslfmt\.excludes {#opt-perSystem.treefmt.programs.wgslfmt.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/wgslfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/wgslfmt.nix)



## perSystem\.treefmt\.programs\.wgslfmt\.finalPackage {#opt-perSystem.treefmt.programs.wgslfmt.finalPackage}



Resulting ` wgslfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/wgslfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/wgslfmt.nix)



## perSystem\.treefmt\.programs\.wgslfmt\.includes {#opt-perSystem.treefmt.programs.wgslfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.wgsl"
]
```

*Declared by:*
 - [treefmt-nix/programs/wgslfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/wgslfmt.nix)



## perSystem\.treefmt\.programs\.wgslfmt\.priority {#opt-perSystem.treefmt.programs.wgslfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/wgslfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/wgslfmt.nix)



## perSystem\.treefmt\.programs\.wgslfmt\.tabs {#opt-perSystem.treefmt.programs.wgslfmt.tabs}



Whether to enable Use tabs for indentation (instead of spaces)\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/wgslfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/wgslfmt.nix)



## perSystem\.treefmt\.programs\.xmllint\.enable {#opt-perSystem.treefmt.programs.xmllint.enable}



Whether to enable xmllint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/xmllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/xmllint.nix)



## perSystem\.treefmt\.programs\.xmllint\.package {#opt-perSystem.treefmt.programs.xmllint.package}



The libxml2 package to use\.



*Type:*
package



*Default:*
` pkgs.libxml2 `

*Declared by:*
 - [treefmt-nix/programs/xmllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/xmllint.nix)



## perSystem\.treefmt\.programs\.xmllint\.excludes {#opt-perSystem.treefmt.programs.xmllint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/xmllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/xmllint.nix)



## perSystem\.treefmt\.programs\.xmllint\.finalPackage {#opt-perSystem.treefmt.programs.xmllint.finalPackage}



Resulting ` xmllint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/xmllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/xmllint.nix)



## perSystem\.treefmt\.programs\.xmllint\.includes {#opt-perSystem.treefmt.programs.xmllint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.xml"
  "*.svg"
  "*.xhtml"
  "*.xsl"
  "*.xslt"
  "*.dtd"
  "*.xsd"
]
```

*Declared by:*
 - [treefmt-nix/programs/xmllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/xmllint.nix)



## perSystem\.treefmt\.programs\.xmllint\.priority {#opt-perSystem.treefmt.programs.xmllint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/xmllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/xmllint.nix)



## perSystem\.treefmt\.programs\.yamlfmt\.enable {#opt-perSystem.treefmt.programs.yamlfmt.enable}



Whether to enable yamlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/yamlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamlfmt.nix)



## perSystem\.treefmt\.programs\.yamlfmt\.package {#opt-perSystem.treefmt.programs.yamlfmt.package}



The yamlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.yamlfmt `

*Declared by:*
 - [treefmt-nix/programs/yamlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamlfmt.nix)



## perSystem\.treefmt\.programs\.yamlfmt\.excludes {#opt-perSystem.treefmt.programs.yamlfmt.excludes}

Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/yamlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamlfmt.nix)



## perSystem\.treefmt\.programs\.yamlfmt\.finalPackage {#opt-perSystem.treefmt.programs.yamlfmt.finalPackage}



Resulting ` yamlfmt ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/yamlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamlfmt.nix)



## perSystem\.treefmt\.programs\.yamlfmt\.includes {#opt-perSystem.treefmt.programs.yamlfmt.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [treefmt-nix/programs/yamlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamlfmt.nix)



## perSystem\.treefmt\.programs\.yamlfmt\.priority {#opt-perSystem.treefmt.programs.yamlfmt.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/yamlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamlfmt.nix)



## perSystem\.treefmt\.programs\.yamlfmt\.settings {#opt-perSystem.treefmt.programs.yamlfmt.settings}



Configuration for yamlfmt, see
\<link xlink:href=“https://github\.com/google/yamlfmt/blob/main/docs/config-file\.md”/>
for supported values\.



*Type:*
open submodule of (YAML 1\.1 value)



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/programs/yamlfmt\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamlfmt.nix)



## perSystem\.treefmt\.programs\.yamllint\.enable {#opt-perSystem.treefmt.programs.yamllint.enable}



Whether to enable yamllint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/yamllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamllint.nix)



## perSystem\.treefmt\.programs\.yamllint\.package {#opt-perSystem.treefmt.programs.yamllint.package}



The yamllint package to use\.



*Type:*
package



*Default:*
` pkgs.yamllint `

*Declared by:*
 - [treefmt-nix/programs/yamllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamllint.nix)



## perSystem\.treefmt\.programs\.yamllint\.excludes {#opt-perSystem.treefmt.programs.yamllint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/yamllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamllint.nix)



## perSystem\.treefmt\.programs\.yamllint\.finalPackage {#opt-perSystem.treefmt.programs.yamllint.finalPackage}



Resulting ` yamllint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/yamllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamllint.nix)



## perSystem\.treefmt\.programs\.yamllint\.includes {#opt-perSystem.treefmt.programs.yamllint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [treefmt-nix/programs/yamllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamllint.nix)



## perSystem\.treefmt\.programs\.yamllint\.priority {#opt-perSystem.treefmt.programs.yamllint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/yamllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamllint.nix)



## perSystem\.treefmt\.programs\.yamllint\.settings {#opt-perSystem.treefmt.programs.yamllint.settings}



Configuration for yamllint, see
\<link xlink:href=“https://yamllint\.readthedocs\.io/en/stable/configuration\.html”/>
for supported values\.



*Type:*
open submodule of (YAML 1\.1 value)



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/programs/yamllint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yamllint.nix)



## perSystem\.treefmt\.programs\.yapf\.enable {#opt-perSystem.treefmt.programs.yapf.enable}



Whether to enable yapf\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/yapf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yapf.nix)



## perSystem\.treefmt\.programs\.yapf\.package {#opt-perSystem.treefmt.programs.yapf.package}



The yapf package to use\.



*Type:*
package



*Default:*
` pkgs.yapf `

*Declared by:*
 - [treefmt-nix/programs/yapf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yapf.nix)



## perSystem\.treefmt\.programs\.yapf\.excludes {#opt-perSystem.treefmt.programs.yapf.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/yapf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yapf.nix)



## perSystem\.treefmt\.programs\.yapf\.finalPackage {#opt-perSystem.treefmt.programs.yapf.finalPackage}



Resulting ` yapf ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/yapf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yapf.nix)



## perSystem\.treefmt\.programs\.yapf\.includes {#opt-perSystem.treefmt.programs.yapf.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [treefmt-nix/programs/yapf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yapf.nix)



## perSystem\.treefmt\.programs\.yapf\.priority {#opt-perSystem.treefmt.programs.yapf.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/yapf\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/yapf.nix)



## perSystem\.treefmt\.programs\.zig\.enable {#opt-perSystem.treefmt.programs.zig.enable}



Whether to enable zig\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/zig\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zig.nix)



## perSystem\.treefmt\.programs\.zig\.package {#opt-perSystem.treefmt.programs.zig.package}



The zig package to use\.



*Type:*
package



*Default:*
` pkgs.zig `

*Declared by:*
 - [treefmt-nix/programs/zig\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zig.nix)



## perSystem\.treefmt\.programs\.zig\.excludes {#opt-perSystem.treefmt.programs.zig.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/zig\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zig.nix)



## perSystem\.treefmt\.programs\.zig\.finalPackage {#opt-perSystem.treefmt.programs.zig.finalPackage}



Resulting ` zig ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/zig\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zig.nix)



## perSystem\.treefmt\.programs\.zig\.includes {#opt-perSystem.treefmt.programs.zig.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.zig"
  "*.zon"
]
```

*Declared by:*
 - [treefmt-nix/programs/zig\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zig.nix)



## perSystem\.treefmt\.programs\.zig\.priority {#opt-perSystem.treefmt.programs.zig.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/zig\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zig.nix)



## perSystem\.treefmt\.programs\.zizmor\.enable {#opt-perSystem.treefmt.programs.zizmor.enable}



Whether to enable zizmor\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/zizmor\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zizmor.nix)



## perSystem\.treefmt\.programs\.zizmor\.package {#opt-perSystem.treefmt.programs.zizmor.package}



The zizmor package to use\.



*Type:*
package



*Default:*
` pkgs.zizmor `

*Declared by:*
 - [treefmt-nix/programs/zizmor\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zizmor.nix)



## perSystem\.treefmt\.programs\.zizmor\.excludes {#opt-perSystem.treefmt.programs.zizmor.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/zizmor\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zizmor.nix)



## perSystem\.treefmt\.programs\.zizmor\.finalPackage {#opt-perSystem.treefmt.programs.zizmor.finalPackage}



Resulting ` zizmor ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/zizmor\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zizmor.nix)



## perSystem\.treefmt\.programs\.zizmor\.includes {#opt-perSystem.treefmt.programs.zizmor.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".github/workflows/*.yml"
  ".github/workflows/*.yaml"
  ".github/actions/**/*.yml"
  ".github/actions/**/*.yaml"
]
```

*Declared by:*
 - [treefmt-nix/programs/zizmor\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zizmor.nix)



## perSystem\.treefmt\.programs\.zizmor\.priority {#opt-perSystem.treefmt.programs.zizmor.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/zizmor\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zizmor.nix)



## perSystem\.treefmt\.programs\.zprint\.enable {#opt-perSystem.treefmt.programs.zprint.enable}



Whether to enable zprint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [treefmt-nix/programs/zprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zprint.nix)



## perSystem\.treefmt\.programs\.zprint\.package {#opt-perSystem.treefmt.programs.zprint.package}



The zprint package to use\.



*Type:*
package



*Default:*
` pkgs.zprint `

*Declared by:*
 - [treefmt-nix/programs/zprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zprint.nix)



## perSystem\.treefmt\.programs\.zprint\.excludes {#opt-perSystem.treefmt.programs.zprint.excludes}



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/programs/zprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zprint.nix)



## perSystem\.treefmt\.programs\.zprint\.finalPackage {#opt-perSystem.treefmt.programs.zprint.finalPackage}



Resulting ` zprint ` package bundled with plugins, if any\.



*Type:*
package *(read only)*

*Declared by:*
 - [treefmt-nix/programs/zprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zprint.nix)



## perSystem\.treefmt\.programs\.zprint\.includes {#opt-perSystem.treefmt.programs.zprint.includes}



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.clj"
  "*.cljc"
  "*.cljs"
  "*.edn"
]
```

*Declared by:*
 - [treefmt-nix/programs/zprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zprint.nix)



## perSystem\.treefmt\.programs\.zprint\.priority {#opt-perSystem.treefmt.programs.zprint.priority}



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/programs/zprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zprint.nix)



## perSystem\.treefmt\.programs\.zprint\.zprintOpts {#opt-perSystem.treefmt.programs.zprint.zprintOpts}



Clojure map containing zprint options\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "{:width 90}" `

*Declared by:*
 - [treefmt-nix/programs/zprint\.nix](https://github.com/numtide/treefmt-nix/blob/master/programs/zprint.nix)



## perSystem\.treefmt\.projectRoot {#opt-perSystem.treefmt.projectRoot}



Path to the root of the project on which treefmt operates



*Type:*
absolute path



*Default:*
` self `

*Declared by:*
 - [treefmt-nix/flake-module\.nix](https://github.com/numtide/treefmt-nix/blob/master/flake-module.nix)



## perSystem\.treefmt\.projectRootFile {#opt-perSystem.treefmt.projectRootFile}



File to look for to determine the root of the project in the
build\.wrapper\.



*Type:*
string



*Default:*
` ".git/config" `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings {#opt-perSystem.treefmt.settings}



The contents of treefmt\.toml



*Type:*
open submodule of (TOML value)



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings\.excludes {#opt-perSystem.treefmt.settings.excludes}



A global list of paths to exclude\. Supports glob\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "node_modules/*"
]
```

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings\.formatter {#opt-perSystem.treefmt.settings.formatter}



Set of formatters to use



*Type:*
attribute set of (open submodule of (TOML value))



*Default:*
` { } `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings\.formatter\.\<name>\.command {#opt-perSystem.treefmt.settings.formatter._name_.command}



Executable obeying the treefmt formatter spec



*Type:*
Path to executable

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings\.formatter\.\<name>\.excludes {#opt-perSystem.treefmt.settings.formatter._name_.excludes}



List of files to exclude for formatting\. Supports globbing\. Takes precedence over the includes\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings\.formatter\.\<name>\.includes {#opt-perSystem.treefmt.settings.formatter._name_.includes}



List of files to include for formatting\. Supports globbing\.



*Type:*
list of string

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings\.formatter\.\<name>\.options {#opt-perSystem.treefmt.settings.formatter._name_.options}



List of arguments to pass to the command



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)



## perSystem\.treefmt\.settings\.on-unmatched {#opt-perSystem.treefmt.settings.on-unmatched}



Log paths that did not match any formatters at the specified log level\.



*Type:*
null or one of “debug”, “info”, “warn”, “error”, “fatal”



*Default:*
` null `

*Declared by:*
 - [treefmt-nix/module-options\.nix](https://github.com/numtide/treefmt-nix/blob/master/module-options.nix)

