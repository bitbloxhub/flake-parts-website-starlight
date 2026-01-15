---
title: terranix

---




[terranix](https://terranix.org/) is a terraform.json generator with a nix-like feeling.


## Installation

To use these options, add to your flake inputs:

```nix
terranix.url = "github:terranix/terranix";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.terranix.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.terranix\.exportDevShells {#opt-perSystem.terranix.exportDevShells}

Whether to export a ` devShell ` for each terranix configuration\.

If you wish to create the ` devShells ` yourself, you can disable this option
and use ` pkgs.mkShell.inputsFrom ` with ` terranix.terranixConfigurations.<name>.result.devShell `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations {#opt-perSystem.terranix.terranixConfigurations}



A submodule of all terranix configurations\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.extraArgs {#opt-perSystem.terranix.terranixConfigurations._name_.extraArgs}



Extra arguments that are accessible from Terranix configuration\.



*Type:*
attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.modules {#opt-perSystem.terranix.terranixConfigurations._name_.modules}



Modules of the Terranix configuration\.



*Type:*
list of module



*Default:*
` [ ] `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.result {#opt-perSystem.terranix.terranixConfigurations._name_.result}



A collection of useful read-only outputs by this configuration\.
For debugging or otherwise\.



*Type:*
submodule *(read only)*



*Default:*
` { } `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.result\.app {#opt-perSystem.terranix.terranixConfigurations._name_.result.app}



The exposed default app\. Made from ` result.scripts.apply `\.

Yes, only a single app, and simply running it as ` nix run .#foo ` would yield
a ` terraform apply ` for the config ` foo `\.

But then how does random terraform invocations like ` nix run .#foo.destroy ` work?
It’s actually still using the same app as before - you’re still in the ` apply `
derivation, as strange as it sounds\.

The magic lies in the use of derivation ` passthru ` which (simplified) lets you namespace other
derivations inside a main derivation\. In other words, ` nix run .#foo ` runs the ` apply ` derivation named
` foo ` like normally\. ` nix run .#foo.destroy ` runs the ` destroy ` script inside of the ` apply ` derivation\.

This workaround is required because the flake schema outputs have no concept of nesting derivations like this -
i\.e\. ` apps.x86_64-linux.foo ` HAS to resolve to a derivation and NOT an attrset\.

The ` legacyPackages ` output is an exception to this rule\.
It was created because ` nixpkgs ` constantly nest derivations (consider package sets like ` python311Packages `),
so an escape hatch was needed for flakes who needed to refer to these nested derivations\.
But having scripts reside in this output made no semantic sense, so this was done instead as a conceptual simplication\.



*Type:*
unspecified value



*Default:*
`` "The default app which defaults to the `apply` script." ``

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.result\.devShell {#opt-perSystem.terranix.terranixConfigurations._name_.result.devShell}



The exposed devShell\.

Note that you have to re-enter/ your devShell when your configuration changes!
The invocation scripts will still target your old configuration otherwise\.

For those who want ` devShell `-based access like

```sh
$ nix develop .#foo
$ apply
$ destroy

```

As opposed to ` app `-based access like

```
$ nix run .#foo
$ nix run .#foo.destroy
```



*Type:*
unspecified value



*Default:*
` "The final devShell with scripts and terraform wrapper." `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.result\.scripts {#opt-perSystem.terranix.terranixConfigurations._name_.result.scripts}



The exposed Terraform scripts (apply, etc)\.



*Type:*
unspecified value



*Default:*

```
''
  {
    init = mkTfScript "init" '''
      terraform init
    ''';
    apply = mkTfScript "apply" '''
      terraform init
      terraform apply
    ''';
    plan = mkTfScript "plan" '''
      terraform init
      terraform plan
    ''';
    destroy = mkTfScript "destroy" '''
      terraform init
      terraform destroy
    ''';
  }
''
```

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.result\.terraformConfiguration {#opt-perSystem.terranix.terranixConfigurations._name_.result.terraformConfiguration}



The exposed Terranix configuration as created by lib\.terranixConfiguration\.



*Type:*
unspecified value



*Default:*
` "The final Terraform configuration JSON." `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.result\.terraformWrapper {#opt-perSystem.terranix.terranixConfigurations._name_.result.terraformWrapper}



The exposed, wrapped Terraform\.



*Type:*
package



*Default:*
` "The Terraform wrapper." `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.terraformWrapper\.package {#opt-perSystem.terranix.terranixConfigurations._name_.terraformWrapper.package}



The terraform package to use\. Specifies which Terraform implementation you want to use\.

You may also specify which plugins you want to use with your Terraform implementation:

```
pkgs.terraform.withPlugins (p: [ p.external p.local p.null ])
```

or for OpenTofu:

```
pkgs.opentofu.withPlugins (p: [ p.external p.local p.null ])
```



*Type:*
package



*Default:*
` pkgs.terraform `



*Example:*
` pkgs.opentofu `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.terraformWrapper\.extraRuntimeInputs {#opt-perSystem.terranix.terranixConfigurations._name_.terraformWrapper.extraRuntimeInputs}



Extra runtimeInputs for the terraform
invocations\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.terraformWrapper\.prefixText {#opt-perSystem.terranix.terranixConfigurations._name_.terraformWrapper.prefixText}



Extra commands to run in the wrapper before invoking Terraform



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.terraformWrapper\.suffixText {#opt-perSystem.terranix.terranixConfigurations._name_.terraformWrapper.suffixText}



Extra commands to run in the wrapper after invoking Terraform



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)



## perSystem\.terranix\.terranixConfigurations\.\<name>\.workdir {#opt-perSystem.terranix.terranixConfigurations._name_.workdir}



Working directory of the terranix configuration\.
Defaults to submodule name\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [terranix/flake-module\.nix](https://github.com/terranix/terranix/blob/main/flake-module.nix)

