---
title: easy-hosts

---




[`easy-hosts`](https://github.com/tgirlcloud/easy-hosts/blob/main)
lets you define multiple nixos and darwin configurations
agnosticly. Whilst providing a nice user interface via shared
configurations and perClass configurations meaning that easy-hosts
remains highly extensible.


## Installation

To use these options, add to your flake inputs:

```nix
easy-hosts.url = "github:tgirlcloud/easy-hosts";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.easy-hosts.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## easy-hosts\.additionalClasses {#opt-easy-hosts.additionalClasses}

Additional classes and their respective mappings to already existing classes



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  wsl = "nixos";
  rpi = "nixos";
  macos = "darwin";
}

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.autoConstruct {#opt-easy-hosts.autoConstruct}



Whether to enable Automatically construct hosts\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts {#opt-easy-hosts.hosts}



Hosts to be defined by the flake



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.arch {#opt-easy-hosts.hosts._name_.arch}



The architecture of the host



*Type:*
one of “x86_64”, “aarch64”, “armv6l”, “armv7l”, “i686”, “powerpc64le”, “riscv64”



*Default:*
` "x86_64" `



*Example:*
` "aarch64" `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.class {#opt-easy-hosts.hosts._name_.class}



The class of the host



*Type:*
one of “nixos”, “darwin”, “iso”



*Default:*
` "nixos" `



*Example:*
` "darwin" `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.deployable {#opt-easy-hosts.hosts._name_.deployable}



Whether to enable Is this host deployable\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.modules {#opt-easy-hosts.hosts._name_.modules}



‹name› modules to be included in the system



*Type:*
list of module



*Default:*
` [ ] `



*Example:*

```
[ ./hardware-configuration.nix ./networking.nix ]

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.nix-darwin {#opt-easy-hosts.hosts._name_.nix-darwin}



The nix-darwin flake to be used for the host



*Type:*
anything



*Default:*
` inputs.darwin or inputs.nix-darwin `



*Example:*
` inputs.my-nix-darwin `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.nixpkgs {#opt-easy-hosts.hosts._name_.nixpkgs}



The nixpkgs flake to be used for the host



*Type:*
anything



*Default:*
` inputs.nixpkgs `



*Example:*
` inputs.nixpkgs-unstable `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.path {#opt-easy-hosts.hosts._name_.path}



Path to the directory containing the host files



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` ./hosts/myhost `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.specialArgs {#opt-easy-hosts.hosts._name_.specialArgs}



‹name› special arguments to be passed to the system



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
{ foo = "bar"; }

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.hosts\.\<name>\.tags {#opt-easy-hosts.hosts._name_.tags}



Extra tags for the host



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "laptop"
]
```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.onlySystem {#opt-easy-hosts.onlySystem}



Only construct the hosts with for this platform



*Type:*
null or string



*Default:*
` null `



*Example:*
` aarch64-darwin `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.path {#opt-easy-hosts.path}



Path to the directory containing the host files



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` ./hosts `

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perArch {#opt-easy-hosts.perArch}



Per arch settings



*Type:*
function that evaluates to a(n) (submodule)



*Default:*

```
''
  arch: {
    modules = [ ];
    specialArgs = { };
  };
''
```



*Example:*

```
arch: {
  modules = [
    { system.nixos.label = arch; }
  ];

  specialArgs = { };
}

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perArch\.\<function body>\.modules {#opt-easy-hosts.perArch._function_body_.modules}



Per arch modules to be included in the system



*Type:*
list of module



*Default:*
` [ ] `



*Example:*

```
[ ./hardware-configuration.nix ./networking.nix ]

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perArch\.\<function body>\.specialArgs {#opt-easy-hosts.perArch._function_body_.specialArgs}



Per arch special arguments to be passed to the system



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
{ foo = "bar"; }

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perClass {#opt-easy-hosts.perClass}



Per class settings



*Type:*
function that evaluates to a(n) (submodule)



*Default:*

```
''
  class: {
    modules = [ ];
    specialArgs = { };
  };
''
```



*Example:*

```
class: {
  modules = [
    { system.nixos.label = class; }
  ];

  specialArgs = { };
}

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perClass\.\<function body>\.modules {#opt-easy-hosts.perClass._function_body_.modules}



Per class modules to be included in the system



*Type:*
list of module



*Default:*
` [ ] `



*Example:*

```
[ ./hardware-configuration.nix ./networking.nix ]

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perClass\.\<function body>\.specialArgs {#opt-easy-hosts.perClass._function_body_.specialArgs}



Per class special arguments to be passed to the system



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
{ foo = "bar"; }

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perTag {#opt-easy-hosts.perTag}



Per tag settings



*Type:*
function that evaluates to a(n) (submodule)



*Default:*

```
''
  tag: {
    modules = [ ];
    specialArgs = { };
  };
''
```



*Example:*

```
let
  tagModule = {
    laptop = ./modules/laptop;
    gaming = ./modules/gaming;
  };
in
tag: {
  modules = [ tagModule.${tag} ];

  specialArgs = { };
}

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perTag\.\<function body>\.modules {#opt-easy-hosts.perTag._function_body_.modules}



Per tag modules to be included in the system



*Type:*
list of module



*Default:*
` [ ] `



*Example:*

```
[ ./hardware-configuration.nix ./networking.nix ]

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.perTag\.\<function body>\.specialArgs {#opt-easy-hosts.perTag._function_body_.specialArgs}



Per tag special arguments to be passed to the system



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
{ foo = "bar"; }

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.shared\.modules {#opt-easy-hosts.shared.modules}



Shared modules to be included in the system



*Type:*
list of module



*Default:*
` [ ] `



*Example:*

```
[ ./hardware-configuration.nix ./networking.nix ]

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)



## easy-hosts\.shared\.specialArgs {#opt-easy-hosts.shared.specialArgs}



Shared special arguments to be passed to the system



*Type:*
lazy attribute set of raw value



*Default:*
` { } `



*Example:*

```
{ foo = "bar"; }

```

*Declared by:*
 - [easy-hosts/flake-module\.nix](https://github.com/tgirlcloud/easy-hosts/blob/main/flake-module.nix)

