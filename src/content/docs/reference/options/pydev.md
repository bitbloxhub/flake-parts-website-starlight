---
title: pydev

---




[pydev](https://github.com/oceansprint/pydev) is an opinionated environment for developing Python packages.


## Installation

To use these options, add to your flake inputs:

```nix
pydev.url = "github:oceansprint/pydev";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.pydev.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## pydev\.extraTestDependencies {#opt-pydev.extraTestDependencies}

Extra dependencies for tests\.



*Type:*
list of string

*Declared by:*
 - [pydev/interface\.nix](https://github.com/oceansprint/pydev/blob/main/interface.nix)



## pydev\.supportedPythons {#opt-pydev.supportedPythons}



Supported Python versions\.



*Type:*
list of string

*Declared by:*
 - [pydev/interface\.nix](https://github.com/oceansprint/pydev/blob/main/interface.nix)

