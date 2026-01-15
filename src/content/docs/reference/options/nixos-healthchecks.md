---
title: nixos-healthchecks

---




[nixos-healthchecks](https://github.com/mrVanDalo/nixos-healthchecks)
provide NixOS-Options to verify if your services are running correctly.

```nix
healthchecks.http.nextcloud = {
  url = "https://example.com/login";
  expectedContent = "Login";
};
services.nextcloud = { ... };
```

Than run

```shell
  nix run .#healthchecks
```



## Installation

To use these options, add to your flake inputs:

```nix
nixos-healthchecks.url = "github:mrVanDalo/nixos-healthchecks";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.nixos-healthchecks.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options



