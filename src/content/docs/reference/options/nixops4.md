---
title: nixops4

---




[NixOps4](https://nixops.dev) is a platform for any kind of deployment in much the same way Nix is a platform for any build.

**⚠️ It is currently in development and changing**


## Installation

To use these options, add to your flake inputs:

```nix
nixops4.url = "github:nixops4/nixops4";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.nixops4.modules.flake.default
];
```

Run `nix flake lock` and you're set.

## Options

## nixops4Deployments {#opt-nixops4Deployments}

An attribute set of NixOps4 deployments\.
See [` Module Options `](https://nixops\.dev/manual/development/modules/)\.

Each deployment passed to [` mkDeployment `](https://nixops\.dev/manual/development/lib/\#mkDeployment)\.

Definitions in ` nixops4Deployments.<name> ` give rise to the definitions:

 - ` flake.nixops4Configurations.<name> ` - the flake output attribute for NixOps4,
 - ` perSystem.checks.nixops-deployment-providers-<name> ` ([` perSystem.checks `](flake-parts\.md\#opt-perSystem\.checks)), to make sure the deployment’s resource providers are available on the supported flake systems - i\.e\. that the deployment can performed *from* all [systems](flake-parts\.md\#opt-systems)\.



*Type:*
lazy attribute set of module



*Default:*
` { } `

*Declared by:*
 - [nixops4/nix/flake-parts/flake-parts\.nix](https://github.com/nixops4/nixops4/blob/main/nix/flake-parts/flake-parts.nix)



## nixops4Deployments\.\<name>\.providers {#opt-nixops4Deployments._name_.providers}



The resource providers to use\.

Resource providers are the executables that implement the operations on resources\.

While provider information can be provided directly in the resource, this indirection allows for the same provider to be used for multiple resources conveniently\.

It also allows for expressions to extract just the providers from a deployment configuration\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  local = inputs.nixops4.modules.nixops4Provider.local;
  foo = inputs.nixops4-resources-foo.modules.nixops4Provider.default;
}

```

*Declared by:*
 - [nixops4/nix/deployment/providers\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/providers.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.args {#opt-nixops4Deployments._name_.providers._name_.args}



Any command line arguments to pass to the executable\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nixops4/nix/provider/provider\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.description {#opt-nixops4Deployments._name_.providers._name_.description}



A description of what the resource provider does\.
This will be displayed on the provider’s documentation index page\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/provider/provider-doc\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider-doc.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.executable {#opt-nixops4Deployments._name_.providers._name_.executable}



The path to the executable that implements the resource operations\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/provider/provider\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.name {#opt-nixops4Deployments._name_.providers._name_.name}



The display name of the resource provider\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/provider/provider-doc\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider-doc.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes {#opt-nixops4Deployments._name_.providers._name_.resourceTypes}



The types of resources that this provider can create\.

The purpose of the ` resourceTypes ` option is to provide the information necessary to create the ` providers ` module argument\.

The attribute name under ` resourceTypes ` is the resource type, and gives rise to ` providers.<provider>.<resourceType> `\.



*Type:*
lazy attribute set of (submodule)

*Declared by:*
 - [nixops4/nix/provider/provider\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.description {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.description}



A description of what this resource type represents\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.inputs {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.inputs}



A module that declares the inputs to the resource using its options\.



*Type:*
module

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.outputs {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.outputs}



A module that declares the outputs of the resource using its options\.



*Type:*
module

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.provider\.args {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.provider.args}



Value to be used for [` nixops4Deployments.<name>.resources.<name>.provider.args `](\#opt-nixops4Deployments\._name_\.resources\._name_\.provider\.args)\.



*Type:*
list of string



*Default:*
inherited from provider

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.provider\.executable {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.provider.executable}



Value to be used for [` nixops4Deployments.<name>.resources.<name>.provider.executable `](\#opt-nixops4Deployments\._name_\.resources\._name_\.provider\.executable)\.



*Type:*
string



*Default:*
inherited from provider

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.provider\.type {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.provider.type}



Value to be used for [` nixops4Deployments.<name>.resources.<name>.provider.type `](\#opt-nixops4Deployments\._name_\.resources\._name_\.provider\.type)\.



*Type:*
string



*Default:*
inherited from provider

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.requireState {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.requireState}



Whether the resource requires state to be stored\.



*Type:*
boolean

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.resourceTypes\.\<name>\.type {#opt-nixops4Deployments._name_.providers._name_.resourceTypes._name_.type}



The type of resource to create\. Most resource providers will have some fixed set of resource types\.
This selects one of them\.

We suggest to set (override) this only if absolutely necessary for compatibility with earlier versions of a resource\.



*Type:*
string



*Default:*
inherited attribute name

*Declared by:*
 - [nixops4/nix/resourceType/resourceType\.nix](https://github.com/nixops4/nixops4/blob/main/nix/resourceType/resourceType.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.sourceBaseUrl {#opt-nixops4Deployments._name_.providers._name_.sourceBaseUrl}



Base URL for linking to the provider’s source code\.
Used in generated documentation to create links to option declarations\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/provider/provider-doc\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider-doc.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.sourceName {#opt-nixops4Deployments._name_.providers._name_.sourceName}



Name of the source repository or project\.
Used in generated documentation link display text\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/provider/provider-doc\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider-doc.nix)



## nixops4Deployments\.\<name>\.providers\.\<name>\.type {#opt-nixops4Deployments._name_.providers._name_.type}



The type of communication to use with the resource provider executable\.



*Type:*
string



*Default:*
` "stdio" `

*Declared by:*
 - [nixops4/nix/provider/provider\.nix](https://github.com/nixops4/nixops4/blob/main/nix/provider/provider.nix)



## nixops4Deployments\.\<name>\.resources {#opt-nixops4Deployments._name_.resources}



The resources to deploy\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [nixops4/nix/deployment/providers\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/providers.nix)
 - [nixops4/nix/deployment/resources\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resources.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.inputs {#opt-nixops4Deployments._name_.resources._name_.inputs}



The inputs to the resource\.

These parameters primarily control the configuration of the resource\.
They are set by you (a module author or configuration author) and are passed to the resource provider executable\.



*Type:*
submodule

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.outputs {#opt-nixops4Deployments._name_.resources._name_.outputs}



The outputs of the resource\.

These follow from the real world existence of the resource\.
They are set by NixOps, which in turn gets this information from resource providers\.



*Type:*
submodule

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.provider\.args {#opt-nixops4Deployments._name_.resources._name_.provider.args}



Any command line arguments to pass to the executable\.



*Type:*
list of (string or (string or absolute path or signed integer) convertible to it)



*Default:*
` [ ] `

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.provider\.executable {#opt-nixops4Deployments._name_.resources._name_.provider.executable}



The path to the executable that implements the resource operations\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.provider\.type {#opt-nixops4Deployments._name_.resources._name_.provider.type}



The type of communication to use with the resource provider executable\.



*Type:*
value “stdio” (singular enum)



*Default:*
` "stdio" `

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.requireState {#opt-nixops4Deployments._name_.resources._name_.requireState}



Whether the resource requires state to be stored\.



*Type:*
boolean

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.resourceType {#opt-nixops4Deployments._name_.resources._name_.resourceType}



The type of resource to create\. Most resource providers will have some fixed set of resource types\.



*Type:*
string

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.state {#opt-nixops4Deployments._name_.resources._name_.state}



The state handler for the resource, if needed\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nixops4/nix/deployment/resource\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/resource.nix)



## nixops4Deployments\.\<name>\.resources\.\<name>\.type {#opt-nixops4Deployments._name_.resources._name_.type}



A resource type from the ` providers ` module argument\.



*Type:*
raw value



*Example:*

```
providers.local.file

```

*Declared by:*
 - [nixops4/nix/deployment/providers\.nix](https://github.com/nixops4/nixops4/blob/main/nix/deployment/providers.nix)

