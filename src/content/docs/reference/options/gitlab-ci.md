---
title: gitlab-ci

---




Creates an app called `.#gitlab-ci` that prints a GitLab dynamic pipeline to
stdout.

For examples see the [README](https://gitlab.horizon-haskell.net/nix/gitlab-ci).


## Installation

To use these options, add to your flake inputs:

```nix
gitlab-ci.url = "git+https://gitlab.horizon-haskell.net/nix/gitlab-ci";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.gitlab-ci.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.gitlab\.ci\.enable {#opt-perSystem.gitlab.ci.enable}

Whether to enable gitlab-ci\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [gitlab-ci/modules/default\.nix, via option flake\.modules\.flake\.gitlab-ci](https://gitlab.horizon-haskell.net/nix/gitlab-ci/modules/default.nix, via option flake.modules.flake.gitlab-ci)



## perSystem\.gitlab\.ci\.gitlab-ci {#opt-perSystem.gitlab.ci.gitlab-ci}



The derivation that prints the \.gitlab-ci\.yml content to stdout\.

Only override this if you want to change the behaviour of this module\.



*Type:*
package



*Default:*
` <derivation> `

*Declared by:*
 - [gitlab-ci/modules/default\.nix, via option flake\.modules\.flake\.gitlab-ci](https://gitlab.horizon-haskell.net/nix/gitlab-ci/modules/default.nix, via option flake.modules.flake.gitlab-ci)



## perSystem\.gitlab\.ci\.jobs {#opt-perSystem.gitlab.ci.jobs}



Top level ` jobs `, expressed as an attribute set\.



*Type:*
attribute set



*Example:*

```
{
  build = {
    script = [
      "echo \"Success\""
    ];
    stage = "build";
  };
  test = {
    script = [
      "echo \"Success\""
    ];
    stage = "test";
  };
}
```

*Declared by:*
 - [gitlab-ci/modules/default\.nix, via option flake\.modules\.flake\.gitlab-ci](https://gitlab.horizon-haskell.net/nix/gitlab-ci/modules/default.nix, via option flake.modules.flake.gitlab-ci)



## perSystem\.gitlab\.ci\.name {#opt-perSystem.gitlab.ci.name}



The name of this app under ` apps `\.



*Type:*
string



*Default:*
` "gitlab-ci" `



*Example:*
` "gitlab-ci" `

*Declared by:*
 - [gitlab-ci/modules/default\.nix, via option flake\.modules\.flake\.gitlab-ci](https://gitlab.horizon-haskell.net/nix/gitlab-ci/modules/default.nix, via option flake.modules.flake.gitlab-ci)



## perSystem\.gitlab\.ci\.stages {#opt-perSystem.gitlab.ci.stages}



List of ` stages ` under the ` stages: ` key\.



*Type:*
list of string



*Example:*

```
[
  "build"
  "test"
]
```

*Declared by:*
 - [gitlab-ci/modules/default\.nix, via option flake\.modules\.flake\.gitlab-ci](https://gitlab.horizon-haskell.net/nix/gitlab-ci/modules/default.nix, via option flake.modules.flake.gitlab-ci)

