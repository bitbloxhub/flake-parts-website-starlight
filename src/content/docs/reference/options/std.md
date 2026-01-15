---
title: std

---




Add definitions from the [Standard](https://github.com/divnix/std#readme) DevOps framework to your flake.

It organizes and disciplines your Nix and thereby speeds you up.
It also comes with great horizontal integrations of high quality
vertical DevOps tooling crafted by the Nix Ecosystem.


## Installation

To use these options, add to your flake inputs:

```nix
std.url = "github:divnix/std";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.std.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options



