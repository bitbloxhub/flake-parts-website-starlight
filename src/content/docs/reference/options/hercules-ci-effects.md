---
title: hercules-ci-effects

---




This module provides
 - a mergeable `herculesCI` attribute; read by [Hercules CI](https://hercules-ci.com) and the [`hci`](https://docs.hercules-ci.com/hercules-ci-agent/hci/) command,
 - the [`hci-effects`](https://docs.hercules-ci.com/hercules-ci-effects/guide/import-or-pin/#_flakes_with_flake_parts) library as a module argument in `perSystem` / `withSystem`,
 - ready to go, configurable continuous deployment jobs


## Installation

To use these options, add to your flake inputs:

```nix
hercules-ci-effects.url = "github:hercules-ci/hercules-ci-effects";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.hercules-ci-effects.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## defaultEffectSystem {#opt-defaultEffectSystem}

The default system type that some integrations will use to run their effects on\.



*Type:*
string



*Default:*
` "x86_64-linux" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-helpers\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-helpers.nix)



## hercules-ci\.cargo-publish\.enable {#opt-hercules-ci.cargo-publish.enable}



Enable the cargo publish effect\.

This will perform a [` cargo publish `](https://doc\.rust-lang\.org/cargo/commands/cargo-publish\.html) [` --dry-run `](https://doc\.rust-lang\.org/cargo/commands/cargo-publish\.html\#publish-options) on every branch push, and a proper ` publish ` when a tag is pushed\.

Example usage:

```nix
hercules-ci.cargo-publish.enable = true;
hercules-ci.cargo-publish.secretName = "crates.io";
```

If you need more flexibility, you can use the [` cargoPublish `](https://docs\.hercules-ci\.com/hercules-ci-effects/reference/nix-functions/cargopublish) effect function directly\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [hercules-ci-effects/effects/cargo/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/cargo/flake-module.nix)



## hercules-ci\.cargo-publish\.assertVersions {#opt-hercules-ci.cargo-publish.assertVersions}



Whether to check that all package versions match the git tag\.

When ` true `, all packages in the workspace must have a version
matching the tag name\. When ` false `, no version checking is performed\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [hercules-ci-effects/effects/cargo/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/cargo/flake-module.nix)



## hercules-ci\.cargo-publish\.extraPublishArgs {#opt-hercules-ci.cargo-publish.extraPublishArgs}



Extra arguments to pass to ` cargo publish `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [hercules-ci-effects/effects/cargo/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/cargo/flake-module.nix)



## hercules-ci\.cargo-publish\.registryURL {#opt-hercules-ci.cargo-publish.registryURL}



The URL of the custom registry to use for publishing\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [hercules-ci-effects/effects/cargo/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/cargo/flake-module.nix)



## hercules-ci\.cargo-publish\.secretName {#opt-hercules-ci.cargo-publish.secretName}



The name of the secret containing the token for the registry\.



*Type:*
string

*Declared by:*
 - [hercules-ci-effects/effects/cargo/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/cargo/flake-module.nix)



## hercules-ci\.cargo-publish\.src {#opt-hercules-ci.cargo-publish.src}



The path to the source code to publish\.



*Type:*
absolute path



*Default:*
` self.outPath `

*Declared by:*
 - [hercules-ci-effects/effects/cargo/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/cargo/flake-module.nix)



## hercules-ci\.flake-update\.enable {#opt-hercules-ci.flake-update.enable}



Whether to create a scheduled flake update job\.

For a complete example, see [the hercules-ci-effects documentation on ` hercules-ci.flake-update `](https://docs\.hercules-ci\.com/hercules-ci-effects/reference/flake-parts/flake-update/)\.

*Requires hercules-ci-agent 0\.9\.8 or newer\.*



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.autoMergeMethod {#opt-hercules-ci.flake-update.autoMergeMethod}



Whether to enable auto-merge on new pull requests, and how to merge it\.

This requires [GitHub branch protection](https://docs\.github\.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches) to be configured for the repository\.



*Type:*
one of \<null>, “merge”, “rebase”, “squash”



*Default:*
` null `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.baseBranch {#opt-hercules-ci.flake-update.baseBranch}



Branch name on the remote that the update branch will be

 - based on (via ` hercules-ci.flake-update.baseMerge.branch `), and
 - merged back into if ` hercules-ci.flake-update.createPullRequest ` is enabled\.

` "HEAD" ` refers to the default branch, which is often ` main ` or ` master `\.



*Type:*
string



*Default:*
` "HEAD" `



*Example:*
` "develop" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.baseMerge\.enable {#opt-hercules-ci.flake-update.baseMerge.enable}



Whether to update an existing update branch with changes from the base branch before running the update\.

This option only applies when the update branch already exists from a previous run\.
The existing branch is likely stale, so enabling this ensures it includes recent changes from the base branch\.

If disabled and the update branch exists, the update will run from the branch’s current state,
which may be missing recent changes from the base branch\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.baseMerge\.branch {#opt-hercules-ci.flake-update.baseMerge.branch}



Branch name on the remote to update the existing update branch from\.

Typically this should be the same as the target branch for pull requests\.
Used when ` hercules-ci.flake-update.baseMerge.enable ` is true and the update branch exists\.



*Type:*
string



*Default:*
` hercules-ci.flake-update.baseBranch `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.baseMerge\.method {#opt-hercules-ci.flake-update.baseMerge.method}



How to merge the base branch into the update branch before running the update\.

 - ` "merge" `: Create a merge commit, preserving the branch history\.
 - ` "rebase" `: Rebase the update branch commits onto the base branch\.
 - ` "fast-forward" `: Fast-forward the update branch to the base branch if possible, otherwise fail\.
 - ` "reset" `: Always discard the existing update branch and start fresh from the base branch\.
   Any manual changes to the update branch will be lost\.

The ` "fast-forward" ` method is the most conservative, equivalent to deleting the stale
update branch and recreating it from the base branch\.

Used when ` hercules-ci.flake-update.baseMerge.enable ` is true\.



*Type:*
one of “merge”, “rebase”, “fast-forward”, “reset”



*Default:*
` "merge" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.createPullRequest {#opt-hercules-ci.flake-update.createPullRequest}



Whether to create a pull request for the updated ` flake.lock `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.effect\.settings {#opt-hercules-ci.flake-update.effect.settings}



A module that extends the flake-update effect arbitrarily\.

See also:

 - [Effect Modules / Core Options](https://docs\.hercules-ci\.com/hercules-ci-effects/reference/effect-modules/core)
 - [Effect Modules / Git Options](https://docs\.hercules-ci\.com/hercules-ci-effects/reference/effect-modules/git)



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.effect\.system {#opt-hercules-ci.flake-update.effect.system}



The [system](https://nixos\.org/manual/nix/stable/command-ref/conf-file\.html\#conf-system) on which to run the flake update job\.



*Type:*
string



*Default:*
` config.defaultEffectSystem `



*Example:*
` "aarch64-linux" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.flakes {#opt-hercules-ci.flake-update.flakes}



Flakes to update\.

The attribute names refer to the relative paths where the flakes/subflakes are located in the repository\.

The values specify further details about how to update the lock\. See the sub-options for details\.

NOTE: If you provide a definition for this option, it does *not* extend the default\. You must specify all flakes you want to update, including the project root (` "." `) if applicable\.



*Type:*
attribute set of (submodule)



*Default:*

```
{
  "." = { };
}
```



*Example:*

```
{
  "." = {
    commitSummary = "/flake.lock: Update";
  };
  "path/to/subflake" = {
    inputs = [
      "nixpkgs"
    ];
  };
}
```

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.flakes\.\<name>\.commitSummary {#opt-hercules-ci.flake-update.flakes._name_.commitSummary}



Summary for commit\. “” means to use the default\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "chore: update flake inputs" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.flakes\.\<name>\.inputs {#opt-hercules-ci.flake-update.flakes._name_.inputs}



Flake inputs to update\. The default, ` [] ` means to update all inputs\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*
` "[\"nixpkgs\" \"nixpkgs-unstable\"]" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.forgeType {#opt-hercules-ci.flake-update.forgeType}



The type of Git server commited to\.



*Type:*
string



*Default:*
` "github" `



*Example:*
` "gitlab" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.nix\.package {#opt-hercules-ci.flake-update.nix.package}



The Nix package to use for performing the lockfile updates\.

The function arguments are the module arguments of ` perSystem ` for ` hercules-ci.flake-update.effect.system `\.



*Type:*
function that evaluates to a(n) package



*Default:*
` { pkgs, ... }: pkgs.nix `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.pullRequestBody {#opt-hercules-ci.flake-update.pullRequestBody}



The body of the pull request being made



*Type:*
null or string



*Default:*

````
''
  Update `flake.lock`. See the commit message(s) for details.
  
  You may reset this branch by deleting it and re-running the update job.
  
      git push origin :flake-update
''
````



*Example:*
` "updated flake.lock" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.pullRequestTitle {#opt-hercules-ci.flake-update.pullRequestTitle}



The title of the pull request being made



*Type:*
string



*Default:*
`` "`flake.lock`: Update" ``



*Example:*
` "chore: update flake.lock" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.updateBranch {#opt-hercules-ci.flake-update.updateBranch}



To which branch to push the updated ` flake lock `\.



*Type:*
string



*Default:*
` "flake-update" `



*Example:*
` "update" `

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.flake-update\.when {#opt-hercules-ci.flake-update.when}



See [` herculesCI.onSchedule.<name>.when `](\#opt-herculesCI\.onSchedule\._name_\.when) for details\.



*Type:*
raw value

*Declared by:*
 - [hercules-ci-effects/effects/flake-update/flake-module\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/effects/flake-update/flake-module.nix)



## hercules-ci\.github-pages\.branch {#opt-hercules-ci.github-pages.branch}



A GitHub Pages deployment will be triggered when changes are pushed to this branch\.

A non-null value enables the effect\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-pages\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-pages.nix)



## hercules-ci\.github-pages\.check\.enable {#opt-hercules-ci.github-pages.check.enable}



Whether to make sure that the effect is buildable\. This adds
` checks.${config.defaultEffectSystem}.gh-pages ` to ` onPush.default `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-pages\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-pages.nix)



## hercules-ci\.github-pages\.pushJob {#opt-hercules-ci.github-pages.pushJob}



The Hercules CI job in which to perform the deployment\.

By default the GitHub pages deployment is triggered by the ` onPush.default ` job,
so that the deployment only proceeds when the default builds are successful\.



*Type:*
string



*Default:*
` "default" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-pages\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-pages.nix)



## hercules-ci\.github-pages\.settings {#opt-hercules-ci.github-pages.settings}



Modular settings for the GitHub Pages effect\.

For system-dependent settings, define [` perSystem.hercules-ci.github-pages.settings `](\#opt-perSystem\.hercules-ci\.github-pages\.settings) instead\.

See [` gitWriteBranch `](https://docs\.hercules-ci\.com/hercules-ci-effects/reference/nix-functions/gitWriteBranch\.html\#effect_options) for options\.



*Type:*
module



*Example:*

```
{
  message = "Update GitHub Pages";
}

```

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-pages\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-pages.nix)



## hercules-ci\.github-releases\.checkArtifacts {#opt-hercules-ci.github-releases.checkArtifacts}



Condition under which to check whether artifacts can be built\.



*Type:*
function that evaluates to a(n) boolean



*Default:*
` _: true `

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.condition {#opt-hercules-ci.github-releases.condition}



Condition under which a release is going to be pushed\.
This is a function accepting [HerculesCI parameters](https://docs\.hercules-ci\.com/hercules-ci-agent/evaluation\#params-herculesCI)
and returning boolean\.
By default, pushing happens if a tag is present\.



*Type:*
function that evaluates to a(n) boolean



*Default:*

```
{ tag, ... }: tag != null

```

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.files {#opt-hercules-ci.github-releases.files}



List of asset files or archives\.

Each entry must be either an attribute set of type

 - ` { label: string, path: string } ` for a single file, or
 - ` { label: string, paths: [string], archiver: 'zip' } ` for an archive\.

In case of archive, ` paths ` may contain directories: their *contents* will be archived recursively\.



*Type:*
list of (submodule)



*Default:*
` [] `



*Example:*

```
[
  {
    label = "api.json";
    path = withSystem "x86_64-linux" ({config, ...}: config.packages.api-json);
  }
  {
    label = "api-docs.zip";
    paths = withSystem "x86_64-linux" ({config, ...}: [ config.packages.api-docs ]);
    archiver = "zip";
  }
]

```

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.files\.\*\.archiver {#opt-hercules-ci.github-releases.files._.archiver}



The archiver to use for the archive\.

This must be set when ` paths ` is set\.



*Type:*
value “zip” (singular enum)



*Default:*
*(unset)*

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.files\.\*\.label {#opt-hercules-ci.github-releases.files._.label}



Label of the asset file or archive\.

This is the name that will be used in the GitHub release\.



*Type:*
string

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.files\.\*\.path {#opt-hercules-ci.github-releases.files._.path}



Path to the asset file\. Must not be a directory\. Mutually exclusive with ` paths `\.



*Type:*
absolute path

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.files\.\*\.paths {#opt-hercules-ci.github-releases.files._.paths}



Paths to the asset files\.
Mutually exclusive with ` path `\.

Directories are allowed, and their contents will be archived recursively\.



*Type:*
list of absolute path

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.filesPerSystem {#opt-hercules-ci.github-releases.filesPerSystem}



List of asset files or archives for each system\.

The arguments passed are the same as those passed to ` perSystem ` modules\.

The function is invoked for each of the [` systems `](\#opt-hercules-ci\.github-releases\.systems)\. The returned labels must be unique across invocations\. This generally means that you have to include the ` system ` value in the attribute names\.

NOTE: If you are implementing generic logic, consider placing the function in a ` mkIf `, so that the function remains undefined in cases where it is statically known to produce no files\. When ` filesPerSystem ` has no definitions, a traversal of potentially many ` perSystems ` modules is avoided\.



*Type:*
function that evaluates to a(n) list of (submodule)



*Example:*

```
{ system, config, ... }: [
  {
    label = "foo-static-${system}";
    path = lib.getExe config.packages.foo-static;
  }
]

```

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.filesPerSystem\.\<function body>\.\*\.archiver {#opt-hercules-ci.github-releases.filesPerSystem._function_body_._.archiver}



The archiver to use for the archive\.

This must be set when ` paths ` is set\.



*Type:*
value “zip” (singular enum)



*Default:*
*(unset)*

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.filesPerSystem\.\<function body>\.\*\.label {#opt-hercules-ci.github-releases.filesPerSystem._function_body_._.label}



Label of the asset file or archive\.

This is the name that will be used in the GitHub release\.



*Type:*
string

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.filesPerSystem\.\<function body>\.\*\.path {#opt-hercules-ci.github-releases.filesPerSystem._function_body_._.path}



Path to the asset file\. Must not be a directory\. Mutually exclusive with ` paths `\.



*Type:*
absolute path

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.filesPerSystem\.\<function body>\.\*\.paths {#opt-hercules-ci.github-releases.filesPerSystem._function_body_._.paths}



Paths to the asset files\.
Mutually exclusive with ` path `\.

Directories are allowed, and their contents will be archived recursively\.



*Type:*
list of absolute path

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.pushJobName {#opt-hercules-ci.github-releases.pushJobName}



Name of the Hercules CI job in which to perform the deployment\.
By default the GitHub pages deployment is triggered by the ` onPush.default ` job,
so that the deployment only proceeds when the default builds are successful\.



*Type:*
string



*Default:*
` default `

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.releaseTag {#opt-hercules-ci.github-releases.releaseTag}



Tag to be assigned to the release\.



*Type:*
function that evaluates to a(n) string



*Default:*
` herculesCI: herculesCI.config.repo.tag `

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## hercules-ci\.github-releases\.systems {#opt-hercules-ci.github-releases.systems}



List of systems for which to call [` filesPerSystem `](\#opt-hercules-ci\.github-releases\.filesPerSystem)\.



*Type:*
null or (list of string)



*Default:*
` null `, which means that [` herculesCI.ciSystems `](\#opt-herculesCI\.ciSystems) will be used\.

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-releases](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-releases)



## herculesCI {#opt-herculesCI}



Hercules CI environment and configuration\. See the sub-options for details\.

This module represents a function\. Hercules CI calls this function to provide expressions in the flake with extra information, such as repository and job metadata\.

While this attribute feels a lot like a submodule, it can not be queried by definitions outside of ` herculesCI `\. This is required by the design of flakes: evaluation of the standard flake attribute values is hermetic\.

Data that is unique to Hercules CI (as opposed to the flake itself) is provided by in the sub-options of ` herculesCI `\. This is syntactically different from the [native ` herculesCI ` attribute interface](https://docs\.hercules-ci\.com/hercules-ci-agent/evaluation\#params-herculesCI)\. For example, instead of ` { primaryRepo, ... }: ... primaryRepo.ref `, you would write ` { config, ... }: ... config.repo.ref `\.

See e\.g\. [` ref `](\#opt-herculesCI\.repo\.ref)\.



*Type:*
module

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-helpers\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-helpers.nix)
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.ciSystems {#opt-herculesCI.ciSystems}



Flake systems for which to generate attributes in ` herculesCI.onPush.default.outputs `\.



*Type:*
list of string



*Default:*
` config.systems  # from flake parts `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.onPush {#opt-herculesCI.onPush}



This declares what to do when a Git ref is updated, such as when you push a commit or after you merge a pull request\.

By default ` onPush.default ` defines a job that builds the known flake output attributes\.
It can be disabled by setting ` onPush.default.enable = false; `\.

The name of the job (from ` onPush.<name> `) will be used as part of the commit status of the resulting job\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.onPush\.\<name>\.outputs {#opt-herculesCI.onPush._name_.outputs}



A collection of builds and effects\. These may be nested recursively into attribute sets\.

Hercules CI’s traversal of nested sets can be cancelled with ` lib.dontRecurseIntoAttrs `\.

See the parent option for details about when the job runs\.



*Type:*
a tree of attribute sets and derivations

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.onSchedule {#opt-herculesCI.onSchedule}



*Since hercules-ci-agent 0\.9\.8*

Behaves similar to onPush, but is responsible for jobs that respond to the passing of time rather than to a git push or equivalent\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.onSchedule\.\<name>\.outputs {#opt-herculesCI.onSchedule._name_.outputs}



A collection of builds and effects\. These may be nested recursively into attribute sets\.

Hercules CI’s traversal of nested sets can be cancelled with ` lib.dontRecurseIntoAttrs `\.

See the parent option for details about when the job runs\.



*Type:*
a tree of attribute sets and derivations

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.onSchedule\.\<name>\.when {#opt-herculesCI.onSchedule._name_.when}



The time at which to schedule a job\.

Each subattribute represents an equality, all of which will hold at the next planned time\. The time zone is UTC\.

The ` minute ` or ` hour ` attributes can be omitted, in which case Hercules CI will pick an arbitrary time for you\.

See the ` when.* ` options below for details\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.onSchedule\.\<name>\.when\.dayOfMonth {#opt-herculesCI.onSchedule._name_.when.dayOfMonth}



An optional list of day of the month during which to create a job\.

The default value ` null ` represents all days\.



*Type:*
null or ((list of integer between 0 and 31 (both inclusive)) or integer between 0 and 31 (both inclusive) convertible to it)



*Default:*
` null `

*Declared by:*
 - [hercules-ci-effects/flake-modules/types/when\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/types/when.nix)



## herculesCI\.onSchedule\.\<name>\.when\.dayOfWeek {#opt-herculesCI.onSchedule._name_.when.dayOfWeek}



An optional list of week days during which to create a job\.

The default value ` null ` represents all days\.



*Type:*
null or ((list of (one of “Mon”, “Tue”, “Wed”, “Thu”, “Fri”, “Sat”, “Sun”)) or (one of “Mon”, “Tue”, “Wed”, “Thu”, “Fri”, “Sat”, “Sun”) convertible to it)



*Default:*
` null `

*Declared by:*
 - [hercules-ci-effects/flake-modules/types/when\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/types/when.nix)



## herculesCI\.onSchedule\.\<name>\.when\.hour {#opt-herculesCI.onSchedule._name_.when.hour}



An optional integer representing the hours at which a job should be created\.

The default value ` null ` represents an arbitrary hour\.



*Type:*
null or ((list of integer between 0 and 23 (both inclusive)) or integer between 0 and 23 (both inclusive) convertible to it)



*Default:*
` null `

*Declared by:*
 - [hercules-ci-effects/flake-modules/types/when\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/types/when.nix)



## herculesCI\.onSchedule\.\<name>\.when\.minute {#opt-herculesCI.onSchedule._name_.when.minute}



An optional integer representing the minute mark at which a job should be created\.

The default value ` null ` represents an arbitrary minute\.



*Type:*
null or integer between 0 and 59 (both inclusive)



*Default:*
` null `

*Declared by:*
 - [hercules-ci-effects/flake-modules/types/when\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/types/when.nix)



## herculesCI\.repo {#opt-herculesCI.repo}



The repository and checkout metadata of the current checkout, provided by Hercules CI\.
These options are read-only\.

You may read options by querying the ` config ` module argument\.



*Type:*
submodule *(read only)*

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.branch {#opt-herculesCI.repo.branch}



The branch of the checkout\. ` null ` when not on a branch; e\.g\. when on a tag\.



*Type:*
null or string *(read only)*



*Example:*
` "main" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.forgeType {#opt-herculesCI.repo.forgeType}



What forge implementation hosts the repository\.

E\.g\. “github” or “gitlab”

*Since hercules-ci-agent 0\.9\.8*



*Type:*
string *(read only)*



*Default:*



*Example:*
` "github" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.name {#opt-herculesCI.repo.name}



The name of the repository\.

*Since hercules-ci-agent 0\.9\.8*



*Type:*
string *(read only)*



*Default:*

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.owner {#opt-herculesCI.repo.owner}



The owner of the repository\.

*Since hercules-ci-agent 0\.9\.8*



*Type:*
string *(read only)*



*Default:*

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.ref {#opt-herculesCI.repo.ref}



The git “ref” of the checkout\.



*Type:*
string *(read only)*



*Example:*
` "refs/heads/main" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.remoteHttpUrl {#opt-herculesCI.repo.remoteHttpUrl}



HTTP url for cloning the repository\.

*Since hercules-ci-agent 0\.9\.8*



*Type:*
string *(read only)*



*Default:*

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.remoteSshUrl {#opt-herculesCI.repo.remoteSshUrl}



SSH url for cloning the repository\.

*Since hercules-ci-agent 0\.9\.8*



*Type:*
string *(read only)*



*Default:*

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.rev {#opt-herculesCI.repo.rev}



The git revision, also known as the commit hash\.



*Type:*
string *(read only)*



*Example:*
` "17ae1f614017447a983c34bb046892b3c571df52" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.shortRev {#opt-herculesCI.repo.shortRev}



An abbreviated ` rev `\.



*Type:*
string *(read only)*



*Example:*
` "17ae1f6" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.tag {#opt-herculesCI.repo.tag}



The tag of the checkout\. ` null ` when not on a tag; e\.g\. when on a branch\.



*Type:*
null or string *(read only)*



*Example:*
` "1.0" `

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## herculesCI\.repo\.webUrl {#opt-herculesCI.repo.webUrl}



A URL to open the repository in the browser\.

*Since hercules-ci-agent 0\.9\.8*



*Type:*
string *(read only)*



*Default:*

*Declared by:*
 - [hercules-ci-effects/flake-modules/herculesCI-attribute\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/herculesCI-attribute.nix)



## perSystem\.hercules-ci\.github-pages\.settings {#opt-perSystem.hercules-ci.github-pages.settings}



Modular settings for the GitHub Pages effect\.

See [` gitWriteBranch `](https://docs\.hercules-ci\.com/hercules-ci-effects/reference/nix-functions/gitWriteBranch\.html\#effect_options) for options\.



*Type:*
module



*Example:*

```
{
  contents = config.packages.docs + "/share/doc/mypkg/html";
}

```

*Declared by:*
 - [hercules-ci-effects/flake-modules/github-pages\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/github-pages.nix)



## perSystem\.herculesCIEffects\.pkgs {#opt-perSystem.herculesCIEffects.pkgs}



Nixpkgs instance to use for ` hercules-ci-effects `\.

The effects functions, etc, will be provided as the ` effects ` module argument of ` perSystem `\.



*Type:*
raw value



*Default:*
` pkgs ` (module argument)

*Declared by:*
 - [hercules-ci-effects/flake-modules/module-argument\.nix](https://github.com/hercules-ci/hercules-ci-effects/blob/master/flake-modules/module-argument.nix)

