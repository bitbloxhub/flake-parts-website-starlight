---
title: files

---




In-repository file generation flake-parts module

As Nix users, we naturally want
the source of all truth to reside within Nix files 📜
and other files that include that truth to be generated ⚡.

For example, who didn't want to
dynamically include various facts about their project
in the readme and make sure those are up-to-date?

but

1. project repositories are expected to include _tracked_ readmes 📄

2. Git tracked or not, `.gitignore` files must sometimes exist 🤷

3. `.github/workflows/*` must be Git tracked (don't get me started on these)

4. and the list goes on

You may be thinking

> Wait 🤔, so what if they must be tracked—I can still
> generate them from Nix and then check that my repository is clean.

And you'd be right!
...except that checking that your repository is clean cannot be a flake check.

> Okay, so I'll make a flake check for each generated file.

Well, yes, you could.
...or you could use this project—if you're using flake-parts, that is (sorry).


## Installation

To use these options, add to your flake inputs:

```nix
files.url = "github:mightyiam/files";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.files.flakeModules.default
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.files\.files {#opt-perSystem.files.files}

Files to be written and checked for\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  {
    path_ = "README.md";
    drv =
      pkgs.writeText "README.md"
        # markdown
        ''
          # Practical Project

          Clear documentation
        '';
  }
  {
    path_ = ".gitignore";
    drv = pkgs.writeText "gitignore" ''
      result
    '';
  }
]

```

*Declared by:*
 - [files/module\.nix](https://github.com/mightyiam/files/blob/main/module.nix)



## perSystem\.files\.files\.\*\.drv {#opt-perSystem.files.files._.drv}



Provide the file as a derivation\.
The out path is expected to be a file\.
Directory out path not supported;
pull request welcome!



*Type:*
package



*Example:*

```
pkgs.writers.writeJSON "gh-actions-workflow-check.yaml" {
  on.push = { };
  jobs.check = {
    runs-on = "ubuntu-latest";
    steps = [
      { uses = "actions/checkout@v4"; }
      { uses = "DeterminateSystems/nix-installer-action@main"; }
      { uses = "DeterminateSystems/magic-nix-cache-action@main"; }
      { run = "nix flake check"; }
    ];
  };
}

```

*Declared by:*
 - [files/module\.nix](https://github.com/mightyiam/files/blob/main/module.nix)



## perSystem\.files\.files\.\*\.path_ {#opt-perSystem.files.files._.path_}



File path relative to Git top-level\.



*Type:*
string



*Example:*
` ".github/workflows/check.yaml" `

*Declared by:*
 - [files/module\.nix](https://github.com/mightyiam/files/blob/main/module.nix)



## perSystem\.files\.gitToplevel {#opt-perSystem.files.gitToplevel}



Each check is performed by copying the existing file into the store
and comparing its contents with the configured contents\.

For that purpose a path to the file must be provided to Nix\.
Configured file paths are relative to the Git top-level\.
But Nix is oblivious to the Git top-level\.
So file paths are resolved relative to the value of this option\.

The default value is correct when the flake is at the Git top-level\.
Otherwise the correct Git top-level must be provided\.



*Type:*
absolute path



*Default:*
` self `



*Example:*
` ../. `

*Declared by:*
 - [files/module\.nix](https://github.com/mightyiam/files/blob/main/module.nix)



## perSystem\.files\.writer\.drv {#opt-perSystem.files.writer.drv}



Provides an executable
that writes each configured file’s contents to its path\.
Missing parent directories are created\.

Consider including this in the project’s development shell\.



*Type:*
package *(read only)*

*Declared by:*
 - [files/module\.nix](https://github.com/mightyiam/files/blob/main/module.nix)



## perSystem\.files\.writer\.exeFilename {#opt-perSystem.files.writer.exeFilename}



The writer executable filename\.



*Type:*
(optionally newline-terminated) single-line string



*Default:*
` "write-files" `



*Example:*
` "files-write" `

*Declared by:*
 - [files/module\.nix](https://github.com/mightyiam/files/blob/main/module.nix)

