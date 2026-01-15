---
title: github-actions-nix

---




This module generates GitHub Actions workflow files from type-safe Nix configurations. Unlike
[`actions.nix`](actions-nix.html), it works as a standalone flake-parts module without tying you to other
modules while still letting you define workflows as Nix attribute sets that get converted to YAML files
for .github/workflows/.


## Installation

To use these options, add to your flake inputs:

```nix
github-actions-nix.url = "github:synapdeck/github-actions-nix";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.github-actions-nix.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.githubActions\.enable {#opt-perSystem.githubActions.enable}

Whether to generate GitHub Actions workflows from Nix configuration\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflowFiles {#opt-perSystem.githubActions.workflowFiles}



Individual workflow files as derivations\.
Keys are workflow names (without \.yml extension)\.
Only populated when ` enable = true `\.



*Type:*
attribute set of package *(read only)*

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows {#opt-perSystem.githubActions.workflows}



GitHub Actions workflows to generate\. Keys are workflow file names
(without the \.yml extension)\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  ci = {
    name = "CI";
    on = ["push" "pull_request"];
    jobs = {
      build = {
        runsOn = "ubuntu-latest";
        steps = [
          {
            uses = "actions/checkout@v4";
          }
          {
            name = "Build";
            run = "npm run build";
          }
        ];
      };
    };
  };
}

```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.concurrency {#opt-perSystem.githubActions.workflows._name_.concurrency}



Concurrency control for the workflow\.



*Type:*
null or string or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults {#opt-perSystem.githubActions.workflows._name_.defaults}



Default settings for all jobs in the workflow\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.job {#opt-perSystem.githubActions.workflows._name_.defaults.job}



Default job configuration\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.job\.continueOnError {#opt-perSystem.githubActions.workflows._name_.defaults.job.continueOnError}



Default continue-on-error setting for all jobs\.



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.job\.env {#opt-perSystem.githubActions.workflows._name_.defaults.job.env}



Default environment variables for all jobs\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  NODE_ENV = "production";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.job\.permissions {#opt-perSystem.githubActions.workflows._name_.defaults.job.permissions}



Default permissions for all jobs\.



*Type:*
null or one of “read-all”, “write-all” or attribute set of (one of “read”, “write”, “none”)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.job\.runsOn {#opt-perSystem.githubActions.workflows._name_.defaults.job.runsOn}



Default runner for all jobs\.



*Type:*
null or string or list of string



*Default:*
` null `



*Example:*
` "ubuntu-latest" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.job\.timeoutMinutes {#opt-perSystem.githubActions.workflows._name_.defaults.job.timeoutMinutes}



Default timeout in minutes for all jobs\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 60 `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.run {#opt-perSystem.githubActions.workflows._name_.defaults.run}



Default run configuration\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.run\.shell {#opt-perSystem.githubActions.workflows._name_.defaults.run.shell}



Default shell for run steps\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.defaults\.run\.workingDirectory {#opt-perSystem.githubActions.workflows._name_.defaults.run.workingDirectory}



Default working directory\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.env {#opt-perSystem.githubActions.workflows._name_.env}



Environment variables for all jobs in the workflow\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  NODE_ENV = "production";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs {#opt-perSystem.githubActions.workflows._name_.jobs}



Jobs to run in the workflow\. Keys are job IDs\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.concurrency {#opt-perSystem.githubActions.workflows._name_.jobs._name_.concurrency}



Concurrency control for the job\.



*Type:*
null or string or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.container {#opt-perSystem.githubActions.workflows._name_.jobs._name_.container}



Container to run the job in\. Can be a string image name or detailed configuration\.



*Type:*
null or string or (submodule)



*Default:*
` null `



*Example:*
` "node:20" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.continueOnError {#opt-perSystem.githubActions.workflows._name_.jobs._name_.continueOnError}



Whether to allow the workflow to continue if this job fails\.



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.defaults {#opt-perSystem.githubActions.workflows._name_.jobs._name_.defaults}



Default settings for all steps in the job\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.defaults\.run {#opt-perSystem.githubActions.workflows._name_.jobs._name_.defaults.run}



Default run configuration\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.defaults\.run\.shell {#opt-perSystem.githubActions.workflows._name_.jobs._name_.defaults.run.shell}



Default shell for run steps\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.defaults\.run\.workingDirectory {#opt-perSystem.githubActions.workflows._name_.jobs._name_.defaults.run.workingDirectory}



Default working directory\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.env {#opt-perSystem.githubActions.workflows._name_.jobs._name_.env}



Environment variables for all steps in the job\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  NODE_ENV = "production";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.environment {#opt-perSystem.githubActions.workflows._name_.jobs._name_.environment}



Environment that the job references\. Can be a string name or object with name and url\.



*Type:*
null or string or (submodule)



*Default:*
` null `



*Example:*
` "production" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.if_ {#opt-perSystem.githubActions.workflows._name_.jobs._name_.if_}



Conditional expression to determine if the job should run\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "github.event_name == 'push'" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.name {#opt-perSystem.githubActions.workflows._name_.jobs._name_.name}



Display name for the job\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "Build and Test" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.needs {#opt-perSystem.githubActions.workflows._name_.jobs._name_.needs}



Jobs that must complete successfully before this job runs\.



*Type:*
null or string or list of string



*Default:*
` null `



*Example:*

```
[
  "build"
  "lint"
]
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.outputs {#opt-perSystem.githubActions.workflows._name_.jobs._name_.outputs}



Output variables that can be used by dependent jobs\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  version = "\${{ steps.get-version.outputs.version }}";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.permissions {#opt-perSystem.githubActions.workflows._name_.jobs._name_.permissions}



Permissions for the GITHUB_TOKEN in this job\.



*Type:*
null or one of “read-all”, “write-all” or attribute set of (one of “read”, “write”, “none”)



*Default:*
` null `



*Example:*

```
{
  contents = "read";
  pull-requests = "write";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.runsOn {#opt-perSystem.githubActions.workflows._name_.jobs._name_.runsOn}



The type of runner to use\. Can be:

 - A single string: “ubuntu-latest”
 - A list: \[“self-hosted”, “linux”]
 - An object with group/labels: { group = “my-group”; labels = “ubuntu-latest”; }



*Type:*
null or string or (list of string) or (submodule)



*Default:*
` null `



*Example:*
` "ubuntu-latest" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.secrets {#opt-perSystem.githubActions.workflows._name_.jobs._name_.secrets}



Secrets to pass to a reusable workflow\. Can be:

 - “inherit” to pass all secrets
 - An attribute set mapping secret names to values



*Type:*
null or value “inherit” (singular enum) or attribute set of string



*Default:*
` null `



*Example:*

```
{
  access-token = "\${{ secrets.PERSONAL_ACCESS_TOKEN }}";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.services {#opt-perSystem.githubActions.workflows._name_.jobs._name_.services}



Service containers to run alongside the job\.



*Type:*
null or (attribute set of (string or (submodule)))



*Default:*
` null `



*Example:*

```
{
  redis = {
    image = "redis:latest";
    ports = [
      "6379"
    ];
  };
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.snapshot {#opt-perSystem.githubActions.workflows._name_.jobs._name_.snapshot}



Generate a custom runner image\. Can be a string or configuration object\.



*Type:*
null or string or attribute set of anything



*Default:*
` null `



*Example:*
` "my-custom-image" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps}



List of steps to run in the job\.



*Type:*
list of (submodule)



*Default:*
` [ ] `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.continueOnError {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.continueOnError}



Whether to allow the job to continue if this step fails\.



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.env {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.env}



Environment variables for the step\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  NODE_ENV = "production";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.id {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.id}



Unique identifier for the step\. Can be used to reference the step
in later steps via ` steps.<id>.outputs.<name> `\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "build-step" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.if_ {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.if_}



Conditional expression to determine if the step should run\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "success()" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.name {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.name}



Display name for the step\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "Build project" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.run {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.run}



Shell command to run\. Mutually exclusive with ` uses `\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "npm run build" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.shell {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.shell}



Shell to use for the step\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "bash" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.timeoutMinutes {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.timeoutMinutes}



Maximum time in minutes to run the step before killing it\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 10 `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.uses {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.uses}



Action to use\. Mutually exclusive with ` run `\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "actions/checkout@v4" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.with_ {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.with_}



Input parameters for the action specified in ` uses `\.
Can include regular action inputs or Docker-specific options (args, entrypoint)\.



*Type:*
null or (open submodule of attribute set of (string or signed integer or boolean))



*Default:*
` null `



*Example:*

```
{
  fetch-depth = 0;
  node-version = "20";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.with_\.args {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.with_.args}



Arguments for Docker container actions\.
Passed to the container’s ENTRYPOINT\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "The \${{ github.event_name }} event triggered this step." `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.with_\.entrypoint {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.with_.entrypoint}



Override the Docker ENTRYPOINT in the Dockerfile\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "/a/different/executable" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.workingDirectory {#opt-perSystem.githubActions.workflows._name_.jobs._name_.steps._.workingDirectory}



Working directory for the step\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "./packages/web" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.strategy {#opt-perSystem.githubActions.workflows._name_.jobs._name_.strategy}



Strategy for running the job with different configurations\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.strategy\.failFast {#opt-perSystem.githubActions.workflows._name_.jobs._name_.strategy.failFast}



Whether to cancel all in-progress jobs if any matrix job fails\.



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.strategy\.matrix {#opt-perSystem.githubActions.workflows._name_.jobs._name_.strategy.matrix}



Matrix strategy for running the job with different configurations\.



*Type:*
null or (open submodule of attribute set of list of anything)



*Default:*
` null `



*Example:*

```
{
  node-version = [
    "18"
    "20"
  ];
  os = [
    "ubuntu-latest"
    "windows-latest"
  ];
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.strategy\.matrix\.exclude {#opt-perSystem.githubActions.workflows._name_.jobs._name_.strategy.matrix.exclude}



Matrix configurations to exclude\.
Partial matches will be excluded from the matrix\.



*Type:*
null or (list of attribute set of anything)



*Default:*
` null `



*Example:*

```
[
  {
    node = 14;
    os = "macos-latest";
  }
]
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.strategy\.matrix\.include {#opt-perSystem.githubActions.workflows._name_.jobs._name_.strategy.matrix.include}



Additional matrix configurations to include\.
Each item adds or expands matrix combinations\.



*Type:*
null or (list of attribute set of anything)



*Default:*
` null `



*Example:*

```
[
  {
    node = 16;
    npm = 6;
    os = "windows-latest";
  }
]
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.strategy\.maxParallel {#opt-perSystem.githubActions.workflows._name_.jobs._name_.strategy.maxParallel}



Maximum number of jobs that can run simultaneously when using a matrix\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.timeoutMinutes {#opt-perSystem.githubActions.workflows._name_.jobs._name_.timeoutMinutes}



Maximum time in minutes to run the job before killing it\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 60 `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.uses {#opt-perSystem.githubActions.workflows._name_.jobs._name_.uses}



Location and version of a reusable workflow file to run as a job\.
Format: {owner}/{repo}/\.github/workflows/{filename}@{ref}



*Type:*
null or string



*Default:*
` null `



*Example:*
` "octo-org/example-repo/.github/workflows/deploy.yml@main" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.jobs\.\<name>\.with_ {#opt-perSystem.githubActions.workflows._name_.jobs._name_.with_}



Map of inputs to pass to a reusable workflow (when using ‘uses’)\.



*Type:*
null or (attribute set of (string or signed integer or boolean))



*Default:*
` null `



*Example:*

```
{
  environment = "production";
  username = "mona";
}
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.name {#opt-perSystem.githubActions.workflows._name_.name}



Workflow name\.



*Type:*
string



*Example:*
` "CI" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.on {#opt-perSystem.githubActions.workflows._name_.on}



Events that trigger the workflow\. Can be a list of event names
or a detailed configuration object\.



*Type:*
(list of string) or (list of string) or (submodule)



*Example:*

```
[
  "push"
  "pull_request"
]
```

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.permissions {#opt-perSystem.githubActions.workflows._name_.permissions}



Default permissions for all jobs in the workflow\.



*Type:*
null or one of “read-all”, “write-all” or attribute set of (one of “read”, “write”, “none”)



*Default:*
` null `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflows\.\<name>\.runName {#opt-perSystem.githubActions.workflows._name_.runName}



The name for workflow runs generated from the workflow\.
Can include expressions and reference github and inputs contexts\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "Deploy to \${{ inputs.deploy_target }} by @\${{ github.actor }}" `

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)



## perSystem\.githubActions\.workflowsDir {#opt-perSystem.githubActions.workflowsDir}



Generated \.github/workflows directory as a derivation\.
Contains all workflow files defined in the configuration\.
Only populated when ` enable = true `\.



*Type:*
package *(read only)*

*Declared by:*
 - [github-actions-nix/modules/github-ci\.nix](https://github.com/synapdeck/github-actions-nix/modules/github-ci.nix)

