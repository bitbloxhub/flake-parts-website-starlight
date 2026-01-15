---
title: devshell

---




Simple per-project developer environments.

Example:

```nix
perSystem = { config, pkgs, ... }: {
  devshells.default = {
    env = [
      {
        name = "HTTP_PORT";
        value = 8080;
      }
    ];
    commands = [
      {
        help = "print hello";
        name = "hello";
        command = "echo hello";
      }
    ];
    packages = [
      pkgs.cowsay
    ];
  };
};
```

See also the [`devshell` project page](https://github.com/numtide/devshell)


## Installation

To use these options, add to your flake inputs:

```nix
devshell.url = "github:numtide/devshell";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.devshell.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

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
 - [devshell/flake-module\.nix](https://github.com/numtide/devshell/blob/main/flake-module.nix)



## perSystem\.devshells\.\<name>\.commands {#opt-perSystem.devshells._name_.commands}



Add commands to the environment\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  {
    help = "print hello";
    name = "hello";
    command = "echo hello";
  }

  {
    package = "nixpkgs-fmt";
    category = "formatter";
  }
]

```

*Declared by:*
 - [devshell/modules/commands\.nix](https://github.com/numtide/devshell/blob/main/modules/commands.nix)



## perSystem\.devshells\.\<name>\.commands\.\*\.package {#opt-perSystem.devshells._name_.commands._.package}



Used to bring in a specific package\. This package will be added to the
environment\.



*Type:*
null or (package or string convertible to it)



*Default:*
` null `

*Declared by:*
 - [devshell/modules/commands\.nix](https://github.com/numtide/devshell/blob/main/modules/commands.nix)



## perSystem\.devshells\.\<name>\.commands\.\*\.category {#opt-perSystem.devshells._name_.commands._.category}



Set a free text category under which this command is grouped
and shown in the help menu\.



*Type:*
string



*Default:*
` "[general commands]" `

*Declared by:*
 - [devshell/modules/commands\.nix](https://github.com/numtide/devshell/blob/main/modules/commands.nix)



## perSystem\.devshells\.\<name>\.commands\.\*\.command {#opt-perSystem.devshells._name_.commands._.command}



If defined, it will add a script with the name of the command, and the
content of this value\.

By default it generates a bash script, unless a different shebang is
provided\.



*Type:*
null or string



*Default:*
` null `



*Example:*

```
''
  #!/usr/bin/env python
  print("Hello")
''
```

*Declared by:*
 - [devshell/modules/commands\.nix](https://github.com/numtide/devshell/blob/main/modules/commands.nix)



## perSystem\.devshells\.\<name>\.commands\.\*\.help {#opt-perSystem.devshells._name_.commands._.help}



Describes what the command does in one line of text\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devshell/modules/commands\.nix](https://github.com/numtide/devshell/blob/main/modules/commands.nix)



## perSystem\.devshells\.\<name>\.commands\.\*\.name {#opt-perSystem.devshells._name_.commands._.name}



Name of this command\. Defaults to attribute name in commands\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devshell/modules/commands\.nix](https://github.com/numtide/devshell/blob/main/modules/commands.nix)



## perSystem\.devshells\.\<name>\.devshell\.packages {#opt-perSystem.devshells._name_.devshell.packages}



The set of packages to appear in the project environment\.

Those packages come from [https://nixos\.org/NixOS/nixpkgs](https://nixos\.org/NixOS/nixpkgs) and can be
searched by going to [https://search\.nixos\.org/packages](https://search\.nixos\.org/packages)



*Type:*
list of (package or string convertible to it)



*Default:*
` [ ] `

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.packagesFrom {#opt-perSystem.devshells._name_.devshell.packagesFrom}



Add all the build dependencies from the listed packages to the
environment\.



*Type:*
list of (package or string convertible to it)



*Default:*
` [ ] `

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.interactive\.\<name>\.deps {#opt-perSystem.devshells._name_.devshell.interactive._name_.deps}



A list of other steps that this one depends on\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.interactive\.\<name>\.text {#opt-perSystem.devshells._name_.devshell.interactive._name_.text}



Script to run\.



*Type:*
string

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.load_profiles {#opt-perSystem.devshells._name_.devshell.load_profiles}



Whether to enable load etc/profiles\.d/\*\.sh in the shell\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.meta {#opt-perSystem.devshells._name_.devshell.meta}



Metadata, such as ‘meta\.description’\. Can be useful as metadata for downstream tooling\.



*Type:*
attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.motd {#opt-perSystem.devshells._name_.devshell.motd}



Message Of The Day\.

This is the welcome message that is being printed when the user opens
the shell\.

You may use any valid ansi color from the 8-bit ansi color table\. For example, to use a green color you would use something like {106}\. You may also use {bold}, {italic}, {underline}\. Use {reset} to turn off all attributes\.



*Type:*
string



*Default:*

```
''
  {202}🔨 Welcome to devshell{reset}
  $(type -p menu &>/dev/null && menu)
''
```

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.name {#opt-perSystem.devshells._name_.devshell.name}



Name of the shell environment\. It usually maps to the project name\.



*Type:*
string



*Default:*
` "devshell" `

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.prj_root_fallback {#opt-perSystem.devshells._name_.devshell.prj_root_fallback}



If IN_NIX_SHELL is nonempty, or DIRENV_IN_ENVRC is set to ‘1’, then
PRJ_ROOT is set to the value of PWD\.

This option specifies the path to use as the value of PRJ_ROOT in case
IN_NIX_SHELL is empty or unset and DIRENV_IN_ENVRC is any value other
than ‘1’\.

Set this to null to force PRJ_ROOT to be defined at runtime (except if
IN_NIX_SHELL or DIRENV_IN_ENVRC are defined as described above)\.

Otherwise, you can set this to a string representing the desired
default path, or to a submodule of the same type valid in the ‘env’
options list (except that the ‘name’ field is ignored)\.



*Type:*
null or ((submodule) or non-empty string convertible to it)



*Default:*

```
{
  eval = "$PWD";
}
```



*Example:*

```
{
  # Use the top-level directory of the working tree
  eval = "$(git rev-parse --show-toplevel)";
};

```

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.prj_root_fallback\.eval {#opt-perSystem.devshells._name_.devshell.prj_root_fallback.eval}



Like value but not evaluated by Bash\. This allows to inject other
variable names or even commands using the ` $() ` notation\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "$OTHER_VAR" `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.devshell\.prj_root_fallback\.name {#opt-perSystem.devshells._name_.devshell.prj_root_fallback.name}



Name of the environment variable



*Type:*
string

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.devshell\.prj_root_fallback\.prefix {#opt-perSystem.devshells._name_.devshell.prj_root_fallback.prefix}



Prepend to PATH-like environment variables\.

For example name = “PATH”; prefix = “bin”; will expand the path of
\./bin and prepend it to the PATH, separated by ‘:’\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "bin" `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.devshell\.prj_root_fallback\.unset {#opt-perSystem.devshells._name_.devshell.prj_root_fallback.unset}



Whether to enable unsets the variable\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.devshell\.prj_root_fallback\.value {#opt-perSystem.devshells._name_.devshell.prj_root_fallback.value}



Shell-escaped value to set



*Type:*
null or string or signed integer or boolean or package



*Default:*
` null `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.devshell\.startup\.\<name>\.deps {#opt-perSystem.devshells._name_.devshell.startup._name_.deps}



A list of other steps that this one depends on\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.devshell\.startup\.\<name>\.text {#opt-perSystem.devshells._name_.devshell.startup._name_.text}



Script to run\.



*Type:*
string

*Declared by:*
 - [devshell/modules/devshell\.nix](https://github.com/numtide/devshell/blob/main/modules/devshell.nix)



## perSystem\.devshells\.\<name>\.env {#opt-perSystem.devshells._name_.env}



Add environment variables to the shell\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  {
    name = "HTTP_PORT";
    value = 8080;
  }
  {
    name = "PATH";
    prefix = "bin";
  }
  {
    name = "XDG_CACHE_DIR";
    eval = "$PRJ_ROOT/.cache";
  }
  {
    name = "CARGO_HOME";
    unset = true;
  }
]

```

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.env\.\*\.eval {#opt-perSystem.devshells._name_.env._.eval}



Like value but not evaluated by Bash\. This allows to inject other
variable names or even commands using the ` $() ` notation\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "$OTHER_VAR" `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.env\.\*\.name {#opt-perSystem.devshells._name_.env._.name}



Name of the environment variable



*Type:*
string

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.env\.\*\.prefix {#opt-perSystem.devshells._name_.env._.prefix}



Prepend to PATH-like environment variables\.

For example name = “PATH”; prefix = “bin”; will expand the path of
\./bin and prepend it to the PATH, separated by ‘:’\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "bin" `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.env\.\*\.unset {#opt-perSystem.devshells._name_.env._.unset}



Whether to enable unsets the variable\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.env\.\*\.value {#opt-perSystem.devshells._name_.env._.value}



Shell-escaped value to set



*Type:*
null or string or signed integer or boolean or package



*Default:*
` null `

*Declared by:*
 - [devshell/modules/env\.nix](https://github.com/numtide/devshell/blob/main/modules/env.nix)



## perSystem\.devshells\.\<name>\.serviceGroups {#opt-perSystem.devshells._name_.serviceGroups}



Add services to the environment\. Services can be used to group long-running processes\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devshell/modules/services\.nix](https://github.com/numtide/devshell/blob/main/modules/services.nix)



## perSystem\.devshells\.\<name>\.serviceGroups\.\<name>\.description {#opt-perSystem.devshells._name_.serviceGroups._name_.description}



Short description of the service group, shown in generated commands



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devshell/modules/services\.nix](https://github.com/numtide/devshell/blob/main/modules/services.nix)



## perSystem\.devshells\.\<name>\.serviceGroups\.\<name>\.name {#opt-perSystem.devshells._name_.serviceGroups._name_.name}



Name of the service group\. Defaults to attribute name in groups\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devshell/modules/services\.nix](https://github.com/numtide/devshell/blob/main/modules/services.nix)



## perSystem\.devshells\.\<name>\.serviceGroups\.\<name>\.services {#opt-perSystem.devshells._name_.serviceGroups._name_.services}



Attrset of services that should be run in this group\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devshell/modules/services\.nix](https://github.com/numtide/devshell/blob/main/modules/services.nix)



## perSystem\.devshells\.\<name>\.serviceGroups\.\<name>\.services\.\<name>\.command {#opt-perSystem.devshells._name_.serviceGroups._name_.services._name_.command}



Command to execute\.



*Type:*
string

*Declared by:*
 - [devshell/modules/services\.nix](https://github.com/numtide/devshell/blob/main/modules/services.nix)



## perSystem\.devshells\.\<name>\.serviceGroups\.\<name>\.services\.\<name>\.name {#opt-perSystem.devshells._name_.serviceGroups._name_.services._name_.name}



Name of this service\. Defaults to attribute name in group services\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devshell/modules/services\.nix](https://github.com/numtide/devshell/blob/main/modules/services.nix)

