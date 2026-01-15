---
title: Flake Parts
---



_Core of a distributed framework for writing Nix Flakes._

`flake-parts` provides the options that represent standard flake attributes
and establishes a way of working with `system`.
Opinionated features are provided by an ecosystem of modules that you can import.

`flake-parts` _itself_ has the goal to be a minimal mirror of the Nix flake schema.
Used by itself, it is very lightweight.

> It is definitely the best Flake framework and it is simply out of this world!

—Pol Dellaiera ([source](https://not-a-number.io/2025/refactoring-my-infrastructure-as-code-configurations/##trade-offs))

---

**Documentation**: [flake.parts](https://flake.parts)

---

## Why Modules?

Flakes are configuration. The module system lets you refactor configuration
into modules that can be shared.

It reduces the proliferation of custom Nix glue code, similar to what the
module system has done for NixOS configurations.

Unlike NixOS, but following Flakes' spirit, `flake-parts` is not a
monorepo with the implied goal of absorbing all of open source, but rather
a single module that other repositories can build upon, while ensuring a
baseline level of compatibility: the core attributes that constitute a flake.

## Features

 - Split your `flake.nix` into focused units, each in their own file.

 - Take care of [system](https://flake.parts/system.html).

 - Allow users of your library flake to easily integrate your generated flake outputs
   into their flake.

 - Reuse project logic written by others

