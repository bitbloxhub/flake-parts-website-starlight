---
title: actions.nix

---




[`actions-nix`](https://github.com/nialov/actions.nix) is a nix
module that converts `nix` configuration into GitHub/Gitea action
syntax `yaml`. Use `nix` for workflow definition instead of `yaml`.


## Installation

To use these options, add to your flake inputs:

```nix
actions-nix.url = "github:nialov/actions.nix";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.actions-nix.flakeModules.default
];
```

Run `nix flake lock` and you're set.

## Options

## flake\.actions-nix {#opt-flake.actions-nix}

Configuration of actions\.



*Type:*
submodule

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix)



## flake\.actions-nix\.defaultValues\.jobs\.runs-on {#opt-flake.actions-nix.defaultValues.jobs.runs-on}



Default value for runs-on for jobs\.



*Type:*
string



*Default:*
` "ubuntu-latest" `



*Example:*
` "macos-latest" `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.defaultValues\.jobs\.timeout-minutes {#opt-flake.actions-nix.defaultValues.jobs.timeout-minutes}



Default value for timeout-minutes for jobs\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 60 `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.pre-commit\.enable {#opt-flake.actions-nix.pre-commit.enable}



Whether to enable pre-commit generation of workflow yaml files\.

The pre-commit hook, generated using
[git-hooks\.nix](https://github\.com/cachix/git-hooks\.nix), converts
` flake.actions-nix.workflows ` configuration into respective workflow
files in the path defined within the configuration, i\.e\. key in
` actions-nix.workflows ` attribute set
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows {#opt-flake.actions-nix.workflows}



Attributes where key is the file in which you want the ` yaml `
configuration and the value is the workflow definition attribute set
in ` nix `\. The value is freeform, i\.e\., you may use any keys and
values within the attribute set\. However, some common keys and values
have option definitions\. If these definitions do not allow syntax
that is valid within an action framework, e\.g\. GitHub or Gitea,
please file an issue\.

See GitHub documentation for GitHub Actions syntax:

[https://docs\.github\.com/en/actions/writing-workflows/workflow-syntax-for-github-actions](https://docs\.github\.com/en/actions/writing-workflows/workflow-syntax-for-github-actions)

See Gitea documentation for Gitea Actions syntax:

[https://docs\.gitea\.com/next/usage/actions/overview/](https://docs\.gitea\.com/next/usage/actions/overview/)



*Type:*
attribute set of (open submodule of (attribute set))



*Default:*
` { } `



*Example:*

```
{
  ".github/workflows/main.yaml" = {
    jobs = {
      nix-flake-check = {
        steps = [
          {
            uses = "actions/checkout@v4";
          }
          {
            uses = "cachix/install-nix-action@v31";
          }
          {
            name = "Check flake";
            run = "nix -Lv flake check";
          }
        ];
      };
    };
  };
}
```

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs {#opt-flake.actions-nix.workflows._name_.jobs}



Configuration of jobs\.



*Type:*
attribute set of (open submodule of (attribute set))

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.needs {#opt-flake.actions-nix.workflows._name_.jobs._name_.needs}



*Type:*
null or (list of string)



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.runs-on {#opt-flake.actions-nix.workflows._name_.jobs._name_.runs-on}



*Type:*
null or string



*Default:*
` defaultValues.jobs.runs-on `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.steps {#opt-flake.actions-nix.workflows._name_.jobs._name_.steps}



*Type:*
null or (list of (open submodule of (attribute set)))



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.env {#opt-flake.actions-nix.workflows._name_.jobs._name_.steps._.env}



*Type:*
null or (attribute set)



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\."if" {#opt-flake.actions-nix.workflows._name_.jobs._name_.steps._.if}



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.name {#opt-flake.actions-nix.workflows._name_.jobs._name_.steps._.name}



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.run {#opt-flake.actions-nix.workflows._name_.jobs._name_.steps._.run}



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\.uses {#opt-flake.actions-nix.workflows._name_.jobs._name_.steps._.uses}



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.steps\.\*\."with" {#opt-flake.actions-nix.workflows._name_.jobs._name_.steps._.with}



*Type:*
null or (attribute set)



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.strategy {#opt-flake.actions-nix.workflows._name_.jobs._name_.strategy}



*Type:*
null or (attribute set)



*Default:*
` null `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.jobs\.\<name>\.timeout-minutes {#opt-flake.actions-nix.workflows._name_.jobs._name_.timeout-minutes}



*Type:*
null or signed integer



*Default:*
` defaultValues.jobs.timeout-minutes `

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)



## flake\.actions-nix\.workflows\.\<name>\.on {#opt-flake.actions-nix.workflows._name_.on}



Trigger(s) to automatically trigger a workflow\.



*Type:*
attribute set



*Default:*

```
{
  push = { };
  workflow_dispatch = { };
}
```

*Declared by:*
 - [actions-nix/nix/flake-modules/actions-nix/ci\.nix](https://github.com/nialov/actions.nix/blob/master/nix/flake-modules/actions-nix/ci.nix)

