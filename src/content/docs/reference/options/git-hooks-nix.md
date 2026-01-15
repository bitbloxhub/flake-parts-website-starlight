---
title: git-hooks-nix

---




Configure pre-commit hooks.

Generates a configuration for [pre-commit](https://pre-commit.com),
provides a script to activate it, and adds a [check](flake-parts.html#opt-perSystem.checks).

Pre-defined hooks are maintained at [`cachix/git-hooks.nix`](https://github.com/cachix/git-hooks.nix).


## Installation

To use these options, add to your flake inputs:

```nix
git-hooks-nix.url = "github:cachix/git-hooks.nix";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.git-hooks-nix.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.pre-commit\.check\.enable {#opt-perSystem.pre-commit.check.enable}

Whether to add a derivation to the flake ` checks `\.
It will perform the pre-commit checks in ` nix flake check `\.

You can disable this if one of your hooks do not run properly in
the Nix sandbox; for example because it needs network access\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/flake-module\.nix](https://github.com/cachix/git-hooks.nix/blob/master/flake-module.nix)



## perSystem\.pre-commit\.devShell {#opt-perSystem.pre-commit.devShell}



A development shell with the git hooks installed and all the packages made available\.



*Type:*
package *(read only)*

*Declared by:*
 - [git-hooks-nix/flake-module\.nix](https://github.com/cachix/git-hooks.nix/blob/master/flake-module.nix)



## perSystem\.pre-commit\.installationScript {#opt-perSystem.pre-commit.installationScript}



A bash snippet that sets up the git hooks in the current repository\.



*Type:*
string *(read only)*



*Default:*
` bash statements `

*Declared by:*
 - [git-hooks-nix/flake-module\.nix](https://github.com/cachix/git-hooks.nix/blob/master/flake-module.nix)



## perSystem\.pre-commit\.pkgs {#opt-perSystem.pre-commit.pkgs}



Nixpkgs to use in the pre-commit [` settings `](\#opt-perSystem\.pre-commit\.settings)\.



*Type:*
lazy attribute set of raw value



*Default:*
`` `pkgs` (module argument) ``

*Declared by:*
 - [git-hooks-nix/flake-module\.nix](https://github.com/cachix/git-hooks.nix/blob/master/flake-module.nix)



## perSystem\.pre-commit\.settings {#opt-perSystem.pre-commit.settings}



The git-hooks\.nix configuration\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [git-hooks-nix/flake-module\.nix](https://github.com/cachix/git-hooks.nix/blob/master/flake-module.nix)



## perSystem\.pre-commit\.settings\.enable {#opt-perSystem.pre-commit.settings.enable}



Whether to enable the pre-commit hooks module\.

When set to false, this disables the entire module\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.enabledPackages {#opt-perSystem.pre-commit.settings.enabledPackages}



All packages provided by hooks that are enabled\.

Useful for including into the developer environment\.



*Type:*
list of unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.package {#opt-perSystem.pre-commit.settings.package}



The ` pre-commit ` package to use\.



*Type:*
package



*Default:*
` pkgs.pre-commit `



*Example:*
` pkgs.prek `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.addGcRoot {#opt-perSystem.pre-commit.settings.addGcRoot}



Whether to add the generated pre-commit config to the garbage collector roots\.
This prevents Nix from garbage-collecting the tools used by hooks\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.configFile {#opt-perSystem.pre-commit.settings.configFile}



The pre-commit configuration file\.



*Type:*
package *(read only)*



*Default:*
` "<derivation>" `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.configPath {#opt-perSystem.pre-commit.settings.configPath}



The path where to generate the pre-commit configuration file\.

This path is relative to the root of the project\. By default,
this is set to “\.pre-commit-config\.yaml”, which is the standard
location expected by pre-commit\.



*Type:*
string



*Default:*
` ".pre-commit-config.yaml" `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.default_stages {#opt-perSystem.pre-commit.settings.default_stages}



A configuration wide option for the stages property\.
Installs hooks to the defined stages\.
See [https://pre-commit\.com/\#confining-hooks-to-run-at-certain-stages](https://pre-commit\.com/\#confining-hooks-to-run-at-certain-stages)\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*

```
[
  "pre-commit"
]
```

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.excludes {#opt-perSystem.pre-commit.settings.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.gitPackage {#opt-perSystem.pre-commit.settings.gitPackage}



The ` git ` package to use\.



*Type:*
package



*Default:*
` pkgs.gitMinimal `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.hooks {#opt-perSystem.pre-commit.settings.hooks}



The hook definitions\.

You can both specify your own hooks here and you can enable predefined hooks\.

Example of enabling a predefined hook:

```nix
hooks.nixpkgs-fmt.enable = true;
```

Example of a custom hook:

```nix
hooks.my-tool = {
  enable = true;
  name = "my-tool";
  description = "Run MyTool on all files in the project";
  files = "\\.mtl$";
  entry = "${pkgs.my-tool}/bin/mytoolctl";
};
```

The predefined hooks are:

**` action-validator `**

Tool to validate GitHub Action and Workflow YAML files

**` actionlint `**

Static checker for GitHub Actions workflow files

**` alejandra `**

The Uncompromising Nix Code Formatter

**` annex `**

Runs the git-annex hook for large file support

**` ansible-lint `**

Ansible linter

**` autoflake `**

Remove unused imports and variables from Python code

**` bats `**

Run bash unit tests

**` beautysh `**

Format shell files

**` biome `**

A toolchain for web projects, aimed to provide functionalities to maintain them

**` black `**

The uncompromising Python code formatter

**` cabal-fmt `**

Format Cabal files

**` cabal-gild `**

Format Cabal files

**` cabal2nix `**

Run ` cabal2nix ` on all ` *.cabal ` files to generate corresponding ` .nix ` files

**` cargo-check `**

Check the cargo package for errors

**` chart-testing `**

CLI tool for linting and testing Helm charts

**` check-added-large-files `**

Prevent very large files to be committed (e\.g\. binaries)\.

**` check-builtin-literals `**

Require literal syntax when initializing empty or zero builtin types in Python\.

**` check-case-conflicts `**

Check for files that would conflict in case-insensitive filesystems\.

**` check-docstring-first `**

Check that all docstrings appear above the code\.

**` check-executables-have-shebangs `**

Ensure that all non-binary executables have shebangs\.

**` check-json `**

Check syntax of JSON files\.

**` check-merge-conflicts `**

Check for files that contain merge conflict strings\.

**` check-python `**

Check syntax of Python file by parsing Python abstract syntax tree\.

**` check-shebang-scripts-are-executable `**

Ensure that all (non-binary) files with a shebang are executable\.

**` check-symlinks `**

Find broken symlinks\.

**` check-toml `**

Check syntax of TOML files\.

**` check-vcs-permalinks `**

Ensure that links to VCS websites are permalinks\.

**` check-xml `**

Check syntax of XML files\.

**` check-yaml `**

Check syntax of YAML files\.

**` checkmake `**

Experimental linter/analyzer for Makefiles

**` chktex `**

LaTeX semantic checker

**` circleci `**

Validate CircleCI config files\.

**` clang-format `**

Format your code using ` clang-format `\.

**` clang-tidy `**

Static analyzer for C++ code\.

**` clippy `**

Lint Rust code\.

**` cljfmt `**

A tool for formatting Clojure code\.

**` cmake-format `**

A tool for formatting CMake-files\.

**` commitizen `**

Check whether the current commit message follows committing rules\.

**` comrak `**

A 100% CommonMark-compatible GitHub Flavored Markdown formatter

**` conform `**

Policy enforcement for commits\.

**` convco `**

**` credo `**

Runs a static code analysis using Credo

**` crystal `**

A tool that automatically formats Crystal source code

**` cspell `**

A Spell Checker for Code

**` dart-analyze `**

Dart analyzer

**` dart-format `**

Dart formatter

**` deadnix `**

Scan Nix files for dead code (unused variable bindings)\.

**` denofmt `**

Auto-format JavaScript, TypeScript, Markdown, and JSON files\.

**` denolint `**

Lint JavaScript/TypeScript source code\.

**` detect-aws-credentials `**

Detect AWS credentials from the AWS cli credentials file\.

**` detect-private-keys `**

Detect the presence of private keys\.

**` dhall-format `**

Dhall code formatter\.

**` dialyzer `**

Runs a static code analysis using Dialyzer

**` dune-fmt `**

Runs Dune’s formatters on the code tree\.

**` dune-opam-sync `**

Check that Dune-generated OPAM files are in sync\.

**` eclint `**

EditorConfig linter written in Go\.

**` editorconfig-checker `**

Verify that the files are in harmony with the ` .editorconfig `\.

**` elm-format `**

Format Elm files\.

**` elm-review `**

Analyzes Elm projects, to help find mistakes before your users find them\.

**` elm-test `**

Run unit tests and fuzz tests for Elm code\.

**` end-of-file-fixer `**

Ensures that a file is either empty, or ends with a single newline\.

**` eslint `**

Find and fix problems in your JavaScript code\.

**` fix-byte-order-marker `**

Remove UTF-8 byte order marker\.

**` fix-encoding-pragma `**

Adds \# -*- coding: utf-8 -*- to the top of Python files\.’

**` flake-checker `**

Run health checks on your flake-powered Nix projects\.

**` flake8 `**

Check the style and quality of Python files\.

**` flynt `**

CLI tool to convert a python project’s %-formatted strings to f-strings\.

**` forbid-new-submodules `**

Prevent addition of new Git submodules\.

**` fourmolu `**

Haskell code prettifier\.

**` fprettify `**

Auto-formatter for modern Fortran code\.

**` gitlint `**

Linting for your git commit messages

**` gofmt `**

A tool that automatically formats Go source code

**` golangci-lint `**

Fast linters runner for Go\.

**` golines `**

A golang formatter that fixes long lines

**` gotest `**

Run go tests

**` govet `**

Checks correctness of Go programs\.

**` gptcommit `**

Generate a commit message using GPT3\.

**` hadolint `**

Dockerfile linter, validate inline bash\.

**` headache `**

Lightweight tool for managing headers in source code files\.

**` hindent `**

Haskell code prettifier\.

**` hledger-fmt `**

Opinionated hledger’s journal files formatter\.

**` hlint `**

HLint gives suggestions on how to improve your source code\.

**` hpack `**

` hpack ` converts package definitions in the hpack format (` package.yaml `) to Cabal files\.

**` html-tidy `**

HTML linter\.

**` hunspell `**

Spell checker and morphological analyzer\.

**` isort `**

A Python utility / library to sort imports\.

**` juliaformatter `**

Run JuliaFormatter\.jl against Julia source files

**` keep-sorted `**

Language-agnostic formatter that sorts lines between two markers in a larger file\.

**` lacheck `**

A consistency checker for LaTeX documents\.

**` latexindent `**

Perl script to add indentation to LaTeX files\.

**` lua-ls `**

Uses the lua-language-server CLI to statically type-check and lint Lua code\.

**` luacheck `**

A tool for linting and static analysis of Lua code\.

**` lychee `**

A fast, async, stream-based link checker that finds broken hyperlinks and mail addresses inside Markdown, HTML, reStructuredText, or any other text file or website\.

**` markdownlint `**

Style checker and linter for markdown files\.

**` mdformat `**

CommonMark compliant Markdown formatter

**` mdl `**

A tool to check markdown files and flag style issues\.

**` mdsh `**

Markdown shell pre-processor\.

**` mix-format `**

Runs the built-in Elixir syntax formatter

**` mix-test `**

Runs the built-in Elixir test framework

**` mixed-line-endings `**

Resolve mixed line endings\.

**` mkdocs-linkcheck `**

Validate links associated with markdown-based, statically generated websites\.

**` mypy `**

Static type checker for Python

**` name-tests-test `**

Verify that Python test files are named correctly\.

**` nbstripout `**

Strip output from Jupyter notebooks

**` nil `**

Incremental analysis assistant for writing in Nix\.

**` nixfmt `**

Official Nix code formatter\.

**` nixfmt-classic `**

Nix code prettifier (classic)\.

**` nixfmt-rfc-style `**

Nix code prettifier (RFC 166 style)\.

**` nixpkgs-fmt `**

Nix code prettifier\.

**` no-commit-to-branch `**

Disallow committing to certain branch/branches\.

**` ocp-indent `**

A tool to indent OCaml code\.

**` opam-lint `**

OCaml package manager configuration checker\.

**` openapi-spec-validator `**

A tool to validate OpenAPI spec files

**` ormolu `**

Haskell code prettifier\.

**` php-cs-fixer `**

Lint PHP files\.

**` phpcbf `**

Lint PHP files\.

**` phpcs `**

Lint PHP files\.

**` phpstan `**

Static Analysis of PHP files\.

**` poetry-check `**

Check the Poetry config for errors

**` poetry-lock `**

Update the Poetry lock file

**` pre-commit-hook-ensure-sops `**

**` prettier `**

Opinionated multi-language code formatter\.

**` pretty-format-json `**

Formats JSON files\.

**` proselint `**

A linter for prose\.

**` psalm `**

Static Analysis of PHP files\.

**` purs-tidy `**

Format purescript files\.

**` pylint `**

Lint Python files\.

**` pyright `**

Static type checker for Python

**` python-debug-statements `**

Check for debugger imports and py37+ ` breakpoint() ` calls in python source\.

**` pyupgrade `**

Automatically upgrade syntax for newer versions\.

**` reuse `**

reuse is a tool for compliance with the REUSE recommendations\.

**` revive `**

A linter for Go source code\.

**` ripsecrets `**

Prevent committing secret keys into your source code

**` rome `**

**` ruff `**

An extremely fast Python linter, written in Rust\.

**` ruff-format `**

An extremely fast Python code formatter, written in Rust\.

**` rumdl `**

Style checker and linter for rumdl files\.

**` rustfmt `**

Format Rust code\.

**` selene `**

A blazing-fast modern Lua linter written in Rust\.

**` shellcheck `**

Format shell files\.

**` shfmt `**

Format shell files\.

**` single-quoted-strings `**

Replace double quoted strings with single quoted strings\.

**` sort-file-contents `**

Sort the lines in specified files (defaults to alphabetical)\.

**` sort-requirements-txt `**

Sort requirements in requirements\.txt and constraints\.txt files\.

**` sort-simple-yaml `**

Sort simple YAML files which consist only of top-level keys, preserving comments and blocks\.

**` staticcheck `**

State of the art linter for the Go programming language

**` statix `**

Lints and suggestions for the Nix programming language\.

**` stylish-haskell `**

A simple Haskell code prettifier

**` stylua `**

An Opinionated Lua Code Formatter\.

**` tagref `**

Have tagref check all references and tags\.

**` taplo `**

Format TOML files with taplo fmt

**` terraform-format `**

Format Terraform (` .tf `) files\.

**` terraform-validate `**

Validates terraform configuration files (` .tf `)\.

**` tflint `**

A Pluggable Terraform Linter\.

**` topiary `**

A universal formatter engine within the Tree-sitter ecosystem, with support for many languages\.

**` treefmt `**

One CLI to format the code tree\.

**` trim-trailing-whitespace `**

Trim trailing whitespace\.

**` trufflehog `**

Secrets scanner

**` typos `**

Source code spell checker

**` typstyle `**

Beautiful and reliable typst code formatter

**` uv-check `**

Check if uv’s lockfile is up-to-date\.

**` uv-export `**

Export uv’s lockfile\.

**` uv-lock `**

Update uv’s lockfile\.

**` vale `**

A markup-aware linter for prose built with speed and extensibility in mind\.

**` woodpecker-cli-lint `**

Command line client for the Woodpecker Continuous Integration server (lint only)\.

**` yamlfmt `**

Formatter for YAML files\.

**` yamllint `**

Linter for YAML files\.

**` zizmor `**

Static analysis for GitHub Actions

**` zprint `**

Beautifully format Clojure and Clojurescript source code and s-expressions\.



*Type:*
open submodule of attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.enable {#opt-perSystem.pre-commit.settings.hooks._name_.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.package {#opt-perSystem.pre-commit.settings.hooks._name_.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.after {#opt-perSystem.pre-commit.settings.hooks._name_.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.always_run {#opt-perSystem.pre-commit.settings.hooks._name_.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.args {#opt-perSystem.pre-commit.settings.hooks._name_.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.before {#opt-perSystem.pre-commit.settings.hooks._name_.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.description {#opt-perSystem.pre-commit.settings.hooks._name_.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.entry {#opt-perSystem.pre-commit.settings.hooks._name_.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.exclude_types {#opt-perSystem.pre-commit.settings.hooks._name_.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.excludes {#opt-perSystem.pre-commit.settings.hooks._name_.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.extraPackages {#opt-perSystem.pre-commit.settings.hooks._name_.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.fail_fast {#opt-perSystem.pre-commit.settings.hooks._name_.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.files {#opt-perSystem.pre-commit.settings.hooks._name_.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.id {#opt-perSystem.pre-commit.settings.hooks._name_.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.language {#opt-perSystem.pre-commit.settings.hooks._name_.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.name {#opt-perSystem.pre-commit.settings.hooks._name_.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks._name_.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.raw {#opt-perSystem.pre-commit.settings.hooks._name_.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.require_serial {#opt-perSystem.pre-commit.settings.hooks._name_.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.stages {#opt-perSystem.pre-commit.settings.hooks._name_.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.types {#opt-perSystem.pre-commit.settings.hooks._name_.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.types_or {#opt-perSystem.pre-commit.settings.hooks._name_.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.\<name>\.verbose {#opt-perSystem.pre-commit.settings.hooks._name_.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra {#opt-perSystem.pre-commit.settings.hooks.alejandra}



alejandra hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.enable {#opt-perSystem.pre-commit.settings.hooks.alejandra.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.package {#opt-perSystem.pre-commit.settings.hooks.alejandra.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.after {#opt-perSystem.pre-commit.settings.hooks.alejandra.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.always_run {#opt-perSystem.pre-commit.settings.hooks.alejandra.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.args {#opt-perSystem.pre-commit.settings.hooks.alejandra.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.before {#opt-perSystem.pre-commit.settings.hooks.alejandra.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.description {#opt-perSystem.pre-commit.settings.hooks.alejandra.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.entry {#opt-perSystem.pre-commit.settings.hooks.alejandra.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.alejandra.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.excludes {#opt-perSystem.pre-commit.settings.hooks.alejandra.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.alejandra.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.alejandra.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.files {#opt-perSystem.pre-commit.settings.hooks.alejandra.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.id {#opt-perSystem.pre-commit.settings.hooks.alejandra.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.language {#opt-perSystem.pre-commit.settings.hooks.alejandra.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.name {#opt-perSystem.pre-commit.settings.hooks.alejandra.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.alejandra.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.raw {#opt-perSystem.pre-commit.settings.hooks.alejandra.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.require_serial {#opt-perSystem.pre-commit.settings.hooks.alejandra.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.settings\.check {#opt-perSystem.pre-commit.settings.hooks.alejandra.settings.check}



Check if the input is already formatted and disable writing in-place the modified content



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.alejandra.settings.configPath}



(experimental) Path to the alejandra\.toml configuration file\.



*Type:*
null or string or absolute path



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.settings\.exclude {#opt-perSystem.pre-commit.settings.hooks.alejandra.settings.exclude}



Files or directories to exclude from formatting\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "flake.nix"
  "./templates"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.settings\.threads {#opt-perSystem.pre-commit.settings.hooks.alejandra.settings.threads}



Number of formatting threads to spawn\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 8 `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.settings\.verbosity {#opt-perSystem.pre-commit.settings.hooks.alejandra.settings.verbosity}



Whether informational messages or all messages should be hidden or not\.



*Type:*
one of “normal”, “quiet”, “silent”



*Default:*
` "normal" `



*Example:*
` "quiet" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.stages {#opt-perSystem.pre-commit.settings.hooks.alejandra.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.types {#opt-perSystem.pre-commit.settings.hooks.alejandra.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.types_or {#opt-perSystem.pre-commit.settings.hooks.alejandra.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.alejandra\.verbose {#opt-perSystem.pre-commit.settings.hooks.alejandra.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint {#opt-perSystem.pre-commit.settings.hooks.ansible-lint}



ansible-lint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.enable {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.package {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.after {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.always_run {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.args {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.before {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.description {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.entry {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.excludes {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.files {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.id {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.language {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.name {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.raw {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.settings.configPath}



Path to the YAML configuration file\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.settings\.subdir {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.settings.subdir}



Path to the Ansible subdirectory\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.stages {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.types {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.types_or {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ansible-lint\.verbose {#opt-perSystem.pre-commit.settings.hooks.ansible-lint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake {#opt-perSystem.pre-commit.settings.hooks.autoflake}



autoflake hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.enable {#opt-perSystem.pre-commit.settings.hooks.autoflake.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.package {#opt-perSystem.pre-commit.settings.hooks.autoflake.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.after {#opt-perSystem.pre-commit.settings.hooks.autoflake.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.always_run {#opt-perSystem.pre-commit.settings.hooks.autoflake.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.args {#opt-perSystem.pre-commit.settings.hooks.autoflake.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.before {#opt-perSystem.pre-commit.settings.hooks.autoflake.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.description {#opt-perSystem.pre-commit.settings.hooks.autoflake.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.entry {#opt-perSystem.pre-commit.settings.hooks.autoflake.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.autoflake.exclude_types}

List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.excludes {#opt-perSystem.pre-commit.settings.hooks.autoflake.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.autoflake.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.autoflake.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.files {#opt-perSystem.pre-commit.settings.hooks.autoflake.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.id {#opt-perSystem.pre-commit.settings.hooks.autoflake.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.language {#opt-perSystem.pre-commit.settings.hooks.autoflake.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.name {#opt-perSystem.pre-commit.settings.hooks.autoflake.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.autoflake.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.raw {#opt-perSystem.pre-commit.settings.hooks.autoflake.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.require_serial {#opt-perSystem.pre-commit.settings.hooks.autoflake.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.autoflake.settings.binPath}



Path to autoflake binary\.



*Type:*
null or string



*Default:*

```
"${tools.autoflake}/bin/autoflake"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.autoflake.settings.flags}



Flags passed to autoflake\.



*Type:*
string



*Default:*
` "--in-place --expand-star-imports --remove-duplicate-keys --remove-unused-variables" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.stages {#opt-perSystem.pre-commit.settings.hooks.autoflake.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.types {#opt-perSystem.pre-commit.settings.hooks.autoflake.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.types_or {#opt-perSystem.pre-commit.settings.hooks.autoflake.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.autoflake\.verbose {#opt-perSystem.pre-commit.settings.hooks.autoflake.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome {#opt-perSystem.pre-commit.settings.hooks.biome}



biome hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.enable {#opt-perSystem.pre-commit.settings.hooks.biome.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.package {#opt-perSystem.pre-commit.settings.hooks.biome.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.after {#opt-perSystem.pre-commit.settings.hooks.biome.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.always_run {#opt-perSystem.pre-commit.settings.hooks.biome.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.args {#opt-perSystem.pre-commit.settings.hooks.biome.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.before {#opt-perSystem.pre-commit.settings.hooks.biome.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.description {#opt-perSystem.pre-commit.settings.hooks.biome.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.entry {#opt-perSystem.pre-commit.settings.hooks.biome.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.biome.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.excludes {#opt-perSystem.pre-commit.settings.hooks.biome.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.biome.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.biome.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.files {#opt-perSystem.pre-commit.settings.hooks.biome.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.id {#opt-perSystem.pre-commit.settings.hooks.biome.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.language {#opt-perSystem.pre-commit.settings.hooks.biome.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.name {#opt-perSystem.pre-commit.settings.hooks.biome.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.biome.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.raw {#opt-perSystem.pre-commit.settings.hooks.biome.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.require_serial {#opt-perSystem.pre-commit.settings.hooks.biome.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.biome.settings.binPath}



` biome ` binary path\.
For example, if you want to use the ` biome ` binary from ` node_modules `, use ` "./node_modules/.bin/biome" `\.
Use a string instead of a path to avoid having to Git track the file in projects that use Nix flakes\.



*Type:*
null or string or absolute path



*Default:*

```
"${tools.biome}/bin/biome"

```



*Example:*

```
"./node_modules/.bin/biome"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.biome.settings.configPath}



Path to the configuration JSON file



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.settings\.write {#opt-perSystem.pre-commit.settings.hooks.biome.settings.write}



Whether to edit files inplace\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.stages {#opt-perSystem.pre-commit.settings.hooks.biome.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.types {#opt-perSystem.pre-commit.settings.hooks.biome.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.types_or {#opt-perSystem.pre-commit.settings.hooks.biome.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.biome\.verbose {#opt-perSystem.pre-commit.settings.hooks.biome.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black {#opt-perSystem.pre-commit.settings.hooks.black}



black hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.enable {#opt-perSystem.pre-commit.settings.hooks.black.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.package {#opt-perSystem.pre-commit.settings.hooks.black.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.after {#opt-perSystem.pre-commit.settings.hooks.black.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.always_run {#opt-perSystem.pre-commit.settings.hooks.black.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.args {#opt-perSystem.pre-commit.settings.hooks.black.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.before {#opt-perSystem.pre-commit.settings.hooks.black.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.description {#opt-perSystem.pre-commit.settings.hooks.black.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.entry {#opt-perSystem.pre-commit.settings.hooks.black.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.black.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.excludes {#opt-perSystem.pre-commit.settings.hooks.black.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.black.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.black.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.files {#opt-perSystem.pre-commit.settings.hooks.black.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.id {#opt-perSystem.pre-commit.settings.hooks.black.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.language {#opt-perSystem.pre-commit.settings.hooks.black.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.name {#opt-perSystem.pre-commit.settings.hooks.black.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.black.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.raw {#opt-perSystem.pre-commit.settings.hooks.black.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.require_serial {#opt-perSystem.pre-commit.settings.hooks.black.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.black.settings.flags}



Flags passed to black\. See all available [here](https://black\.readthedocs\.io/en/stable/usage_and_configuration/the_basics\.html\#command-line-options)\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "--skip-magic-trailing-comma" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.stages {#opt-perSystem.pre-commit.settings.hooks.black.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.types {#opt-perSystem.pre-commit.settings.hooks.black.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.types_or {#opt-perSystem.pre-commit.settings.hooks.black.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.black\.verbose {#opt-perSystem.pre-commit.settings.hooks.black.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix {#opt-perSystem.pre-commit.settings.hooks.cabal2nix}



cabal2nix hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.enable {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.package {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.after {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.always_run {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.args {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.before {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.description {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.entry {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.excludes {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.files {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.id {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.language {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.name {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.raw {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.require_serial {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.settings\.outputFilename {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.settings.outputFilename}



The name of the output file generated after running ` cabal2nix `\.



*Type:*
string



*Default:*
` "default.nix" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.stages {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.types {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.types_or {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cabal2nix\.verbose {#opt-perSystem.pre-commit.settings.hooks.cabal2nix.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy {#opt-perSystem.pre-commit.settings.hooks.clippy}



clippy hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.enable {#opt-perSystem.pre-commit.settings.hooks.clippy.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.package {#opt-perSystem.pre-commit.settings.hooks.clippy.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.packageOverrides\.cargo {#opt-perSystem.pre-commit.settings.hooks.clippy.packageOverrides.cargo}



The cargo package to use



*Type:*
package

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.packageOverrides\.clippy {#opt-perSystem.pre-commit.settings.hooks.clippy.packageOverrides.clippy}



The clippy package to use



*Type:*
package

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.after {#opt-perSystem.pre-commit.settings.hooks.clippy.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.always_run {#opt-perSystem.pre-commit.settings.hooks.clippy.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.args {#opt-perSystem.pre-commit.settings.hooks.clippy.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.before {#opt-perSystem.pre-commit.settings.hooks.clippy.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.description {#opt-perSystem.pre-commit.settings.hooks.clippy.description}

Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.entry {#opt-perSystem.pre-commit.settings.hooks.clippy.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.clippy.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.excludes {#opt-perSystem.pre-commit.settings.hooks.clippy.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.clippy.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.clippy.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.files {#opt-perSystem.pre-commit.settings.hooks.clippy.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.id {#opt-perSystem.pre-commit.settings.hooks.clippy.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.language {#opt-perSystem.pre-commit.settings.hooks.clippy.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.name {#opt-perSystem.pre-commit.settings.hooks.clippy.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.clippy.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.raw {#opt-perSystem.pre-commit.settings.hooks.clippy.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.require_serial {#opt-perSystem.pre-commit.settings.hooks.clippy.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.settings\.allFeatures {#opt-perSystem.pre-commit.settings.hooks.clippy.settings.allFeatures}



Run clippy with --all-features



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.settings\.denyWarnings {#opt-perSystem.pre-commit.settings.hooks.clippy.settings.denyWarnings}



Fail when warnings are present



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.settings\.extraArgs {#opt-perSystem.pre-commit.settings.hooks.clippy.settings.extraArgs}



Additional arguments to pass to clippy



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.settings\.offline {#opt-perSystem.pre-commit.settings.hooks.clippy.settings.offline}



Run clippy offline



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.stages {#opt-perSystem.pre-commit.settings.hooks.clippy.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.types {#opt-perSystem.pre-commit.settings.hooks.clippy.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.types_or {#opt-perSystem.pre-commit.settings.hooks.clippy.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.clippy\.verbose {#opt-perSystem.pre-commit.settings.hooks.clippy.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format {#opt-perSystem.pre-commit.settings.hooks.cmake-format}



cmake-format hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.enable {#opt-perSystem.pre-commit.settings.hooks.cmake-format.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.package {#opt-perSystem.pre-commit.settings.hooks.cmake-format.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.after {#opt-perSystem.pre-commit.settings.hooks.cmake-format.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.always_run {#opt-perSystem.pre-commit.settings.hooks.cmake-format.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.args {#opt-perSystem.pre-commit.settings.hooks.cmake-format.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.before {#opt-perSystem.pre-commit.settings.hooks.cmake-format.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.description {#opt-perSystem.pre-commit.settings.hooks.cmake-format.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.entry {#opt-perSystem.pre-commit.settings.hooks.cmake-format.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.cmake-format.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.excludes {#opt-perSystem.pre-commit.settings.hooks.cmake-format.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.cmake-format.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.cmake-format.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.files {#opt-perSystem.pre-commit.settings.hooks.cmake-format.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.id {#opt-perSystem.pre-commit.settings.hooks.cmake-format.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.language {#opt-perSystem.pre-commit.settings.hooks.cmake-format.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.name {#opt-perSystem.pre-commit.settings.hooks.cmake-format.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.cmake-format.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.raw {#opt-perSystem.pre-commit.settings.hooks.cmake-format.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.require_serial {#opt-perSystem.pre-commit.settings.hooks.cmake-format.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.cmake-format.settings.configPath}



Path to the configuration file (\.json,\.python,\.yaml)



*Type:*
string



*Default:*
` "" `



*Example:*
` ".cmake-format.json" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.stages {#opt-perSystem.pre-commit.settings.hooks.cmake-format.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.types {#opt-perSystem.pre-commit.settings.hooks.cmake-format.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.types_or {#opt-perSystem.pre-commit.settings.hooks.cmake-format.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.cmake-format\.verbose {#opt-perSystem.pre-commit.settings.hooks.cmake-format.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco {#opt-perSystem.pre-commit.settings.hooks.convco}



convco hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.enable {#opt-perSystem.pre-commit.settings.hooks.convco.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.package {#opt-perSystem.pre-commit.settings.hooks.convco.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.after {#opt-perSystem.pre-commit.settings.hooks.convco.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.always_run {#opt-perSystem.pre-commit.settings.hooks.convco.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.args {#opt-perSystem.pre-commit.settings.hooks.convco.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.before {#opt-perSystem.pre-commit.settings.hooks.convco.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.description {#opt-perSystem.pre-commit.settings.hooks.convco.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.entry {#opt-perSystem.pre-commit.settings.hooks.convco.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.convco.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.excludes {#opt-perSystem.pre-commit.settings.hooks.convco.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.convco.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.convco.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.files {#opt-perSystem.pre-commit.settings.hooks.convco.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.id {#opt-perSystem.pre-commit.settings.hooks.convco.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.language {#opt-perSystem.pre-commit.settings.hooks.convco.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.name {#opt-perSystem.pre-commit.settings.hooks.convco.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.convco.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.raw {#opt-perSystem.pre-commit.settings.hooks.convco.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.require_serial {#opt-perSystem.pre-commit.settings.hooks.convco.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.convco.settings.configPath}



Path to the configuration file (YAML or JSON)



*Type:*
null or string or absolute path



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.stages {#opt-perSystem.pre-commit.settings.hooks.convco.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.types {#opt-perSystem.pre-commit.settings.hooks.convco.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.types_or {#opt-perSystem.pre-commit.settings.hooks.convco.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.convco\.verbose {#opt-perSystem.pre-commit.settings.hooks.convco.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo {#opt-perSystem.pre-commit.settings.hooks.credo}



credo hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.enable {#opt-perSystem.pre-commit.settings.hooks.credo.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.package {#opt-perSystem.pre-commit.settings.hooks.credo.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.after {#opt-perSystem.pre-commit.settings.hooks.credo.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.always_run {#opt-perSystem.pre-commit.settings.hooks.credo.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.args {#opt-perSystem.pre-commit.settings.hooks.credo.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.before {#opt-perSystem.pre-commit.settings.hooks.credo.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.description {#opt-perSystem.pre-commit.settings.hooks.credo.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.entry {#opt-perSystem.pre-commit.settings.hooks.credo.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.credo.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.excludes {#opt-perSystem.pre-commit.settings.hooks.credo.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.credo.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.credo.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.files {#opt-perSystem.pre-commit.settings.hooks.credo.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.id {#opt-perSystem.pre-commit.settings.hooks.credo.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.language {#opt-perSystem.pre-commit.settings.hooks.credo.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.name {#opt-perSystem.pre-commit.settings.hooks.credo.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.credo.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.raw {#opt-perSystem.pre-commit.settings.hooks.credo.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.require_serial {#opt-perSystem.pre-commit.settings.hooks.credo.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.settings\.strict {#opt-perSystem.pre-commit.settings.hooks.credo.settings.strict}



Whether to auto-promote the changes\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.stages {#opt-perSystem.pre-commit.settings.hooks.credo.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.types {#opt-perSystem.pre-commit.settings.hooks.credo.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.types_or {#opt-perSystem.pre-commit.settings.hooks.credo.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.credo\.verbose {#opt-perSystem.pre-commit.settings.hooks.credo.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix {#opt-perSystem.pre-commit.settings.hooks.deadnix}

deadnix hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.enable {#opt-perSystem.pre-commit.settings.hooks.deadnix.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.package {#opt-perSystem.pre-commit.settings.hooks.deadnix.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.after {#opt-perSystem.pre-commit.settings.hooks.deadnix.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.always_run {#opt-perSystem.pre-commit.settings.hooks.deadnix.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.args {#opt-perSystem.pre-commit.settings.hooks.deadnix.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.before {#opt-perSystem.pre-commit.settings.hooks.deadnix.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.description {#opt-perSystem.pre-commit.settings.hooks.deadnix.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.entry {#opt-perSystem.pre-commit.settings.hooks.deadnix.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.deadnix.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.excludes {#opt-perSystem.pre-commit.settings.hooks.deadnix.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.deadnix.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.deadnix.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.files {#opt-perSystem.pre-commit.settings.hooks.deadnix.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.id {#opt-perSystem.pre-commit.settings.hooks.deadnix.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.language {#opt-perSystem.pre-commit.settings.hooks.deadnix.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.name {#opt-perSystem.pre-commit.settings.hooks.deadnix.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.deadnix.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.raw {#opt-perSystem.pre-commit.settings.hooks.deadnix.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.require_serial {#opt-perSystem.pre-commit.settings.hooks.deadnix.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.settings\.edit {#opt-perSystem.pre-commit.settings.hooks.deadnix.settings.edit}



Remove unused code and write to source file\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.settings\.exclude {#opt-perSystem.pre-commit.settings.hooks.deadnix.settings.exclude}



Files to exclude from analysis\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.settings\.hidden {#opt-perSystem.pre-commit.settings.hooks.deadnix.settings.hidden}



Recurse into hidden subdirectories and process hidden \.\*\.nix files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.settings\.noLambdaArg {#opt-perSystem.pre-commit.settings.hooks.deadnix.settings.noLambdaArg}



Don’t check lambda parameter arguments\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.settings\.noLambdaPatternNames {#opt-perSystem.pre-commit.settings.hooks.deadnix.settings.noLambdaPatternNames}



Don’t check lambda pattern names (don’t break nixpkgs ` callPackage `)\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.settings\.noUnderscore {#opt-perSystem.pre-commit.settings.hooks.deadnix.settings.noUnderscore}



Don’t check any bindings that start with a ` _ `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.settings\.quiet {#opt-perSystem.pre-commit.settings.hooks.deadnix.settings.quiet}



Don’t print a dead code report\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.stages {#opt-perSystem.pre-commit.settings.hooks.deadnix.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.types {#opt-perSystem.pre-commit.settings.hooks.deadnix.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.types_or {#opt-perSystem.pre-commit.settings.hooks.deadnix.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.deadnix\.verbose {#opt-perSystem.pre-commit.settings.hooks.deadnix.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt {#opt-perSystem.pre-commit.settings.hooks.denofmt}



denofmt hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.enable {#opt-perSystem.pre-commit.settings.hooks.denofmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.package {#opt-perSystem.pre-commit.settings.hooks.denofmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.after {#opt-perSystem.pre-commit.settings.hooks.denofmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.denofmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.args {#opt-perSystem.pre-commit.settings.hooks.denofmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.before {#opt-perSystem.pre-commit.settings.hooks.denofmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.description {#opt-perSystem.pre-commit.settings.hooks.denofmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.entry {#opt-perSystem.pre-commit.settings.hooks.denofmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.denofmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.denofmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.denofmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.denofmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.files {#opt-perSystem.pre-commit.settings.hooks.denofmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.id {#opt-perSystem.pre-commit.settings.hooks.denofmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.language {#opt-perSystem.pre-commit.settings.hooks.denofmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.name {#opt-perSystem.pre-commit.settings.hooks.denofmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.denofmt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.raw {#opt-perSystem.pre-commit.settings.hooks.denofmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.denofmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.denofmt.settings.configPath}



Path to the configuration JSON file



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.settings\.write {#opt-perSystem.pre-commit.settings.hooks.denofmt.settings.write}



Whether to edit files inplace\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.stages {#opt-perSystem.pre-commit.settings.hooks.denofmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.types {#opt-perSystem.pre-commit.settings.hooks.denofmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.denofmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denofmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.denofmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint {#opt-perSystem.pre-commit.settings.hooks.denolint}



denolint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.enable {#opt-perSystem.pre-commit.settings.hooks.denolint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.package {#opt-perSystem.pre-commit.settings.hooks.denolint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.after {#opt-perSystem.pre-commit.settings.hooks.denolint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.always_run {#opt-perSystem.pre-commit.settings.hooks.denolint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.args {#opt-perSystem.pre-commit.settings.hooks.denolint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.before {#opt-perSystem.pre-commit.settings.hooks.denolint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.description {#opt-perSystem.pre-commit.settings.hooks.denolint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.entry {#opt-perSystem.pre-commit.settings.hooks.denolint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.denolint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.excludes {#opt-perSystem.pre-commit.settings.hooks.denolint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.denolint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.denolint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.files {#opt-perSystem.pre-commit.settings.hooks.denolint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.id {#opt-perSystem.pre-commit.settings.hooks.denolint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.language {#opt-perSystem.pre-commit.settings.hooks.denolint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.name {#opt-perSystem.pre-commit.settings.hooks.denolint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.denolint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.raw {#opt-perSystem.pre-commit.settings.hooks.denolint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.denolint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.denolint.settings.configPath}



Path to the configuration JSON file



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.settings\.format {#opt-perSystem.pre-commit.settings.hooks.denolint.settings.format}



Output format\.



*Type:*
one of “default”, “compact”, “json”



*Default:*
` "default" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.stages {#opt-perSystem.pre-commit.settings.hooks.denolint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.types {#opt-perSystem.pre-commit.settings.hooks.denolint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.types_or {#opt-perSystem.pre-commit.settings.hooks.denolint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.denolint\.verbose {#opt-perSystem.pre-commit.settings.hooks.denolint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt {#opt-perSystem.pre-commit.settings.hooks.dune-fmt}



dune-fmt hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.enable {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.package {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.after {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.args {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.before {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.description {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.entry {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.files {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.id {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.language {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.name {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.pass_filenames}

Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.raw {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.settings\.auto-promote {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.settings.auto-promote}



Whether to auto-promote the changes\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.settings\.extraRuntimeInputs {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.settings.extraRuntimeInputs}



Extra runtimeInputs to add to the environment, eg\. ` ocamlformat `\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.stages {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.types {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.dune-fmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.dune-fmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint {#opt-perSystem.pre-commit.settings.hooks.eclint}



eclint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.enable {#opt-perSystem.pre-commit.settings.hooks.eclint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.package {#opt-perSystem.pre-commit.settings.hooks.eclint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.after {#opt-perSystem.pre-commit.settings.hooks.eclint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.always_run {#opt-perSystem.pre-commit.settings.hooks.eclint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.args {#opt-perSystem.pre-commit.settings.hooks.eclint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.before {#opt-perSystem.pre-commit.settings.hooks.eclint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.description {#opt-perSystem.pre-commit.settings.hooks.eclint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.entry {#opt-perSystem.pre-commit.settings.hooks.eclint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.eclint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.excludes {#opt-perSystem.pre-commit.settings.hooks.eclint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.eclint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.eclint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.files {#opt-perSystem.pre-commit.settings.hooks.eclint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.id {#opt-perSystem.pre-commit.settings.hooks.eclint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.language {#opt-perSystem.pre-commit.settings.hooks.eclint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.name {#opt-perSystem.pre-commit.settings.hooks.eclint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.eclint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.raw {#opt-perSystem.pre-commit.settings.hooks.eclint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.eclint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.settings\.color {#opt-perSystem.pre-commit.settings.hooks.eclint.settings.color}



When to generate colored output\.



*Type:*
one of “auto”, “always”, “never”



*Default:*
` "auto" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.settings\.exclude {#opt-perSystem.pre-commit.settings.hooks.eclint.settings.exclude}



Filter to exclude files\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.settings\.fix {#opt-perSystem.pre-commit.settings.hooks.eclint.settings.fix}



Modify files in place rather than showing the errors\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.settings\.summary {#opt-perSystem.pre-commit.settings.hooks.eclint.settings.summary}



Only show number of errors per file\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.settings\.verbosity {#opt-perSystem.pre-commit.settings.hooks.eclint.settings.verbosity}



Log level verbosity



*Type:*
one of 0, 1, 2, 3, 4



*Default:*
` 0 `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.stages {#opt-perSystem.pre-commit.settings.hooks.eclint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.types {#opt-perSystem.pre-commit.settings.hooks.eclint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.types_or {#opt-perSystem.pre-commit.settings.hooks.eclint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eclint\.verbose {#opt-perSystem.pre-commit.settings.hooks.eclint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint {#opt-perSystem.pre-commit.settings.hooks.eslint}



eslint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.enable {#opt-perSystem.pre-commit.settings.hooks.eslint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.package {#opt-perSystem.pre-commit.settings.hooks.eslint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.after {#opt-perSystem.pre-commit.settings.hooks.eslint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.always_run {#opt-perSystem.pre-commit.settings.hooks.eslint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.args {#opt-perSystem.pre-commit.settings.hooks.eslint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.before {#opt-perSystem.pre-commit.settings.hooks.eslint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.description {#opt-perSystem.pre-commit.settings.hooks.eslint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.entry {#opt-perSystem.pre-commit.settings.hooks.eslint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.eslint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.excludes {#opt-perSystem.pre-commit.settings.hooks.eslint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.eslint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.eslint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.files {#opt-perSystem.pre-commit.settings.hooks.eslint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.id {#opt-perSystem.pre-commit.settings.hooks.eslint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.language {#opt-perSystem.pre-commit.settings.hooks.eslint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.name {#opt-perSystem.pre-commit.settings.hooks.eslint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.eslint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.raw {#opt-perSystem.pre-commit.settings.hooks.eslint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.eslint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.eslint.settings.binPath}



` eslint ` binary path\.
For example, if you want to use the ` eslint ` binary from ` node_modules `, use ` "./node_modules/.bin/eslint" `\.
Use a string instead of a path to avoid having to Git track the file in projects that use Nix flakes\.



*Type:*
null or string or absolute path



*Default:*

```
"${tools.eslint}/bin/eslint"

```



*Example:*

```
"./node_modules/.bin/eslint"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.settings\.extensions {#opt-perSystem.pre-commit.settings.hooks.eslint.settings.extensions}



The pattern of files to run on, see [https://pre-commit\.com/\#hooks-files](https://pre-commit\.com/\#hooks-files)\.



*Type:*
string



*Default:*
` "\\.js$" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.stages {#opt-perSystem.pre-commit.settings.hooks.eslint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.types {#opt-perSystem.pre-commit.settings.hooks.eslint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.types_or {#opt-perSystem.pre-commit.settings.hooks.eslint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.eslint\.verbose {#opt-perSystem.pre-commit.settings.hooks.eslint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8 {#opt-perSystem.pre-commit.settings.hooks.flake8}



flake8 hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.enable {#opt-perSystem.pre-commit.settings.hooks.flake8.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.package {#opt-perSystem.pre-commit.settings.hooks.flake8.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.after {#opt-perSystem.pre-commit.settings.hooks.flake8.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.always_run {#opt-perSystem.pre-commit.settings.hooks.flake8.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.args {#opt-perSystem.pre-commit.settings.hooks.flake8.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.before {#opt-perSystem.pre-commit.settings.hooks.flake8.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.description {#opt-perSystem.pre-commit.settings.hooks.flake8.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.entry {#opt-perSystem.pre-commit.settings.hooks.flake8.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.flake8.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.excludes {#opt-perSystem.pre-commit.settings.hooks.flake8.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.flake8.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.flake8.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.files {#opt-perSystem.pre-commit.settings.hooks.flake8.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.id {#opt-perSystem.pre-commit.settings.hooks.flake8.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.language {#opt-perSystem.pre-commit.settings.hooks.flake8.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.name {#opt-perSystem.pre-commit.settings.hooks.flake8.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.flake8.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.raw {#opt-perSystem.pre-commit.settings.hooks.flake8.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.require_serial {#opt-perSystem.pre-commit.settings.hooks.flake8.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.flake8.settings.binPath}



flake8 binary path\. Should be used to specify flake8 binary from your Python environment\.



*Type:*
null or string



*Default:*

```
"${tools.flake8}/bin/flake8"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.settings\.extendIgnore {#opt-perSystem.pre-commit.settings.hooks.flake8.settings.extendIgnore}



List of additional ignore codes



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "E501"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.settings\.format {#opt-perSystem.pre-commit.settings.hooks.flake8.settings.format}



Output format\.



*Type:*
string



*Default:*
` "default" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.stages {#opt-perSystem.pre-commit.settings.hooks.flake8.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.types {#opt-perSystem.pre-commit.settings.hooks.flake8.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.types_or {#opt-perSystem.pre-commit.settings.hooks.flake8.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flake8\.verbose {#opt-perSystem.pre-commit.settings.hooks.flake8.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt {#opt-perSystem.pre-commit.settings.hooks.flynt}



flynt hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.enable {#opt-perSystem.pre-commit.settings.hooks.flynt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.package {#opt-perSystem.pre-commit.settings.hooks.flynt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.after {#opt-perSystem.pre-commit.settings.hooks.flynt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.always_run {#opt-perSystem.pre-commit.settings.hooks.flynt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.args {#opt-perSystem.pre-commit.settings.hooks.flynt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.before {#opt-perSystem.pre-commit.settings.hooks.flynt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.description {#opt-perSystem.pre-commit.settings.hooks.flynt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.entry {#opt-perSystem.pre-commit.settings.hooks.flynt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.flynt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.excludes {#opt-perSystem.pre-commit.settings.hooks.flynt.excludes}

Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.flynt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.flynt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.files {#opt-perSystem.pre-commit.settings.hooks.flynt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.id {#opt-perSystem.pre-commit.settings.hooks.flynt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.language {#opt-perSystem.pre-commit.settings.hooks.flynt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.name {#opt-perSystem.pre-commit.settings.hooks.flynt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.flynt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.raw {#opt-perSystem.pre-commit.settings.hooks.flynt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.flynt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.aggressive {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.aggressive}



Include conversions with potentially changed behavior\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.binPath}



flynt binary path\. Can be used to specify the flynt binary from an existing Python environment\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.dry-run {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.dry-run}



Do not change files in-place and print diff instead\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.exclude {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.exclude}



Ignore files with given strings in their absolute path\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.fail-on-change {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.fail-on-change}



Fail when diff is not empty (for linting purposes)\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.line-length {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.line-length}



Convert expressions spanning multiple lines, only if the resulting single line will fit into this line length limit\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.no-multiline {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.no-multiline}



Convert only single line expressions\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.quiet {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.quiet}



Run without output\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.string {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.string}



Interpret the input as a Python code snippet and print the converted version\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.transform-concats {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.transform-concats}



Replace string concatenations with f-strings\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.settings\.verbose {#opt-perSystem.pre-commit.settings.hooks.flynt.settings.verbose}



Run with verbose output\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.stages {#opt-perSystem.pre-commit.settings.hooks.flynt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.types {#opt-perSystem.pre-commit.settings.hooks.flynt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.types_or {#opt-perSystem.pre-commit.settings.hooks.flynt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.flynt\.verbose {#opt-perSystem.pre-commit.settings.hooks.flynt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu {#opt-perSystem.pre-commit.settings.hooks.fourmolu}



fourmolu hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.enable {#opt-perSystem.pre-commit.settings.hooks.fourmolu.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.package {#opt-perSystem.pre-commit.settings.hooks.fourmolu.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.after {#opt-perSystem.pre-commit.settings.hooks.fourmolu.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.always_run {#opt-perSystem.pre-commit.settings.hooks.fourmolu.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.args {#opt-perSystem.pre-commit.settings.hooks.fourmolu.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.before {#opt-perSystem.pre-commit.settings.hooks.fourmolu.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.description {#opt-perSystem.pre-commit.settings.hooks.fourmolu.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.entry {#opt-perSystem.pre-commit.settings.hooks.fourmolu.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.fourmolu.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.excludes {#opt-perSystem.pre-commit.settings.hooks.fourmolu.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.fourmolu.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.fourmolu.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.files {#opt-perSystem.pre-commit.settings.hooks.fourmolu.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.id {#opt-perSystem.pre-commit.settings.hooks.fourmolu.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.language {#opt-perSystem.pre-commit.settings.hooks.fourmolu.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.name {#opt-perSystem.pre-commit.settings.hooks.fourmolu.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.fourmolu.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.raw {#opt-perSystem.pre-commit.settings.hooks.fourmolu.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.require_serial {#opt-perSystem.pre-commit.settings.hooks.fourmolu.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.settings\.defaultExtensions {#opt-perSystem.pre-commit.settings.hooks.fourmolu.settings.defaultExtensions}



Haskell language extensions to enable\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.stages {#opt-perSystem.pre-commit.settings.hooks.fourmolu.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.types {#opt-perSystem.pre-commit.settings.hooks.fourmolu.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.types_or {#opt-perSystem.pre-commit.settings.hooks.fourmolu.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.fourmolu\.verbose {#opt-perSystem.pre-commit.settings.hooks.fourmolu.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines {#opt-perSystem.pre-commit.settings.hooks.golines}



golines hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.enable {#opt-perSystem.pre-commit.settings.hooks.golines.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.package {#opt-perSystem.pre-commit.settings.hooks.golines.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.after {#opt-perSystem.pre-commit.settings.hooks.golines.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.always_run {#opt-perSystem.pre-commit.settings.hooks.golines.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.args {#opt-perSystem.pre-commit.settings.hooks.golines.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.before {#opt-perSystem.pre-commit.settings.hooks.golines.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.description {#opt-perSystem.pre-commit.settings.hooks.golines.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.entry {#opt-perSystem.pre-commit.settings.hooks.golines.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.golines.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.excludes {#opt-perSystem.pre-commit.settings.hooks.golines.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.golines.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.golines.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.files {#opt-perSystem.pre-commit.settings.hooks.golines.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.id {#opt-perSystem.pre-commit.settings.hooks.golines.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.language {#opt-perSystem.pre-commit.settings.hooks.golines.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.name {#opt-perSystem.pre-commit.settings.hooks.golines.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.golines.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.raw {#opt-perSystem.pre-commit.settings.hooks.golines.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.require_serial {#opt-perSystem.pre-commit.settings.hooks.golines.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.golines.settings.flags}



Flags passed to golines\. See all available [here](https://github\.com/segmentio/golines?tab=readme-ov-file\#options)



*Type:*
string



*Default:*
` "" `



*Example:*
` "-m 120" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.stages {#opt-perSystem.pre-commit.settings.hooks.golines.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.types {#opt-perSystem.pre-commit.settings.hooks.golines.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.types_or {#opt-perSystem.pre-commit.settings.hooks.golines.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.golines\.verbose {#opt-perSystem.pre-commit.settings.hooks.golines.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest {#opt-perSystem.pre-commit.settings.hooks.gotest}



gotest hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.enable {#opt-perSystem.pre-commit.settings.hooks.gotest.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.package {#opt-perSystem.pre-commit.settings.hooks.gotest.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.after {#opt-perSystem.pre-commit.settings.hooks.gotest.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.always_run {#opt-perSystem.pre-commit.settings.hooks.gotest.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.args {#opt-perSystem.pre-commit.settings.hooks.gotest.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.before {#opt-perSystem.pre-commit.settings.hooks.gotest.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.description {#opt-perSystem.pre-commit.settings.hooks.gotest.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.entry {#opt-perSystem.pre-commit.settings.hooks.gotest.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.gotest.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.excludes {#opt-perSystem.pre-commit.settings.hooks.gotest.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.gotest.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.gotest.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.files {#opt-perSystem.pre-commit.settings.hooks.gotest.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.id {#opt-perSystem.pre-commit.settings.hooks.gotest.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.language {#opt-perSystem.pre-commit.settings.hooks.gotest.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.name {#opt-perSystem.pre-commit.settings.hooks.gotest.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.gotest.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.raw {#opt-perSystem.pre-commit.settings.hooks.gotest.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.require_serial {#opt-perSystem.pre-commit.settings.hooks.gotest.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.gotest.settings.flags}



Flags passed to gotest\. See all available [here](https://pkg\.go\.dev/cmd/go\#hdr-Test_packages)\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "-tags integration" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.stages {#opt-perSystem.pre-commit.settings.hooks.gotest.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.types {#opt-perSystem.pre-commit.settings.hooks.gotest.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.types_or {#opt-perSystem.pre-commit.settings.hooks.gotest.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.gotest\.verbose {#opt-perSystem.pre-commit.settings.hooks.gotest.verbose}

forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache {#opt-perSystem.pre-commit.settings.hooks.headache}



headache hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.enable {#opt-perSystem.pre-commit.settings.hooks.headache.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.package {#opt-perSystem.pre-commit.settings.hooks.headache.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.after {#opt-perSystem.pre-commit.settings.hooks.headache.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.always_run {#opt-perSystem.pre-commit.settings.hooks.headache.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.args {#opt-perSystem.pre-commit.settings.hooks.headache.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.before {#opt-perSystem.pre-commit.settings.hooks.headache.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.description {#opt-perSystem.pre-commit.settings.hooks.headache.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.entry {#opt-perSystem.pre-commit.settings.hooks.headache.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.headache.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.excludes {#opt-perSystem.pre-commit.settings.hooks.headache.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.headache.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.headache.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.files {#opt-perSystem.pre-commit.settings.hooks.headache.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.id {#opt-perSystem.pre-commit.settings.hooks.headache.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.language {#opt-perSystem.pre-commit.settings.hooks.headache.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.name {#opt-perSystem.pre-commit.settings.hooks.headache.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.headache.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.raw {#opt-perSystem.pre-commit.settings.hooks.headache.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.require_serial {#opt-perSystem.pre-commit.settings.hooks.headache.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.settings\.header-file {#opt-perSystem.pre-commit.settings.hooks.headache.settings.header-file}



Path to the header file\.



*Type:*
string



*Default:*
` ".header" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.stages {#opt-perSystem.pre-commit.settings.hooks.headache.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.types {#opt-perSystem.pre-commit.settings.hooks.headache.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.types_or {#opt-perSystem.pre-commit.settings.hooks.headache.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.headache\.verbose {#opt-perSystem.pre-commit.settings.hooks.headache.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt}



hledger-fmt hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.enable {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.package {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.after {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.args {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.before {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.description {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.entry {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.files {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.id {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.language {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.name {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.raw {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.settings\.fix {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.settings.fix}



Fix the files in place\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.stages {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.types {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hledger-fmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.hledger-fmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint {#opt-perSystem.pre-commit.settings.hooks.hlint}



hlint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.enable {#opt-perSystem.pre-commit.settings.hooks.hlint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.package {#opt-perSystem.pre-commit.settings.hooks.hlint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.after {#opt-perSystem.pre-commit.settings.hooks.hlint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.always_run {#opt-perSystem.pre-commit.settings.hooks.hlint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.args {#opt-perSystem.pre-commit.settings.hooks.hlint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.before {#opt-perSystem.pre-commit.settings.hooks.hlint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.description {#opt-perSystem.pre-commit.settings.hooks.hlint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.entry {#opt-perSystem.pre-commit.settings.hooks.hlint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.hlint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.excludes {#opt-perSystem.pre-commit.settings.hooks.hlint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.hlint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.hlint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.files {#opt-perSystem.pre-commit.settings.hooks.hlint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.id {#opt-perSystem.pre-commit.settings.hooks.hlint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.language {#opt-perSystem.pre-commit.settings.hooks.hlint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.name {#opt-perSystem.pre-commit.settings.hooks.hlint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.hlint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.raw {#opt-perSystem.pre-commit.settings.hooks.hlint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.hlint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.settings\.hintFile {#opt-perSystem.pre-commit.settings.hooks.hlint.settings.hintFile}



Path to hlint\.yaml\. By default, hlint searches for \.hlint\.yaml in the project root\.



*Type:*
null or string or absolute path



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.stages {#opt-perSystem.pre-commit.settings.hooks.hlint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.types {#opt-perSystem.pre-commit.settings.hooks.hlint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.types_or {#opt-perSystem.pre-commit.settings.hooks.hlint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hlint\.verbose {#opt-perSystem.pre-commit.settings.hooks.hlint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack {#opt-perSystem.pre-commit.settings.hooks.hpack}



hpack hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.enable {#opt-perSystem.pre-commit.settings.hooks.hpack.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.package {#opt-perSystem.pre-commit.settings.hooks.hpack.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.after {#opt-perSystem.pre-commit.settings.hooks.hpack.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.always_run {#opt-perSystem.pre-commit.settings.hooks.hpack.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.args {#opt-perSystem.pre-commit.settings.hooks.hpack.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.before {#opt-perSystem.pre-commit.settings.hooks.hpack.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.description {#opt-perSystem.pre-commit.settings.hooks.hpack.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.entry {#opt-perSystem.pre-commit.settings.hooks.hpack.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.hpack.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.excludes {#opt-perSystem.pre-commit.settings.hooks.hpack.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.hpack.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.hpack.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.files {#opt-perSystem.pre-commit.settings.hooks.hpack.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.id {#opt-perSystem.pre-commit.settings.hooks.hpack.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.language {#opt-perSystem.pre-commit.settings.hooks.hpack.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.name {#opt-perSystem.pre-commit.settings.hooks.hpack.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.hpack.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.raw {#opt-perSystem.pre-commit.settings.hooks.hpack.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.require_serial {#opt-perSystem.pre-commit.settings.hooks.hpack.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.settings\.silent {#opt-perSystem.pre-commit.settings.hooks.hpack.settings.silent}



Whether generation should be silent\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.stages {#opt-perSystem.pre-commit.settings.hooks.hpack.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.types {#opt-perSystem.pre-commit.settings.hooks.hpack.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.types_or {#opt-perSystem.pre-commit.settings.hooks.hpack.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.hpack\.verbose {#opt-perSystem.pre-commit.settings.hooks.hpack.verbose}

forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort {#opt-perSystem.pre-commit.settings.hooks.isort}



isort hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.enable {#opt-perSystem.pre-commit.settings.hooks.isort.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.package {#opt-perSystem.pre-commit.settings.hooks.isort.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.after {#opt-perSystem.pre-commit.settings.hooks.isort.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.always_run {#opt-perSystem.pre-commit.settings.hooks.isort.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.args {#opt-perSystem.pre-commit.settings.hooks.isort.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.before {#opt-perSystem.pre-commit.settings.hooks.isort.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.description {#opt-perSystem.pre-commit.settings.hooks.isort.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.entry {#opt-perSystem.pre-commit.settings.hooks.isort.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.isort.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.excludes {#opt-perSystem.pre-commit.settings.hooks.isort.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.isort.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.isort.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.files {#opt-perSystem.pre-commit.settings.hooks.isort.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.id {#opt-perSystem.pre-commit.settings.hooks.isort.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.language {#opt-perSystem.pre-commit.settings.hooks.isort.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.name {#opt-perSystem.pre-commit.settings.hooks.isort.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.isort.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.raw {#opt-perSystem.pre-commit.settings.hooks.isort.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.require_serial {#opt-perSystem.pre-commit.settings.hooks.isort.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.isort.settings.flags}



Flags passed to isort\. See all available [here](https://pycqa\.github\.io/isort/docs/configuration/options\.html)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.settings\.profile {#opt-perSystem.pre-commit.settings.hooks.isort.settings.profile}



Built-in profiles to allow easy interoperability with common projects and code styles\.



*Type:*
one of “”, “black”, “django”, “pycharm”, “google”, “open_stack”, “plone”, “attrs”, “hug”, “wemake”, “appnexus”



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.stages {#opt-perSystem.pre-commit.settings.hooks.isort.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.types {#opt-perSystem.pre-commit.settings.hooks.isort.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.types_or {#opt-perSystem.pre-commit.settings.hooks.isort.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.isort\.verbose {#opt-perSystem.pre-commit.settings.hooks.isort.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck {#opt-perSystem.pre-commit.settings.hooks.lacheck}



lacheck hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.enable {#opt-perSystem.pre-commit.settings.hooks.lacheck.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.package {#opt-perSystem.pre-commit.settings.hooks.lacheck.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.after {#opt-perSystem.pre-commit.settings.hooks.lacheck.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.always_run {#opt-perSystem.pre-commit.settings.hooks.lacheck.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.args {#opt-perSystem.pre-commit.settings.hooks.lacheck.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.before {#opt-perSystem.pre-commit.settings.hooks.lacheck.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.description {#opt-perSystem.pre-commit.settings.hooks.lacheck.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.entry {#opt-perSystem.pre-commit.settings.hooks.lacheck.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.lacheck.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.excludes {#opt-perSystem.pre-commit.settings.hooks.lacheck.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.lacheck.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.lacheck.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.files {#opt-perSystem.pre-commit.settings.hooks.lacheck.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.id {#opt-perSystem.pre-commit.settings.hooks.lacheck.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.language {#opt-perSystem.pre-commit.settings.hooks.lacheck.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.name {#opt-perSystem.pre-commit.settings.hooks.lacheck.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.lacheck.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.raw {#opt-perSystem.pre-commit.settings.hooks.lacheck.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.require_serial {#opt-perSystem.pre-commit.settings.hooks.lacheck.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.stages {#opt-perSystem.pre-commit.settings.hooks.lacheck.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.types {#opt-perSystem.pre-commit.settings.hooks.lacheck.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.types_or {#opt-perSystem.pre-commit.settings.hooks.lacheck.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lacheck\.verbose {#opt-perSystem.pre-commit.settings.hooks.lacheck.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent {#opt-perSystem.pre-commit.settings.hooks.latexindent}



latexindent hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.enable {#opt-perSystem.pre-commit.settings.hooks.latexindent.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.package {#opt-perSystem.pre-commit.settings.hooks.latexindent.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.after {#opt-perSystem.pre-commit.settings.hooks.latexindent.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.always_run {#opt-perSystem.pre-commit.settings.hooks.latexindent.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.args {#opt-perSystem.pre-commit.settings.hooks.latexindent.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.before {#opt-perSystem.pre-commit.settings.hooks.latexindent.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.description {#opt-perSystem.pre-commit.settings.hooks.latexindent.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.entry {#opt-perSystem.pre-commit.settings.hooks.latexindent.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.latexindent.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.excludes {#opt-perSystem.pre-commit.settings.hooks.latexindent.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.latexindent.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.latexindent.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.files {#opt-perSystem.pre-commit.settings.hooks.latexindent.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.id {#opt-perSystem.pre-commit.settings.hooks.latexindent.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.language {#opt-perSystem.pre-commit.settings.hooks.latexindent.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.name {#opt-perSystem.pre-commit.settings.hooks.latexindent.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.latexindent.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.raw {#opt-perSystem.pre-commit.settings.hooks.latexindent.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.require_serial {#opt-perSystem.pre-commit.settings.hooks.latexindent.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.latexindent.settings.flags}



Flags passed to latexindent\. See available flags [here](https://latexindentpl\.readthedocs\.io/en/latest/sec-how-to-use\.html\#from-the-command-line)



*Type:*
string



*Default:*
` "--local --silent --overwriteIfDifferent" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.stages {#opt-perSystem.pre-commit.settings.hooks.latexindent.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.types {#opt-perSystem.pre-commit.settings.hooks.latexindent.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.types_or {#opt-perSystem.pre-commit.settings.hooks.latexindent.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.latexindent\.verbose {#opt-perSystem.pre-commit.settings.hooks.latexindent.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls {#opt-perSystem.pre-commit.settings.hooks.lua-ls}



lua-ls hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.enable {#opt-perSystem.pre-commit.settings.hooks.lua-ls.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.package {#opt-perSystem.pre-commit.settings.hooks.lua-ls.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.after {#opt-perSystem.pre-commit.settings.hooks.lua-ls.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.always_run {#opt-perSystem.pre-commit.settings.hooks.lua-ls.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.args {#opt-perSystem.pre-commit.settings.hooks.lua-ls.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.before {#opt-perSystem.pre-commit.settings.hooks.lua-ls.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.description {#opt-perSystem.pre-commit.settings.hooks.lua-ls.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.entry {#opt-perSystem.pre-commit.settings.hooks.lua-ls.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.lua-ls.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.excludes {#opt-perSystem.pre-commit.settings.hooks.lua-ls.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.lua-ls.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.lua-ls.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.files {#opt-perSystem.pre-commit.settings.hooks.lua-ls.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.id {#opt-perSystem.pre-commit.settings.hooks.lua-ls.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.language {#opt-perSystem.pre-commit.settings.hooks.lua-ls.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.name {#opt-perSystem.pre-commit.settings.hooks.lua-ls.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.lua-ls.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.raw {#opt-perSystem.pre-commit.settings.hooks.lua-ls.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.require_serial {#opt-perSystem.pre-commit.settings.hooks.lua-ls.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.settings\.checklevel {#opt-perSystem.pre-commit.settings.hooks.lua-ls.settings.checklevel}



The diagnostic check level



*Type:*
one of “Error”, “Warning”, “Information”, “Hint”



*Default:*
` "Warning" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.settings\.configuration {#opt-perSystem.pre-commit.settings.hooks.lua-ls.settings.configuration}



See https://github\.com/LuaLS/lua-language-server/wiki/Configuration-File\#luarcjson



*Type:*
attribute set



*Default:*
` { } `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.stages {#opt-perSystem.pre-commit.settings.hooks.lua-ls.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.types {#opt-perSystem.pre-commit.settings.hooks.lua-ls.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.types_or {#opt-perSystem.pre-commit.settings.hooks.lua-ls.types_or}

List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lua-ls\.verbose {#opt-perSystem.pre-commit.settings.hooks.lua-ls.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee {#opt-perSystem.pre-commit.settings.hooks.lychee}



lychee hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.enable {#opt-perSystem.pre-commit.settings.hooks.lychee.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.package {#opt-perSystem.pre-commit.settings.hooks.lychee.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.after {#opt-perSystem.pre-commit.settings.hooks.lychee.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.always_run {#opt-perSystem.pre-commit.settings.hooks.lychee.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.args {#opt-perSystem.pre-commit.settings.hooks.lychee.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.before {#opt-perSystem.pre-commit.settings.hooks.lychee.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.description {#opt-perSystem.pre-commit.settings.hooks.lychee.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.entry {#opt-perSystem.pre-commit.settings.hooks.lychee.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.lychee.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.excludes {#opt-perSystem.pre-commit.settings.hooks.lychee.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.lychee.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.lychee.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.files {#opt-perSystem.pre-commit.settings.hooks.lychee.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.id {#opt-perSystem.pre-commit.settings.hooks.lychee.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.language {#opt-perSystem.pre-commit.settings.hooks.lychee.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.name {#opt-perSystem.pre-commit.settings.hooks.lychee.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.lychee.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.raw {#opt-perSystem.pre-commit.settings.hooks.lychee.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.require_serial {#opt-perSystem.pre-commit.settings.hooks.lychee.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.lychee.settings.configPath}



Path to the config file\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.lychee.settings.flags}



Flags passed to lychee\. See all available [here](https://lychee\.cli\.rs/\#/usage/cli)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.stages {#opt-perSystem.pre-commit.settings.hooks.lychee.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.types {#opt-perSystem.pre-commit.settings.hooks.lychee.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.types_or {#opt-perSystem.pre-commit.settings.hooks.lychee.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.lychee\.verbose {#opt-perSystem.pre-commit.settings.hooks.lychee.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint {#opt-perSystem.pre-commit.settings.hooks.markdownlint}



markdownlint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.enable {#opt-perSystem.pre-commit.settings.hooks.markdownlint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.package {#opt-perSystem.pre-commit.settings.hooks.markdownlint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.after {#opt-perSystem.pre-commit.settings.hooks.markdownlint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.always_run {#opt-perSystem.pre-commit.settings.hooks.markdownlint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.args {#opt-perSystem.pre-commit.settings.hooks.markdownlint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.before {#opt-perSystem.pre-commit.settings.hooks.markdownlint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.description {#opt-perSystem.pre-commit.settings.hooks.markdownlint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.entry {#opt-perSystem.pre-commit.settings.hooks.markdownlint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.markdownlint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.excludes {#opt-perSystem.pre-commit.settings.hooks.markdownlint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.markdownlint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.markdownlint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.files {#opt-perSystem.pre-commit.settings.hooks.markdownlint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.id {#opt-perSystem.pre-commit.settings.hooks.markdownlint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.language {#opt-perSystem.pre-commit.settings.hooks.markdownlint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.name {#opt-perSystem.pre-commit.settings.hooks.markdownlint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.markdownlint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.raw {#opt-perSystem.pre-commit.settings.hooks.markdownlint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.markdownlint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.settings\.configuration {#opt-perSystem.pre-commit.settings.hooks.markdownlint.settings.configuration}



See https://github\.com/DavidAnson/markdownlint/blob/main/schema/\.markdownlint\.jsonc



*Type:*
attribute set



*Default:*
` { } `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.stages {#opt-perSystem.pre-commit.settings.hooks.markdownlint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.types {#opt-perSystem.pre-commit.settings.hooks.markdownlint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.types_or {#opt-perSystem.pre-commit.settings.hooks.markdownlint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.markdownlint\.verbose {#opt-perSystem.pre-commit.settings.hooks.markdownlint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl {#opt-perSystem.pre-commit.settings.hooks.mdl}



mdl hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.enable {#opt-perSystem.pre-commit.settings.hooks.mdl.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.package {#opt-perSystem.pre-commit.settings.hooks.mdl.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.after {#opt-perSystem.pre-commit.settings.hooks.mdl.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.always_run {#opt-perSystem.pre-commit.settings.hooks.mdl.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.args {#opt-perSystem.pre-commit.settings.hooks.mdl.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.before {#opt-perSystem.pre-commit.settings.hooks.mdl.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.description {#opt-perSystem.pre-commit.settings.hooks.mdl.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.entry {#opt-perSystem.pre-commit.settings.hooks.mdl.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.mdl.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.excludes {#opt-perSystem.pre-commit.settings.hooks.mdl.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.mdl.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.mdl.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.files {#opt-perSystem.pre-commit.settings.hooks.mdl.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.id {#opt-perSystem.pre-commit.settings.hooks.mdl.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.language {#opt-perSystem.pre-commit.settings.hooks.mdl.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.name {#opt-perSystem.pre-commit.settings.hooks.mdl.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.mdl.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.raw {#opt-perSystem.pre-commit.settings.hooks.mdl.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.require_serial {#opt-perSystem.pre-commit.settings.hooks.mdl.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.configPath}



The configuration file to use\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.git-recurse {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.git-recurse}



Only process files known to git when given a directory\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.ignore-front-matter {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.ignore-front-matter}



Ignore YAML front matter\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.json {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.json}



Format output as JSON\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.rules {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.rules}



Markdown rules to use for linting\. Per default all rules are processed\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.rulesets {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.rulesets}



Specify additional ruleset files to load\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.show-aliases {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.show-aliases}



Show rule alias instead of rule ID when viewing rules\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.skip-default-ruleset {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.skip-default-ruleset}



Do not load the default markdownlint ruleset\. Use this option if you only want to load custom rulesets\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.style {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.style}



Select which style mdl uses\.



*Type:*
string



*Default:*
` "default" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.tags {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.tags}



Markdown rules to use for linting containing the given tags\. Per default all rules are processed\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.verbose {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.verbose}



Increase verbosity\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.settings\.warnings {#opt-perSystem.pre-commit.settings.hooks.mdl.settings.warnings}



Show Kramdown warnings\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.stages {#opt-perSystem.pre-commit.settings.hooks.mdl.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.types {#opt-perSystem.pre-commit.settings.hooks.mdl.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.types_or {#opt-perSystem.pre-commit.settings.hooks.mdl.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mdl\.verbose {#opt-perSystem.pre-commit.settings.hooks.mdl.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck}



mkdocs-linkcheck hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.enable {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.package {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.after {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.always_run {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.args {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.before {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.description {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.entry {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.excludes {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.fail_fast}

if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.files {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.id {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.language {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.name {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.raw {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.require_serial {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.settings.binPath}



mkdocs-linkcheck binary path\. Should be used to specify the mkdocs-linkcheck binary from your Python environment\.



*Type:*
null or string or absolute path



*Default:*

```
"${tools.mkdocs-linkcheck}/bin/mkdocs-linkcheck"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.settings\.extension {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.settings.extension}



File extension to scan for\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.settings\.local-only {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.settings.local-only}



Whether to only check local links\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.settings\.method {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.settings.method}



HTTP method to use when checking external links\.



*Type:*
one of “get”, “head”



*Default:*
` "get" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.settings\.path {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.settings.path}



Path to check



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.settings\.recurse {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.settings.recurse}



Whether to recurse directories under path\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.stages {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.types {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.types_or {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mkdocs-linkcheck\.verbose {#opt-perSystem.pre-commit.settings.hooks.mkdocs-linkcheck.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy {#opt-perSystem.pre-commit.settings.hooks.mypy}



mypy hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.enable {#opt-perSystem.pre-commit.settings.hooks.mypy.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.package {#opt-perSystem.pre-commit.settings.hooks.mypy.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.after {#opt-perSystem.pre-commit.settings.hooks.mypy.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.always_run {#opt-perSystem.pre-commit.settings.hooks.mypy.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.args {#opt-perSystem.pre-commit.settings.hooks.mypy.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.before {#opt-perSystem.pre-commit.settings.hooks.mypy.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.description {#opt-perSystem.pre-commit.settings.hooks.mypy.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.entry {#opt-perSystem.pre-commit.settings.hooks.mypy.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.mypy.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.excludes {#opt-perSystem.pre-commit.settings.hooks.mypy.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.mypy.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.mypy.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.files {#opt-perSystem.pre-commit.settings.hooks.mypy.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.id {#opt-perSystem.pre-commit.settings.hooks.mypy.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.language {#opt-perSystem.pre-commit.settings.hooks.mypy.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.name {#opt-perSystem.pre-commit.settings.hooks.mypy.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.mypy.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.raw {#opt-perSystem.pre-commit.settings.hooks.mypy.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.require_serial {#opt-perSystem.pre-commit.settings.hooks.mypy.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.mypy.settings.binPath}



Mypy binary path\. Should be used to specify the mypy executable in an environment containing your typing stubs\.



*Type:*
null or string



*Default:*

```
"${tools.mypy}/bin/mypy"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.stages {#opt-perSystem.pre-commit.settings.hooks.mypy.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.types {#opt-perSystem.pre-commit.settings.hooks.mypy.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.types_or {#opt-perSystem.pre-commit.settings.hooks.mypy.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.mypy\.verbose {#opt-perSystem.pre-commit.settings.hooks.mypy.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout {#opt-perSystem.pre-commit.settings.hooks.nbstripout}



nbstripout hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.enable {#opt-perSystem.pre-commit.settings.hooks.nbstripout.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.package {#opt-perSystem.pre-commit.settings.hooks.nbstripout.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.after {#opt-perSystem.pre-commit.settings.hooks.nbstripout.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.always_run {#opt-perSystem.pre-commit.settings.hooks.nbstripout.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.args {#opt-perSystem.pre-commit.settings.hooks.nbstripout.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.before {#opt-perSystem.pre-commit.settings.hooks.nbstripout.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.description {#opt-perSystem.pre-commit.settings.hooks.nbstripout.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.entry {#opt-perSystem.pre-commit.settings.hooks.nbstripout.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.nbstripout.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.excludes {#opt-perSystem.pre-commit.settings.hooks.nbstripout.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.nbstripout.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.nbstripout.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.files {#opt-perSystem.pre-commit.settings.hooks.nbstripout.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.id {#opt-perSystem.pre-commit.settings.hooks.nbstripout.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.language {#opt-perSystem.pre-commit.settings.hooks.nbstripout.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.name {#opt-perSystem.pre-commit.settings.hooks.nbstripout.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.nbstripout.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.raw {#opt-perSystem.pre-commit.settings.hooks.nbstripout.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.require_serial {#opt-perSystem.pre-commit.settings.hooks.nbstripout.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.stages {#opt-perSystem.pre-commit.settings.hooks.nbstripout.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.types {#opt-perSystem.pre-commit.settings.hooks.nbstripout.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.types_or {#opt-perSystem.pre-commit.settings.hooks.nbstripout.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nbstripout\.verbose {#opt-perSystem.pre-commit.settings.hooks.nbstripout.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt {#opt-perSystem.pre-commit.settings.hooks.nixfmt}



nixfmt hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.enable {#opt-perSystem.pre-commit.settings.hooks.nixfmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.package {#opt-perSystem.pre-commit.settings.hooks.nixfmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.after {#opt-perSystem.pre-commit.settings.hooks.nixfmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.nixfmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.args {#opt-perSystem.pre-commit.settings.hooks.nixfmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.before {#opt-perSystem.pre-commit.settings.hooks.nixfmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.description {#opt-perSystem.pre-commit.settings.hooks.nixfmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.entry {#opt-perSystem.pre-commit.settings.hooks.nixfmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.nixfmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.nixfmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.nixfmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.nixfmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.files {#opt-perSystem.pre-commit.settings.hooks.nixfmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.id {#opt-perSystem.pre-commit.settings.hooks.nixfmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.language {#opt-perSystem.pre-commit.settings.hooks.nixfmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.name {#opt-perSystem.pre-commit.settings.hooks.nixfmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.nixfmt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.raw {#opt-perSystem.pre-commit.settings.hooks.nixfmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.nixfmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.settings\.indent {#opt-perSystem.pre-commit.settings.hooks.nixfmt.settings.indent}



Number of spaces to use for indentation\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.settings\.width {#opt-perSystem.pre-commit.settings.hooks.nixfmt.settings.width}



Maximum width in characters\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.stages {#opt-perSystem.pre-commit.settings.hooks.nixfmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.types {#opt-perSystem.pre-commit.settings.hooks.nixfmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.nixfmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.nixfmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic}



nixfmt (classic) hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.enable {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.package {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.after {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.always_run {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.args {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.before {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.description {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.entry {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.excludes {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.files {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.id {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.language {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.name {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.raw {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.require_serial {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.settings\.width {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.settings.width}



Line width\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.stages {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.types {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.types_or {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-classic\.verbose {#opt-perSystem.pre-commit.settings.hooks.nixfmt-classic.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style}



nixfmt (RFC 166 style) hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.enable {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.enable}

Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.package {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.after {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.always_run {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.args {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.before {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.description {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.entry {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.excludes {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.files {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.id {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.language {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.name {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.raw {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.require_serial {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.settings\.indent {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.settings.indent}



Number of spaces to use for indentation\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.settings\.width {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.settings.width}



Maximum width in characters\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.stages {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.types {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.types_or {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.nixfmt-rfc-style\.verbose {#opt-perSystem.pre-commit.settings.hooks.nixfmt-rfc-style.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch}



no-commit-to-branch-hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.enable {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.package {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.after {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.always_run {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.args {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.before {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.description {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.entry {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.excludes {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.files {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.id {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.language {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.name {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.raw {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.require_serial {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.settings\.branch {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.settings.branch}



Branches to disallow commits to\.



*Type:*
list of string



*Default:*

```
[
  "main"
]
```



*Example:*

```
[
  "main"
  "master"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.settings\.pattern {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.settings.pattern}



RegEx patterns for branch names to disallow commits to\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "ma.*"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.stages {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.types {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.types_or {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.no-commit-to-branch\.verbose {#opt-perSystem.pre-commit.settings.hooks.no-commit-to-branch.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu {#opt-perSystem.pre-commit.settings.hooks.ormolu}



ormolu hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.enable {#opt-perSystem.pre-commit.settings.hooks.ormolu.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.package {#opt-perSystem.pre-commit.settings.hooks.ormolu.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.after {#opt-perSystem.pre-commit.settings.hooks.ormolu.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.always_run {#opt-perSystem.pre-commit.settings.hooks.ormolu.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.args {#opt-perSystem.pre-commit.settings.hooks.ormolu.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.before {#opt-perSystem.pre-commit.settings.hooks.ormolu.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.description {#opt-perSystem.pre-commit.settings.hooks.ormolu.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.entry {#opt-perSystem.pre-commit.settings.hooks.ormolu.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.ormolu.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.excludes {#opt-perSystem.pre-commit.settings.hooks.ormolu.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.ormolu.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.ormolu.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.files {#opt-perSystem.pre-commit.settings.hooks.ormolu.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.id {#opt-perSystem.pre-commit.settings.hooks.ormolu.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.language {#opt-perSystem.pre-commit.settings.hooks.ormolu.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.name {#opt-perSystem.pre-commit.settings.hooks.ormolu.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.ormolu.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.raw {#opt-perSystem.pre-commit.settings.hooks.ormolu.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.require_serial {#opt-perSystem.pre-commit.settings.hooks.ormolu.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.settings\.cabalDefaultExtensions {#opt-perSystem.pre-commit.settings.hooks.ormolu.settings.cabalDefaultExtensions}



Use ` default-extensions ` from ` .cabal ` files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.settings\.defaultExtensions {#opt-perSystem.pre-commit.settings.hooks.ormolu.settings.defaultExtensions}



Haskell language extensions to enable\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.stages {#opt-perSystem.pre-commit.settings.hooks.ormolu.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.types {#opt-perSystem.pre-commit.settings.hooks.ormolu.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.types_or {#opt-perSystem.pre-commit.settings.hooks.ormolu.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ormolu\.verbose {#opt-perSystem.pre-commit.settings.hooks.ormolu.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer}



php-cs-fixer hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.enable {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.package {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.after {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.always_run {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.args {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.args}

List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.before {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.description {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.entry {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.excludes {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.files {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.id {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.language {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.name {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.raw {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.require_serial {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.settings.binPath}



PHP-CS-Fixer binary path\.



*Type:*
null or string



*Default:*

```
"${tools.php-cs-fixer}/bin/php-cs-fixer"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.stages {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.types {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.types_or {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.php-cs-fixer\.verbose {#opt-perSystem.pre-commit.settings.hooks.php-cs-fixer.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf {#opt-perSystem.pre-commit.settings.hooks.phpcbf}



phpcbf hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.enable {#opt-perSystem.pre-commit.settings.hooks.phpcbf.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.package {#opt-perSystem.pre-commit.settings.hooks.phpcbf.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.after {#opt-perSystem.pre-commit.settings.hooks.phpcbf.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.always_run {#opt-perSystem.pre-commit.settings.hooks.phpcbf.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.args {#opt-perSystem.pre-commit.settings.hooks.phpcbf.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.before {#opt-perSystem.pre-commit.settings.hooks.phpcbf.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.description {#opt-perSystem.pre-commit.settings.hooks.phpcbf.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.entry {#opt-perSystem.pre-commit.settings.hooks.phpcbf.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.phpcbf.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.excludes {#opt-perSystem.pre-commit.settings.hooks.phpcbf.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.phpcbf.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.phpcbf.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.files {#opt-perSystem.pre-commit.settings.hooks.phpcbf.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.id {#opt-perSystem.pre-commit.settings.hooks.phpcbf.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.language {#opt-perSystem.pre-commit.settings.hooks.phpcbf.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.name {#opt-perSystem.pre-commit.settings.hooks.phpcbf.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.phpcbf.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.raw {#opt-perSystem.pre-commit.settings.hooks.phpcbf.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.require_serial {#opt-perSystem.pre-commit.settings.hooks.phpcbf.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.phpcbf.settings.binPath}



PHP_CodeSniffer binary path\.



*Type:*
null or string



*Default:*

```
"${tools.phpcbf}/bin/phpcbf"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.stages {#opt-perSystem.pre-commit.settings.hooks.phpcbf.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.types {#opt-perSystem.pre-commit.settings.hooks.phpcbf.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.types_or {#opt-perSystem.pre-commit.settings.hooks.phpcbf.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcbf\.verbose {#opt-perSystem.pre-commit.settings.hooks.phpcbf.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs {#opt-perSystem.pre-commit.settings.hooks.phpcs}



phpcs hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.enable {#opt-perSystem.pre-commit.settings.hooks.phpcs.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.package {#opt-perSystem.pre-commit.settings.hooks.phpcs.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.after {#opt-perSystem.pre-commit.settings.hooks.phpcs.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.always_run {#opt-perSystem.pre-commit.settings.hooks.phpcs.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.args {#opt-perSystem.pre-commit.settings.hooks.phpcs.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.before {#opt-perSystem.pre-commit.settings.hooks.phpcs.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.description {#opt-perSystem.pre-commit.settings.hooks.phpcs.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.entry {#opt-perSystem.pre-commit.settings.hooks.phpcs.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.phpcs.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.excludes {#opt-perSystem.pre-commit.settings.hooks.phpcs.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.phpcs.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.phpcs.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.files {#opt-perSystem.pre-commit.settings.hooks.phpcs.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.id {#opt-perSystem.pre-commit.settings.hooks.phpcs.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.language {#opt-perSystem.pre-commit.settings.hooks.phpcs.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.name {#opt-perSystem.pre-commit.settings.hooks.phpcs.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.phpcs.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.raw {#opt-perSystem.pre-commit.settings.hooks.phpcs.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.require_serial {#opt-perSystem.pre-commit.settings.hooks.phpcs.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.phpcs.settings.binPath}



PHP_CodeSniffer binary path\.



*Type:*
null or string



*Default:*

```
"${tools.phpcs}/bin/phpcs"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.stages {#opt-perSystem.pre-commit.settings.hooks.phpcs.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.types {#opt-perSystem.pre-commit.settings.hooks.phpcs.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.types_or {#opt-perSystem.pre-commit.settings.hooks.phpcs.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpcs\.verbose {#opt-perSystem.pre-commit.settings.hooks.phpcs.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan {#opt-perSystem.pre-commit.settings.hooks.phpstan}



phpstan hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.enable {#opt-perSystem.pre-commit.settings.hooks.phpstan.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.package {#opt-perSystem.pre-commit.settings.hooks.phpstan.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.after {#opt-perSystem.pre-commit.settings.hooks.phpstan.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.always_run {#opt-perSystem.pre-commit.settings.hooks.phpstan.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.args {#opt-perSystem.pre-commit.settings.hooks.phpstan.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.before {#opt-perSystem.pre-commit.settings.hooks.phpstan.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.description {#opt-perSystem.pre-commit.settings.hooks.phpstan.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.entry {#opt-perSystem.pre-commit.settings.hooks.phpstan.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.phpstan.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.excludes {#opt-perSystem.pre-commit.settings.hooks.phpstan.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.phpstan.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.phpstan.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.files {#opt-perSystem.pre-commit.settings.hooks.phpstan.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.id {#opt-perSystem.pre-commit.settings.hooks.phpstan.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.language {#opt-perSystem.pre-commit.settings.hooks.phpstan.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.name {#opt-perSystem.pre-commit.settings.hooks.phpstan.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.phpstan.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.raw {#opt-perSystem.pre-commit.settings.hooks.phpstan.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.require_serial {#opt-perSystem.pre-commit.settings.hooks.phpstan.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.phpstan.settings.binPath}



PHPStan binary path\.



*Type:*
null or string



*Default:*

```
"${tools.phpstan}/bin/phpstan"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.stages {#opt-perSystem.pre-commit.settings.hooks.phpstan.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.types {#opt-perSystem.pre-commit.settings.hooks.phpstan.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.types_or {#opt-perSystem.pre-commit.settings.hooks.phpstan.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.phpstan\.verbose {#opt-perSystem.pre-commit.settings.hooks.phpstan.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier {#opt-perSystem.pre-commit.settings.hooks.prettier}



prettier hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.enable {#opt-perSystem.pre-commit.settings.hooks.prettier.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.package {#opt-perSystem.pre-commit.settings.hooks.prettier.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.after {#opt-perSystem.pre-commit.settings.hooks.prettier.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.always_run {#opt-perSystem.pre-commit.settings.hooks.prettier.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.args {#opt-perSystem.pre-commit.settings.hooks.prettier.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.before {#opt-perSystem.pre-commit.settings.hooks.prettier.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.description {#opt-perSystem.pre-commit.settings.hooks.prettier.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.entry {#opt-perSystem.pre-commit.settings.hooks.prettier.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.prettier.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.excludes {#opt-perSystem.pre-commit.settings.hooks.prettier.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.prettier.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.prettier.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.files {#opt-perSystem.pre-commit.settings.hooks.prettier.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.id {#opt-perSystem.pre-commit.settings.hooks.prettier.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.language {#opt-perSystem.pre-commit.settings.hooks.prettier.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.name {#opt-perSystem.pre-commit.settings.hooks.prettier.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.prettier.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.raw {#opt-perSystem.pre-commit.settings.hooks.prettier.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.require_serial {#opt-perSystem.pre-commit.settings.hooks.prettier.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.allow-parens {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.allow-parens}



Include parentheses around a sole arrow function parameter\.



*Type:*
one of “always”, “avoid”



*Default:*
` "always" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.binPath}



` prettier ` binary path\.
For example, if you want to use the ` prettier ` binary from ` node_modules `, use ` "./node_modules/.bin/prettier" `\.
Use a string instead of a path to avoid having to Git track the file in projects that use Nix flakes\.



*Type:*
null or string or absolute path



*Default:*

```
"${tools.prettier}/bin/prettier"

```



*Example:*

```
"./node_modules/.bin/prettier"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.bracket-same-line {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.bracket-same-line}



Put > of opening tags on the last line instead of on a new line\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.cache {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.cache}



Only format changed files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.cache-location {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.cache-location}



Path to the cache file location used by ` --cache ` flag\.



*Type:*
string



*Default:*
` "./node_modules/.cache/prettier/.prettier-cache" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.cache-strategy {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.cache-strategy}



Strategy for the cache to use for detecting changed files\.



*Type:*
null or one of “metadata”, “content”



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.check {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.check}



Output a human-friendly message and a list of unformatted files, if any\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.color {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.color}



Colorize error messages\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.config-precedence {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.config-precedence}



Defines how config file should be evaluated in combination of CLI options\.



*Type:*
one of “cli-override”, “file-override”, “prefer-file”



*Default:*
` "cli-override" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.configPath}



Path to a Prettier configuration file (\.prettierrc, package\.json, prettier\.config\.js)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.embedded-language-formatting {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.embedded-language-formatting}



Control how Prettier formats quoted code embedded in the file\.



*Type:*
one of “auto”, “off”



*Default:*
` "auto" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.end-of-line {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.end-of-line}



Which end of line characters to apply\.



*Type:*
one of “lf”, “crlf”, “cr”, “auto”



*Default:*
` "lf" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.html-whitespace-sensitivity {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.html-whitespace-sensitivity}



How to handle whitespaces in HTML\.



*Type:*
one of “css”, “strict”, “ignore”



*Default:*
` "css" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.ignore-path {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.ignore-path}



Path to a file containing patterns that describe files to ignore\.
By default, prettier looks for ` ./.gitignore ` and ` ./.prettierignore `\.
Multiple values are accepted\.



*Type:*
list of (string or absolute path)



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.ignore-unknown {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.ignore-unknown}



Ignore unknown files\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.insert-pragma {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.insert-pragma}



Insert @format pragma into file’s first docblock comment\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.jsx-single-quote {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.jsx-single-quote}



Use single quotes in JSX\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.list-different {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.list-different}



Print the filenames of files that are different from Prettier formatting\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.log-level {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.log-level}



What level of logs to report\.



*Type:*
one of “silent”, “error”, “warn”, “log”, “debug”



*Default:*
` "log" `



*Example:*
` "debug" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.no-bracket-spacing {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.no-bracket-spacing}



Do not print spaces between brackets\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.no-config {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.no-config}



Do not look for a configuration file\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.no-editorconfig {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.no-editorconfig}



Don’t take \.editorconfig into account when parsing configuration\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.no-error-on-unmatched-pattern {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.no-error-on-unmatched-pattern}



Prevent errors when pattern is unmatched\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.no-semi {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.no-semi}



Do not print semicolons, except at the beginning of lines which may need them\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.parser {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.parser}



Which parser to use\.



*Type:*
one of “”, “flow”, “babel”, “babel-flow”, “babel-ts”, “typescript”, “acorn”, “espree”, “meriyah”, “css”, “less”, “scss”, “json”, “json5”, “json-stringify”, “graphql”, “markdown”, “mdx”, “vue”, “yaml”, “glimmer”, “html”, “angular”, “lwc”



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.plugins {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.plugins}



Add plugins from paths\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.print-width {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.print-width}



Line length that the printer will wrap on\.



*Type:*
signed integer



*Default:*
` 80 `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.prose-wrap {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.prose-wrap}



When to or if at all hard wrap prose to print width\.



*Type:*
one of “always”, “never”, “preserve”



*Default:*
` "preserve" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.quote-props {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.quote-props}



Change when properties in objects are quoted\.



*Type:*
one of “as-needed”, “consistent”, “preserve”



*Default:*
` "as-needed" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.require-pragma {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.require-pragma}



Require either ‘@prettier’ or ‘@format’ to be present in the file’s first docblock comment\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.single-attribute-per-line {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.single-attribute-per-line}



Enforce single attribute per line in HTML, Vue andJSX\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.single-quote {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.single-quote}



Number of spaces per indentation-level\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.tab-width {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.tab-width}



Line length that the printer will wrap on\.



*Type:*
signed integer



*Default:*
` 2 `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.trailing-comma {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.trailing-comma}



Print trailing commas wherever possible in multi-line comma-separated syntactic structures\.



*Type:*
one of “all”, “es5”, “none”



*Default:*
` "all" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.use-tabs {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.use-tabs}



Indent with tabs instead of spaces\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.vue-indent-script-and-style {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.vue-indent-script-and-style}



Indent script and style tags in Vue files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.with-node-modules {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.with-node-modules}



Process files inside ‘node_modules’ directory\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.settings\.write {#opt-perSystem.pre-commit.settings.hooks.prettier.settings.write}



Edit files in-place\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.stages {#opt-perSystem.pre-commit.settings.hooks.prettier.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.types {#opt-perSystem.pre-commit.settings.hooks.prettier.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.types_or {#opt-perSystem.pre-commit.settings.hooks.prettier.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.prettier\.verbose {#opt-perSystem.pre-commit.settings.hooks.prettier.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json}



pretty-format-json hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.enable {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.package {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.after {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.always_run {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.args {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.before {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.description {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.entry {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.excludes {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.files {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.id {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.language {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.name {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.raw {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.require_serial {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.settings\.autofix {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.settings.autofix}



Automatically format JSON files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.settings\.indent {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.settings.indent}



Control the indentation (either a number for a number of spaces or a string of whitespace)\. Defaults to 2 spaces\.



*Type:*
null or signed integer or string



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.settings\.no-ensure-ascii {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.settings.no-ensure-ascii}



Preserve unicode characters instead of converting to escape sequences\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.settings\.no-sort-keys {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.settings.no-sort-keys}



When autofixing, retain the original key ordering (instead of sorting the keys)\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.settings\.top-keys {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.settings.top-keys}



Keys to keep at the top of mappings\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.stages {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.types {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.types_or {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pretty-format-json\.verbose {#opt-perSystem.pre-commit.settings.hooks.pretty-format-json.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint {#opt-perSystem.pre-commit.settings.hooks.proselint}



proselint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.enable {#opt-perSystem.pre-commit.settings.hooks.proselint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.package {#opt-perSystem.pre-commit.settings.hooks.proselint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.after {#opt-perSystem.pre-commit.settings.hooks.proselint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.always_run {#opt-perSystem.pre-commit.settings.hooks.proselint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.args {#opt-perSystem.pre-commit.settings.hooks.proselint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.before {#opt-perSystem.pre-commit.settings.hooks.proselint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.description {#opt-perSystem.pre-commit.settings.hooks.proselint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.entry {#opt-perSystem.pre-commit.settings.hooks.proselint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.proselint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.excludes {#opt-perSystem.pre-commit.settings.hooks.proselint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.proselint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.proselint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.files {#opt-perSystem.pre-commit.settings.hooks.proselint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.id {#opt-perSystem.pre-commit.settings.hooks.proselint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.language {#opt-perSystem.pre-commit.settings.hooks.proselint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.name {#opt-perSystem.pre-commit.settings.hooks.proselint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.proselint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.raw {#opt-perSystem.pre-commit.settings.hooks.proselint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.proselint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.settings\.config {#opt-perSystem.pre-commit.settings.hooks.proselint.settings.config}



Multiline-string configuration passed as config file\.



*Type:*
string



*Default:*
` "" `



*Example:*

```
''
  {
    "checks": {
      "typography.diacritical_marks": false
    }
  }
''
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.proselint.settings.configPath}



Path to the config file\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.proselint.settings.flags}



Flags passed to proselint\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.stages {#opt-perSystem.pre-commit.settings.hooks.proselint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.types {#opt-perSystem.pre-commit.settings.hooks.proselint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.types_or {#opt-perSystem.pre-commit.settings.hooks.proselint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.proselint\.verbose {#opt-perSystem.pre-commit.settings.hooks.proselint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm {#opt-perSystem.pre-commit.settings.hooks.psalm}



psalm hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.enable {#opt-perSystem.pre-commit.settings.hooks.psalm.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.package {#opt-perSystem.pre-commit.settings.hooks.psalm.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.after {#opt-perSystem.pre-commit.settings.hooks.psalm.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.always_run {#opt-perSystem.pre-commit.settings.hooks.psalm.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.args {#opt-perSystem.pre-commit.settings.hooks.psalm.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.before {#opt-perSystem.pre-commit.settings.hooks.psalm.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.description {#opt-perSystem.pre-commit.settings.hooks.psalm.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.entry {#opt-perSystem.pre-commit.settings.hooks.psalm.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.psalm.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.excludes {#opt-perSystem.pre-commit.settings.hooks.psalm.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.psalm.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.psalm.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.files {#opt-perSystem.pre-commit.settings.hooks.psalm.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.id {#opt-perSystem.pre-commit.settings.hooks.psalm.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.language {#opt-perSystem.pre-commit.settings.hooks.psalm.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.name {#opt-perSystem.pre-commit.settings.hooks.psalm.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.psalm.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.raw {#opt-perSystem.pre-commit.settings.hooks.psalm.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.require_serial {#opt-perSystem.pre-commit.settings.hooks.psalm.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.psalm.settings.binPath}



Psalm binary path\.



*Type:*
null or string



*Default:*

```
"${tools.psalm}/bin/psalm"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.stages {#opt-perSystem.pre-commit.settings.hooks.psalm.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.types {#opt-perSystem.pre-commit.settings.hooks.psalm.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.types_or {#opt-perSystem.pre-commit.settings.hooks.psalm.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.psalm\.verbose {#opt-perSystem.pre-commit.settings.hooks.psalm.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint {#opt-perSystem.pre-commit.settings.hooks.pylint}



pylint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.enable {#opt-perSystem.pre-commit.settings.hooks.pylint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.package {#opt-perSystem.pre-commit.settings.hooks.pylint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.after {#opt-perSystem.pre-commit.settings.hooks.pylint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.always_run {#opt-perSystem.pre-commit.settings.hooks.pylint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.args {#opt-perSystem.pre-commit.settings.hooks.pylint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.before {#opt-perSystem.pre-commit.settings.hooks.pylint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.description {#opt-perSystem.pre-commit.settings.hooks.pylint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.entry {#opt-perSystem.pre-commit.settings.hooks.pylint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.pylint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.excludes {#opt-perSystem.pre-commit.settings.hooks.pylint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.pylint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.pylint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.files {#opt-perSystem.pre-commit.settings.hooks.pylint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.id {#opt-perSystem.pre-commit.settings.hooks.pylint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.language {#opt-perSystem.pre-commit.settings.hooks.pylint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.name {#opt-perSystem.pre-commit.settings.hooks.pylint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.pylint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.raw {#opt-perSystem.pre-commit.settings.hooks.pylint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.pylint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.pylint.settings.binPath}



Pylint binary path\. Should be used to specify Pylint binary from your Python environment\.



*Type:*
null or string



*Default:*

```
"${tools.pylint}/bin/pylint"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.settings\.reports {#opt-perSystem.pre-commit.settings.hooks.pylint.settings.reports}



Whether to display a full report\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.settings\.score {#opt-perSystem.pre-commit.settings.hooks.pylint.settings.score}



Whether to activate the evaluation score\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.stages {#opt-perSystem.pre-commit.settings.hooks.pylint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.types {#opt-perSystem.pre-commit.settings.hooks.pylint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.types_or {#opt-perSystem.pre-commit.settings.hooks.pylint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pylint\.verbose {#opt-perSystem.pre-commit.settings.hooks.pylint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright {#opt-perSystem.pre-commit.settings.hooks.pyright}



pyright hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.enable {#opt-perSystem.pre-commit.settings.hooks.pyright.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.package {#opt-perSystem.pre-commit.settings.hooks.pyright.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.after {#opt-perSystem.pre-commit.settings.hooks.pyright.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.always_run {#opt-perSystem.pre-commit.settings.hooks.pyright.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.args {#opt-perSystem.pre-commit.settings.hooks.pyright.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.before {#opt-perSystem.pre-commit.settings.hooks.pyright.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.description {#opt-perSystem.pre-commit.settings.hooks.pyright.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.entry {#opt-perSystem.pre-commit.settings.hooks.pyright.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.pyright.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.excludes {#opt-perSystem.pre-commit.settings.hooks.pyright.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.pyright.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.pyright.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.files {#opt-perSystem.pre-commit.settings.hooks.pyright.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.id {#opt-perSystem.pre-commit.settings.hooks.pyright.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.language {#opt-perSystem.pre-commit.settings.hooks.pyright.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.name {#opt-perSystem.pre-commit.settings.hooks.pyright.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.pyright.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.raw {#opt-perSystem.pre-commit.settings.hooks.pyright.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.require_serial {#opt-perSystem.pre-commit.settings.hooks.pyright.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.pyright.settings.binPath}



Pyright binary path\. Should be used to specify the pyright executable in an environment containing your typing stubs\.



*Type:*
null or string



*Default:*

```
"${tools.pyright}/bin/pyright"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.stages {#opt-perSystem.pre-commit.settings.hooks.pyright.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.types {#opt-perSystem.pre-commit.settings.hooks.pyright.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.types_or {#opt-perSystem.pre-commit.settings.hooks.pyright.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyright\.verbose {#opt-perSystem.pre-commit.settings.hooks.pyright.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade {#opt-perSystem.pre-commit.settings.hooks.pyupgrade}



pyupgrade hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.enable {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.package {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.after {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.always_run {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.args {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.before {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.description {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.entry {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.excludes {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.files {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.id {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.language {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.name {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.raw {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.require_serial {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.settings\.binPath {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.settings.binPath}



pyupgrade binary path\. Should be used to specify the pyupgrade binary from your Python environment\.



*Type:*
null or string



*Default:*

```
"${tools.pyupgrade}/bin/pyupgrade"

```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.stages {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.types {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.types_or {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.pyupgrade\.verbose {#opt-perSystem.pre-commit.settings.hooks.pyupgrade.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse {#opt-perSystem.pre-commit.settings.hooks.reuse}



reuse hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.enable {#opt-perSystem.pre-commit.settings.hooks.reuse.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.package {#opt-perSystem.pre-commit.settings.hooks.reuse.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.after {#opt-perSystem.pre-commit.settings.hooks.reuse.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.always_run {#opt-perSystem.pre-commit.settings.hooks.reuse.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.args {#opt-perSystem.pre-commit.settings.hooks.reuse.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.before {#opt-perSystem.pre-commit.settings.hooks.reuse.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.description {#opt-perSystem.pre-commit.settings.hooks.reuse.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.entry {#opt-perSystem.pre-commit.settings.hooks.reuse.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.reuse.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.excludes {#opt-perSystem.pre-commit.settings.hooks.reuse.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.reuse.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.reuse.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.files {#opt-perSystem.pre-commit.settings.hooks.reuse.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.id {#opt-perSystem.pre-commit.settings.hooks.reuse.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.language {#opt-perSystem.pre-commit.settings.hooks.reuse.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.name {#opt-perSystem.pre-commit.settings.hooks.reuse.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.reuse.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.raw {#opt-perSystem.pre-commit.settings.hooks.reuse.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.require_serial {#opt-perSystem.pre-commit.settings.hooks.reuse.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.reuse.settings.flags}



Flags passed to reuse\. For available options run ‘reuse lint --help’



*Type:*
string



*Default:*
` "" `



*Example:*
` "--json" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.stages {#opt-perSystem.pre-commit.settings.hooks.reuse.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.types {#opt-perSystem.pre-commit.settings.hooks.reuse.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.types_or {#opt-perSystem.pre-commit.settings.hooks.reuse.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.reuse\.verbose {#opt-perSystem.pre-commit.settings.hooks.reuse.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive {#opt-perSystem.pre-commit.settings.hooks.revive}



revive hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.enable {#opt-perSystem.pre-commit.settings.hooks.revive.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.package {#opt-perSystem.pre-commit.settings.hooks.revive.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.after {#opt-perSystem.pre-commit.settings.hooks.revive.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.always_run {#opt-perSystem.pre-commit.settings.hooks.revive.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.args {#opt-perSystem.pre-commit.settings.hooks.revive.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.before {#opt-perSystem.pre-commit.settings.hooks.revive.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.description {#opt-perSystem.pre-commit.settings.hooks.revive.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.entry {#opt-perSystem.pre-commit.settings.hooks.revive.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.revive.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.excludes {#opt-perSystem.pre-commit.settings.hooks.revive.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.revive.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.revive.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.files {#opt-perSystem.pre-commit.settings.hooks.revive.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.id {#opt-perSystem.pre-commit.settings.hooks.revive.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.language {#opt-perSystem.pre-commit.settings.hooks.revive.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.name {#opt-perSystem.pre-commit.settings.hooks.revive.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.revive.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.raw {#opt-perSystem.pre-commit.settings.hooks.revive.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.require_serial {#opt-perSystem.pre-commit.settings.hooks.revive.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.revive.settings.configPath}



Path to the configuration TOML file\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.stages {#opt-perSystem.pre-commit.settings.hooks.revive.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.types {#opt-perSystem.pre-commit.settings.hooks.revive.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.types_or {#opt-perSystem.pre-commit.settings.hooks.revive.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.revive\.verbose {#opt-perSystem.pre-commit.settings.hooks.revive.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets {#opt-perSystem.pre-commit.settings.hooks.ripsecrets}



ripsecrets hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.enable {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.package {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.after {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.always_run {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.args {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.before {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.description {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.entry {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.excludes {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.files {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.id {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.language {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.name {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.raw {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.require_serial {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.settings\.additionalPatterns {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.settings.additionalPatterns}



Additional regex patterns used to find secrets\. If there is a matching group in the regex the matched group will be tested for randomness before being reported as a secret\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.stages {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.types {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.types_or {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.ripsecrets\.verbose {#opt-perSystem.pre-commit.settings.hooks.ripsecrets.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl {#opt-perSystem.pre-commit.settings.hooks.rumdl}



rumdl hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.enable {#opt-perSystem.pre-commit.settings.hooks.rumdl.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.package {#opt-perSystem.pre-commit.settings.hooks.rumdl.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.after {#opt-perSystem.pre-commit.settings.hooks.rumdl.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.always_run {#opt-perSystem.pre-commit.settings.hooks.rumdl.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.args {#opt-perSystem.pre-commit.settings.hooks.rumdl.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.before {#opt-perSystem.pre-commit.settings.hooks.rumdl.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.description {#opt-perSystem.pre-commit.settings.hooks.rumdl.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.entry {#opt-perSystem.pre-commit.settings.hooks.rumdl.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.rumdl.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.excludes {#opt-perSystem.pre-commit.settings.hooks.rumdl.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.rumdl.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.rumdl.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.files {#opt-perSystem.pre-commit.settings.hooks.rumdl.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.id {#opt-perSystem.pre-commit.settings.hooks.rumdl.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.language {#opt-perSystem.pre-commit.settings.hooks.rumdl.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.name {#opt-perSystem.pre-commit.settings.hooks.rumdl.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.rumdl.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.raw {#opt-perSystem.pre-commit.settings.hooks.rumdl.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.require_serial {#opt-perSystem.pre-commit.settings.hooks.rumdl.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.settings\.configuration {#opt-perSystem.pre-commit.settings.hooks.rumdl.settings.configuration}



See https://github\.com/rvben/rumdl?tab=readme-ov-file\#configuration



*Type:*
attribute set



*Default:*
` { } `



*Example:*

```
{
  configuration = {
    MD013 = {
      line-length = 100;
    };
  };
}
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.stages {#opt-perSystem.pre-commit.settings.hooks.rumdl.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.types {#opt-perSystem.pre-commit.settings.hooks.rumdl.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.types_or {#opt-perSystem.pre-commit.settings.hooks.rumdl.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rumdl\.verbose {#opt-perSystem.pre-commit.settings.hooks.rumdl.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt {#opt-perSystem.pre-commit.settings.hooks.rustfmt}



Additional rustfmt settings

Override the ` rustfmt ` and ` cargo ` packages by setting ` hooks.rustfmt.packageOverrides `\.

```
hooks.rustfmt.packageOverrides.cargo = pkgs.cargo;
hooks.rustfmt.packageOverrides.rustfmt = pkgs.rustfmt;
```



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.enable {#opt-perSystem.pre-commit.settings.hooks.rustfmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.package {#opt-perSystem.pre-commit.settings.hooks.rustfmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.packageOverrides\.cargo {#opt-perSystem.pre-commit.settings.hooks.rustfmt.packageOverrides.cargo}



The cargo package to use\.



*Type:*
package

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.packageOverrides\.rustfmt {#opt-perSystem.pre-commit.settings.hooks.rustfmt.packageOverrides.rustfmt}



The rustfmt package to use\.



*Type:*
package

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.after {#opt-perSystem.pre-commit.settings.hooks.rustfmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.rustfmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.args {#opt-perSystem.pre-commit.settings.hooks.rustfmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.before {#opt-perSystem.pre-commit.settings.hooks.rustfmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.description {#opt-perSystem.pre-commit.settings.hooks.rustfmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.entry {#opt-perSystem.pre-commit.settings.hooks.rustfmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.rustfmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.rustfmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.rustfmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.rustfmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.files {#opt-perSystem.pre-commit.settings.hooks.rustfmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.id {#opt-perSystem.pre-commit.settings.hooks.rustfmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.language {#opt-perSystem.pre-commit.settings.hooks.rustfmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.name {#opt-perSystem.pre-commit.settings.hooks.rustfmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.rustfmt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.raw {#opt-perSystem.pre-commit.settings.hooks.rustfmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.rustfmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.package {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.package}



Package(s) to check



*Type:*
list of string matching the pattern \[]\[\*?!0-9A-Za-z_-]+



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.all {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.all}



Format all packages, and also their local path-based dependencies



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.check {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.check}



Run rustfmt in check mode



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.color {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.color}



Coloring the output



*Type:*
one of “auto”, “always”, “never”



*Default:*
` "always" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.config {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.config}



Override configuration values



*Type:*
attribute set



*Default:*
` { } `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.config-path {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.config-path}



Path to rustfmt\.toml config file



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.emit {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.emit}



What data to emit and how



*Type:*
null or one of “files”, “stdout”



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.files-with-diff {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.files-with-diff}



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.manifest-path {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.manifest-path}



Path to Cargo\.toml



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.message-format {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.message-format}



The output format of diagnostic messages



*Type:*
null or one of “human”, “short”



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.settings\.verbose {#opt-perSystem.pre-commit.settings.hooks.rustfmt.settings.verbose}



Use verbose output



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.stages {#opt-perSystem.pre-commit.settings.hooks.rustfmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.types {#opt-perSystem.pre-commit.settings.hooks.rustfmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.rustfmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.rustfmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.rustfmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt {#opt-perSystem.pre-commit.settings.hooks.shfmt}



shfmt hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.enable {#opt-perSystem.pre-commit.settings.hooks.shfmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.package {#opt-perSystem.pre-commit.settings.hooks.shfmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.after {#opt-perSystem.pre-commit.settings.hooks.shfmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.shfmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.args {#opt-perSystem.pre-commit.settings.hooks.shfmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.before {#opt-perSystem.pre-commit.settings.hooks.shfmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.description {#opt-perSystem.pre-commit.settings.hooks.shfmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.entry {#opt-perSystem.pre-commit.settings.hooks.shfmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.shfmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.shfmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.shfmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.shfmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.files {#opt-perSystem.pre-commit.settings.hooks.shfmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.id {#opt-perSystem.pre-commit.settings.hooks.shfmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.language {#opt-perSystem.pre-commit.settings.hooks.shfmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.name {#opt-perSystem.pre-commit.settings.hooks.shfmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.shfmt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.raw {#opt-perSystem.pre-commit.settings.hooks.shfmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.shfmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.settings\.simplify {#opt-perSystem.pre-commit.settings.hooks.shfmt.settings.simplify}



Simplify the code\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.stages {#opt-perSystem.pre-commit.settings.hooks.shfmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.types {#opt-perSystem.pre-commit.settings.hooks.shfmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.shfmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.shfmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.shfmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents}



sort-file-contents-hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.enable {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.package {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.after {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.always_run {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.args {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.before {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.description {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.entry {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.excludes {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.files {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.id {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.language {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.name {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.raw {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.require_serial {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.settings\.ignore-case {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.settings.ignore-case}



Fold lower case to upper case characters\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.settings\.unique {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.settings.unique}



Ensure each line is unique\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.stages {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.types {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.types_or {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.sort-file-contents\.verbose {#opt-perSystem.pre-commit.settings.hooks.sort-file-contents.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix {#opt-perSystem.pre-commit.settings.hooks.statix}



statix hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.enable {#opt-perSystem.pre-commit.settings.hooks.statix.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.package {#opt-perSystem.pre-commit.settings.hooks.statix.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.after {#opt-perSystem.pre-commit.settings.hooks.statix.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.always_run {#opt-perSystem.pre-commit.settings.hooks.statix.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.args {#opt-perSystem.pre-commit.settings.hooks.statix.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.before {#opt-perSystem.pre-commit.settings.hooks.statix.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.description {#opt-perSystem.pre-commit.settings.hooks.statix.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.entry {#opt-perSystem.pre-commit.settings.hooks.statix.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.statix.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.excludes {#opt-perSystem.pre-commit.settings.hooks.statix.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.statix.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.statix.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.files {#opt-perSystem.pre-commit.settings.hooks.statix.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.id {#opt-perSystem.pre-commit.settings.hooks.statix.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.language {#opt-perSystem.pre-commit.settings.hooks.statix.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.name {#opt-perSystem.pre-commit.settings.hooks.statix.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.statix.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.raw {#opt-perSystem.pre-commit.settings.hooks.statix.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.require_serial {#opt-perSystem.pre-commit.settings.hooks.statix.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.settings\.config {#opt-perSystem.pre-commit.settings.hooks.statix.settings.config}



Path to statix\.toml or its parent directory\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.settings\.format {#opt-perSystem.pre-commit.settings.hooks.statix.settings.format}



Error Output format\.



*Type:*
one of “stderr”, “errfmt”, “json”



*Default:*
` "errfmt" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.settings\.ignore {#opt-perSystem.pre-commit.settings.hooks.statix.settings.ignore}



Globs of file patterns to skip\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "flake.nix"
  "_*"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.settings\.unrestricted {#opt-perSystem.pre-commit.settings.hooks.statix.settings.unrestricted}



Don’t respect \.gitignore files\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.stages {#opt-perSystem.pre-commit.settings.hooks.statix.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.types {#opt-perSystem.pre-commit.settings.hooks.statix.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.types_or {#opt-perSystem.pre-commit.settings.hooks.statix.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.statix\.verbose {#opt-perSystem.pre-commit.settings.hooks.statix.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt {#opt-perSystem.pre-commit.settings.hooks.treefmt}



Treefmt hook\.

Include any additional formatters configured by treefmt as ` hooks.treefmt.settings.formatters `\.

```
hooks.treefmt.settings.formatters = [
  pkgs.nixpkgs-fmt
  pkgs.black
];
```

Override ` treefmt ` itself by setting ` hooks.treefmt.packageOverrides.treefmt `\.

```
hooks.treefmt.packageOverrides.treefmt = pkgs.treefmt;
```



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.enable {#opt-perSystem.pre-commit.settings.hooks.treefmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.package {#opt-perSystem.pre-commit.settings.hooks.treefmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.packageOverrides\.treefmt {#opt-perSystem.pre-commit.settings.hooks.treefmt.packageOverrides.treefmt}



The treefmt package to use



*Type:*
package

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.after {#opt-perSystem.pre-commit.settings.hooks.treefmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.treefmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.args {#opt-perSystem.pre-commit.settings.hooks.treefmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.before {#opt-perSystem.pre-commit.settings.hooks.treefmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.description {#opt-perSystem.pre-commit.settings.hooks.treefmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.entry {#opt-perSystem.pre-commit.settings.hooks.treefmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.treefmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.treefmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.treefmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.treefmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.files {#opt-perSystem.pre-commit.settings.hooks.treefmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.id {#opt-perSystem.pre-commit.settings.hooks.treefmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.language {#opt-perSystem.pre-commit.settings.hooks.treefmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.name {#opt-perSystem.pre-commit.settings.hooks.treefmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.treefmt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.raw {#opt-perSystem.pre-commit.settings.hooks.treefmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.treefmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.settings\.fail-on-change {#opt-perSystem.pre-commit.settings.hooks.treefmt.settings.fail-on-change}



Fail if some files require re-formatting\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.settings\.formatters {#opt-perSystem.pre-commit.settings.hooks.treefmt.settings.formatters}



The formatter packages configured by treefmt



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.settings\.no-cache {#opt-perSystem.pre-commit.settings.hooks.treefmt.settings.no-cache}



Ignore the evaluation cache entirely\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.stages {#opt-perSystem.pre-commit.settings.hooks.treefmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.types {#opt-perSystem.pre-commit.settings.hooks.treefmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.treefmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.treefmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.treefmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos {#opt-perSystem.pre-commit.settings.hooks.typos}



typos hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.enable {#opt-perSystem.pre-commit.settings.hooks.typos.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.package {#opt-perSystem.pre-commit.settings.hooks.typos.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.after {#opt-perSystem.pre-commit.settings.hooks.typos.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.always_run {#opt-perSystem.pre-commit.settings.hooks.typos.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.args {#opt-perSystem.pre-commit.settings.hooks.typos.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.before {#opt-perSystem.pre-commit.settings.hooks.typos.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.description {#opt-perSystem.pre-commit.settings.hooks.typos.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.entry {#opt-perSystem.pre-commit.settings.hooks.typos.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.typos.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.excludes {#opt-perSystem.pre-commit.settings.hooks.typos.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.typos.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.typos.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.files {#opt-perSystem.pre-commit.settings.hooks.typos.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.id {#opt-perSystem.pre-commit.settings.hooks.typos.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.language {#opt-perSystem.pre-commit.settings.hooks.typos.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.name {#opt-perSystem.pre-commit.settings.hooks.typos.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.typos.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.raw {#opt-perSystem.pre-commit.settings.hooks.typos.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.require_serial {#opt-perSystem.pre-commit.settings.hooks.typos.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.binary {#opt-perSystem.pre-commit.settings.hooks.typos.settings.binary}



Whether to search binary files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.color {#opt-perSystem.pre-commit.settings.hooks.typos.settings.color}



When to use generate output\.



*Type:*
one of “auto”, “always”, “never”



*Default:*
` "auto" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.config {#opt-perSystem.pre-commit.settings.hooks.typos.settings.config}



Configuration as in https://github\.com/crate-ci/typos/blob/master/docs/reference\.md\.



*Type:*
TOML value



*Default:*
` { } `



*Example:*

```
{
  default = {
    binary = false;
  };
  files = {
    ignore-dot = true;
  };
  type = {
    py = {
      extend-glob = [ ];
    };
  };
}
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.typos.settings.configPath}



Path to a custom config file\. Ignored if ` typos.settings.config ` is set\.



*Type:*
string



*Default:*
` "" `



*Example:*
` ".typos.toml" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.diff {#opt-perSystem.pre-commit.settings.hooks.typos.settings.diff}



Print a diff of what would change\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.exclude {#opt-perSystem.pre-commit.settings.hooks.typos.settings.exclude}



Ignore files and directories matching one of the globs\.



*Type:*
(list of string) or string convertible to it



*Default:*
` [ ] `



*Example:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.force-exclude {#opt-perSystem.pre-commit.settings.hooks.typos.settings.force-exclude}



Respect excluded files even for paths passed explicitly\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.format {#opt-perSystem.pre-commit.settings.hooks.typos.settings.format}



Output format to use\.



*Type:*
one of “silent”, “brief”, “long”, “json”



*Default:*
` "long" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.hidden {#opt-perSystem.pre-commit.settings.hooks.typos.settings.hidden}



Search hidden files and directories\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.ignored-words {#opt-perSystem.pre-commit.settings.hooks.typos.settings.ignored-words}



Spellings and words to ignore\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "MQTT"
  "mosquitto"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.locale {#opt-perSystem.pre-commit.settings.hooks.typos.settings.locale}



Which language to use for spell checking\.



*Type:*
one of “en”, “en-us”, “en-gb”, “en-ca”, “en-au”



*Default:*
` "en" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.no-check-filenames {#opt-perSystem.pre-commit.settings.hooks.typos.settings.no-check-filenames}



Skip verifying spelling in file names\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.no-check-files {#opt-perSystem.pre-commit.settings.hooks.typos.settings.no-check-files}



Skip verifying spelling in files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.no-unicode {#opt-perSystem.pre-commit.settings.hooks.typos.settings.no-unicode}



Only allow ASCII characters in identifiers\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.quiet {#opt-perSystem.pre-commit.settings.hooks.typos.settings.quiet}



Less output per occurrence\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.verbose {#opt-perSystem.pre-commit.settings.hooks.typos.settings.verbose}



More output per occurrence\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.settings\.write {#opt-perSystem.pre-commit.settings.hooks.typos.settings.write}



Fix spelling in files by writing them\. Cannot be used with ` typos.settings.diff `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.stages {#opt-perSystem.pre-commit.settings.hooks.typos.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.types {#opt-perSystem.pre-commit.settings.hooks.typos.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.types_or {#opt-perSystem.pre-commit.settings.hooks.typos.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.typos\.verbose {#opt-perSystem.pre-commit.settings.hooks.typos.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export {#opt-perSystem.pre-commit.settings.hooks.uv-export}



uv export hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.enable {#opt-perSystem.pre-commit.settings.hooks.uv-export.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.package {#opt-perSystem.pre-commit.settings.hooks.uv-export.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.after {#opt-perSystem.pre-commit.settings.hooks.uv-export.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.always_run {#opt-perSystem.pre-commit.settings.hooks.uv-export.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.args {#opt-perSystem.pre-commit.settings.hooks.uv-export.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.before {#opt-perSystem.pre-commit.settings.hooks.uv-export.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.description {#opt-perSystem.pre-commit.settings.hooks.uv-export.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.entry {#opt-perSystem.pre-commit.settings.hooks.uv-export.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.uv-export.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.excludes {#opt-perSystem.pre-commit.settings.hooks.uv-export.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.uv-export.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.uv-export.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.files {#opt-perSystem.pre-commit.settings.hooks.uv-export.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.id {#opt-perSystem.pre-commit.settings.hooks.uv-export.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.language {#opt-perSystem.pre-commit.settings.hooks.uv-export.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.name {#opt-perSystem.pre-commit.settings.hooks.uv-export.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.uv-export.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.raw {#opt-perSystem.pre-commit.settings.hooks.uv-export.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.require_serial {#opt-perSystem.pre-commit.settings.hooks.uv-export.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.uv-export.settings.flags}



Flags passed to ` uv export `



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.settings\.format {#opt-perSystem.pre-commit.settings.hooks.uv-export.settings.format}



Output format of the project’s lockfile\.



*Type:*
one of “requirements\.txt”, “pylock\.toml”



*Default:*
` "pylock.toml" `



*Example:*
` "requirements.txt" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.settings\.locked {#opt-perSystem.pre-commit.settings.hooks.uv-export.settings.locked}



Assert that the ` uv.lock ` will remain unchanged\.
Requires that the lockfile is up-to-date\. If the lockfile is missing or needs to be updated, uv will exit with an error\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.stages {#opt-perSystem.pre-commit.settings.hooks.uv-export.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.types {#opt-perSystem.pre-commit.settings.hooks.uv-export.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.types_or {#opt-perSystem.pre-commit.settings.hooks.uv-export.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.uv-export\.verbose {#opt-perSystem.pre-commit.settings.hooks.uv-export.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale {#opt-perSystem.pre-commit.settings.hooks.vale}



vale hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.enable {#opt-perSystem.pre-commit.settings.hooks.vale.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.package {#opt-perSystem.pre-commit.settings.hooks.vale.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.after {#opt-perSystem.pre-commit.settings.hooks.vale.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.always_run {#opt-perSystem.pre-commit.settings.hooks.vale.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.args {#opt-perSystem.pre-commit.settings.hooks.vale.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.before {#opt-perSystem.pre-commit.settings.hooks.vale.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.description {#opt-perSystem.pre-commit.settings.hooks.vale.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.entry {#opt-perSystem.pre-commit.settings.hooks.vale.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.vale.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.excludes {#opt-perSystem.pre-commit.settings.hooks.vale.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.vale.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.vale.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.files {#opt-perSystem.pre-commit.settings.hooks.vale.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.id {#opt-perSystem.pre-commit.settings.hooks.vale.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.language {#opt-perSystem.pre-commit.settings.hooks.vale.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.name {#opt-perSystem.pre-commit.settings.hooks.vale.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.vale.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.raw {#opt-perSystem.pre-commit.settings.hooks.vale.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.require_serial {#opt-perSystem.pre-commit.settings.hooks.vale.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.vale.settings.configPath}



Path to the config file\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.settings\.configuration {#opt-perSystem.pre-commit.settings.hooks.vale.settings.configuration}



Multiline-string configuration passed as config file\.



*Type:*
string



*Default:*
` "" `



*Example:*

```
''
  MinAlertLevel = suggestion
  [*]
  BasedOnStyles = Vale
''
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.settings\.flags {#opt-perSystem.pre-commit.settings.hooks.vale.settings.flags}



Flags passed to vale\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.stages {#opt-perSystem.pre-commit.settings.hooks.vale.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.types {#opt-perSystem.pre-commit.settings.hooks.vale.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.types_or {#opt-perSystem.pre-commit.settings.hooks.vale.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.vale\.verbose {#opt-perSystem.pre-commit.settings.hooks.vale.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint}



` woodpecker-cli lint ` hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.enable {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.package {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.after {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.always_run {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.args {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.before {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.description {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.entry {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.excludes {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.files {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.id {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.language {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.name {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.raw {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.settings\.pluginsPrivileged {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.settings.pluginsPrivileged}



List of plugins, allowed to run in privileged mode



*Type:*
strings concatenated with “,”



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.settings\.pluginsTrustedClone {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.settings.pluginsTrustedClone}



List of plugins, that are trusted to handle Git credentials in cloning steps\.
If not set, the program defaults to
“docker\.io/woodpeckerci/plugin-git:2\.6\.3,docker\.io/woodpeckerci/plugin-git,quay\.io/woodpeckerci/plugin-git”\.



*Type:*
strings concatenated with “,”



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.settings\.strict {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.settings.strict}



Whether to treat warnings as errors\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.settings\.workflowPath {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.settings.workflowPath}



Path to the workflow config file/directory\. If not set, the program
looks for ` .woodpecker.ya?ml ` file or ` .woodpecker ` directory\.



*Type:*
string



*Default:*
` "" `



*Example:*
` ".woodpecker.yml" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.stages {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.types {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.types_or {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.woodpecker-cli-lint\.verbose {#opt-perSystem.pre-commit.settings.hooks.woodpecker-cli-lint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt {#opt-perSystem.pre-commit.settings.hooks.yamlfmt}



yamlfmt hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.enable {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.package {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.after {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.always_run {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.args {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.before {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.description {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.entry {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.excludes {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.files {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.id {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.language {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.name {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.raw {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.require_serial {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.settings.configPath}



Path to a custom configuration file\.



*Type:*
string



*Default:*
` "" `



*Example:*
` ".yamlfmt" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.settings\.lint-only {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.settings.lint-only}



Only lint the files, do not format them in place\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.stages {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.types {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.types_or {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamlfmt\.verbose {#opt-perSystem.pre-commit.settings.hooks.yamlfmt.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint {#opt-perSystem.pre-commit.settings.hooks.yamllint}



yamllint hook



*Type:*
submodule

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.enable {#opt-perSystem.pre-commit.settings.hooks.yamllint.enable}



Whether to enable this pre-commit hook\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.package {#opt-perSystem.pre-commit.settings.hooks.yamllint.package}



An optional package that provides the hook\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.after {#opt-perSystem.pre-commit.settings.hooks.yamllint.after}



List of hooks that should run before this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.always_run {#opt-perSystem.pre-commit.settings.hooks.yamllint.always_run}



if true this hook will run even if there are no matching files\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.args {#opt-perSystem.pre-commit.settings.hooks.yamllint.args}



List of additional parameters to pass to the hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.before {#opt-perSystem.pre-commit.settings.hooks.yamllint.before}



List of hooks that should run after this hook\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.description {#opt-perSystem.pre-commit.settings.hooks.yamllint.description}



Description of the hook\. Used for metadata purposes only\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.entry {#opt-perSystem.pre-commit.settings.hooks.yamllint.entry}



The entry point - the executable to run\. ` entry ` can also contain arguments that will not be overridden, such as ` entry = "autopep8 -i"; `\.



*Type:*
string

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.exclude_types {#opt-perSystem.pre-commit.settings.hooks.yamllint.exclude_types}



List of file types to exclude\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.excludes {#opt-perSystem.pre-commit.settings.hooks.yamllint.excludes}



Exclude files that were matched by these patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.extraPackages {#opt-perSystem.pre-commit.settings.hooks.yamllint.extraPackages}



Additional packages required to run the hook\.

These are propagated to ` enabledPackages ` for constructing developer
environments\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.fail_fast {#opt-perSystem.pre-commit.settings.hooks.yamllint.fail_fast}



if true pre-commit will stop running hooks if this hook fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.files {#opt-perSystem.pre-commit.settings.hooks.yamllint.files}



The pattern of files to run on\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.id {#opt-perSystem.pre-commit.settings.hooks.yamllint.id}



The unique identifier for the hook\.

You do not need to set or modify this value\.

The ` id ` is used to reference a hook when using ` pre-commit run <id> `\.
It can also be used to reference the hook in other hooks’ ` before ` and ` after ` fields to define the order in which hooks run\.

The ` id ` is set to the attribute name the hook submodule is bound to in the parent module\.
For example, the ` id ` of following hook would be ` my-hook `\.

```nix
{
  hooks = {
    my-hook = {
      enable = true;
      entry = "my-hook";
    };
  }
}
```



*Type:*
string



*Default:*
` "the attribute name the hook submodule is bound to" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.language {#opt-perSystem.pre-commit.settings.hooks.yamllint.language}



The language of the hook - tells pre-commit how to install the hook\.



*Type:*
string



*Default:*
` "system" `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.name {#opt-perSystem.pre-commit.settings.hooks.yamllint.name}



The name of the hook\. Shown during hook execution\.



*Type:*
string



*Default:*
`` the attribute name the hook submodule is bound to, same as `id` ``

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.pass_filenames {#opt-perSystem.pre-commit.settings.hooks.yamllint.pass_filenames}



Whether to pass filenames as arguments to the entry point\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.raw {#opt-perSystem.pre-commit.settings.hooks.yamllint.raw}



Raw fields of a pre-commit hook\. This is mostly for internal use but
exposed in case you need to work around something\.

Default: taken from the other hook options\.



*Type:*
attribute set of unspecified value

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.require_serial {#opt-perSystem.pre-commit.settings.hooks.yamllint.require_serial}



if true this hook will execute using a single process instead of in parallel\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.settings\.configData {#opt-perSystem.pre-commit.settings.hooks.yamllint.settings.configData}



Serialized YAML object describing the configuration\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "{extends: relaxed, rules: {line-length: {max: 120}}}" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.settings\.configPath {#opt-perSystem.pre-commit.settings.hooks.yamllint.settings.configPath}



Path to a custom configuration file\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.settings\.configuration {#opt-perSystem.pre-commit.settings.hooks.yamllint.settings.configuration}



Multiline-string configuration passed as config file\. If set, configuration file set in ` yamllint.settings.configPath ` gets ignored\.



*Type:*
string



*Default:*
` "" `



*Example:*

```
''
  ---
  
  extends: relaxed
  
  rules:
    indentation: enable
''
```

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.settings\.format {#opt-perSystem.pre-commit.settings.hooks.yamllint.settings.format}



Format for parsing output\.



*Type:*
one of “parsable”, “standard”, “colored”, “github”, “auto”



*Default:*
` "auto" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.settings\.preset {#opt-perSystem.pre-commit.settings.hooks.yamllint.settings.preset}



The configuration preset to use\.



*Type:*
one of “default”, “relaxed”



*Default:*
` "default" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.settings\.strict {#opt-perSystem.pre-commit.settings.hooks.yamllint.settings.strict}



Return non-zero exit code on warnings as well as errors\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.stages {#opt-perSystem.pre-commit.settings.hooks.yamllint.stages}



Confines the hook to run at a particular stage\.



*Type:*
list of (one of “commit-msg”, “post-checkout”, “post-commit”, “post-merge”, “post-rewrite”, “pre-commit”, “pre-merge-commit”, “pre-push”, “pre-rebase”, “prepare-commit-msg”, “manual”, “commit”, “push”, “merge-commit”)



*Default:*
` default_stages `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.types {#opt-perSystem.pre-commit.settings.hooks.yamllint.types}



List of file types to run on\. See [Filtering files with types](https://pre-commit\.com/\#filtering-files-with-types)\.



*Type:*
list of string



*Default:*

```
[
  "file"
]
```

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.types_or {#opt-perSystem.pre-commit.settings.hooks.yamllint.types_or}



List of file types to run on, where only a single type needs to match\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.hooks\.yamllint\.verbose {#opt-perSystem.pre-commit.settings.hooks.yamllint.verbose}



forces the output of the hook to be printed even when the hook passes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [git-hooks-nix/modules/hook\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hook.nix)



## perSystem\.pre-commit\.settings\.install\.enable {#opt-perSystem.pre-commit.settings.install.enable}



Whether to enable automatic installation of pre-commit hooks\.

When set to false, hooks will not be installed into the git repository,
but all other module functionality (like configuration generation) will still work\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.installStages {#opt-perSystem.pre-commit.settings.installStages}



The stages to install the hooks to\.



*Type:*
list of (string or anything) *(read only)*



*Default:*
` [ ] `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.installationScript {#opt-perSystem.pre-commit.settings.installationScript}



A bash snippet that installs the git hooks in the current repository\.



*Type:*
string *(read only)*

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.rootSrc {#opt-perSystem.pre-commit.settings.rootSrc}



The source of the project to be checked\.

This is used in the derivation that performs the check\.

If you use the ` flakeModule `, the default is ` self.outPath `; the whole flake
sources\.



*Type:*
absolute path



*Default:*
` gitignoreSource config.src `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.run {#opt-perSystem.pre-commit.settings.run}



A derivation that tests whether the pre-commit hooks run cleanly on
the entire project\.



*Type:*
package



*Default:*
` <derivation> `

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.settings\.rust\.cargoManifestPath {#opt-perSystem.pre-commit.settings.settings.rust.cargoManifestPath}



Path to Cargo\.toml



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.settings\.rust\.check\.cargoDeps {#opt-perSystem.pre-commit.settings.settings.rust.check.cargoDeps}



Cargo dependencies needed to run the checks\.



*Type:*
null or (attribute set)



*Default:*
` null `



*Example:*
` "pkgs.rustPlatform.importCargoLock { lockFile = ./Cargo.lock; }" `

*Declared by:*
 - [git-hooks-nix/modules/hooks\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/hooks.nix)



## perSystem\.pre-commit\.settings\.shellHook {#opt-perSystem.pre-commit.settings.shellHook}



A shell hook that sets up the git hooks in a development shell\.

Pass to ` mkShell ` as ` shellHook ` to use\.



*Type:*
string *(read only)*

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.src {#opt-perSystem.pre-commit.settings.src}



Root of the project\. By default this will be filtered with the ` gitignoreSource `
function later, unless ` rootSrc ` is specified\.

If you use the ` flakeModule `, the default is ` self.outPath `; the whole flake
sources\.



*Type:*
absolute path

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.settings\.tools {#opt-perSystem.pre-commit.settings.tools}



Tool set from which ` nix-pre-commit-hooks ` will pick binaries\.

` nix-pre-commit-hooks ` comes with its own set of packages for this purpose\.



*Type:*
lazy attribute set of (null or package)



*Default:*

```
git-hooks.nix-pkgs.callPackage tools-dot-nix { inherit (pkgs) system; }

```

*Declared by:*
 - [git-hooks-nix/modules/pre-commit\.nix](https://github.com/cachix/git-hooks.nix/blob/master/modules/pre-commit.nix)



## perSystem\.pre-commit\.shellHook {#opt-perSystem.pre-commit.shellHook}



A shell hook that installs up the git hooks in a development shell\.



*Type:*
string *(read only)*



*Default:*
` bash statements `

*Declared by:*
 - [git-hooks-nix/flake-module\.nix](https://github.com/cachix/git-hooks.nix/blob/master/flake-module.nix)

