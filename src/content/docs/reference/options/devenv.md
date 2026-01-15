---
title: devenv

---




[`devenv`](https://devenv.sh) provides a devShell with many options, and container packages.

See also the [setup guide at devenv.sh](https://devenv.sh/guides/using-with-flake-parts/).


## Installation

To use these options, add to your flake inputs:

```nix
devenv.url = "github:cachix/devenv";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.devenv.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.devenv\.modules {#opt-perSystem.devenv.modules}

Extra modules to import into every shell\.
Allows flakeModules to add options to devenv for example\.



*Type:*
list of module



*Default:*

```
[
  <function, args: {inputs, lib}>
]
```

*Declared by:*
 - [devenv/flake-module\.nix](https://github.com/cachix/devenv/blob/main/flake-module.nix)



## perSystem\.devenv\.shells {#opt-perSystem.devenv.shells}



The [devenv\.sh](https://devenv\.sh) settings, per shell\.

Each definition ` devenv.shells.<name> ` results in a value for
[` devShells.<name> `](flake-parts\.html\#opt-perSystem\.devShells)\.

Define ` devenv.shells.default ` for the default ` nix develop `
invocation - without an argument\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  # create devShells.default
  default = {
    # devenv settings, e.g.
    languages.elm.enable = true;
  };
}

```

*Declared by:*
 - [devenv/flake-module\.nix](https://github.com/cachix/devenv/blob/main/flake-module.nix)



## perSystem\.devenv\.shells\.\<name>\.packages {#opt-perSystem.devenv.shells._name_.packages}



A list of packages to expose inside the developer environment\. Search available packages using ` devenv search NAME `\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.enable {#opt-perSystem.devenv.shells._name_.android.enable}



Whether to enable tools for Android Development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.abis {#opt-perSystem.devenv.shells._name_.android.abis}



The Android ABIs to install\.
By default, the arm64-v8a and x86_64 ABIs are installed\.



*Type:*
list of string



*Default:*

```
[
  "arm64-v8a"
  "x86_64"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.android-studio\.enable {#opt-perSystem.devenv.shells._name_.android.android-studio.enable}



Whether to enable the installation of Android Studio\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.android-studio\.package {#opt-perSystem.devenv.shells._name_.android.android-studio.package}



The Android Studio package to use\.
By default, the Android Studio package from nixpkgs is used\.



*Type:*
package



*Default:*
` pkgs.android-studio `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.buildTools\.version {#opt-perSystem.devenv.shells._name_.android.buildTools.version}



The version of the Android build tools to install\.
By default, version 30\.0\.3 is installed or \[ “35\.0\.0” “33\.0\.2” “30\.0\.3” ] if flutter is enabled\.



*Type:*
list of string



*Default:*

```
[
  "34.0.0"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.cmake\.version {#opt-perSystem.devenv.shells._name_.android.cmake.version}



The CMake versions to install for Android\.
By default, version 3\.22\.1 is installed\.



*Type:*
list of string



*Default:*

```
[
  "3.22.1"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.cmdLineTools\.version {#opt-perSystem.devenv.shells._name_.android.cmdLineTools.version}



The version of the Android command line tools to install\.
By default, version 11\.0 is installed or 8\.0 if flutter is enabled\.



*Type:*
string



*Default:*
` "11.0" `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.emulator\.enable {#opt-perSystem.devenv.shells._name_.android.emulator.enable}



Whether to include the Android Emulator\.
By default, the emulator is included\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.emulator\.version {#opt-perSystem.devenv.shells._name_.android.emulator.version}



The version of the Android Emulator to install\.
Available versions depend on the nixpkgs version\.
To see available versions, try building with an invalid version; the error message will list all available options\.



*Type:*
string



*Default:*
Latest version in nixpkgs

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.extraLicenses {#opt-perSystem.devenv.shells._name_.android.extraLicenses}



The additional Android licenses to accept\.
By default, several standard licenses are accepted\.



*Type:*
list of string



*Default:*

```
[
  "android-sdk-preview-license"
  "android-googletv-license"
  "android-sdk-arm-dbt-license"
  "google-gdk-license"
  "intel-android-extra-license"
  "intel-android-sysimage-license"
  "mips-android-sysimage-license"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.extras {#opt-perSystem.devenv.shells._name_.android.extras}



The Android extras to install\.
By default, the Google Cloud Messaging (GCM) extra is installed\.



*Type:*
list of string



*Default:*

```
[
  "extras;google;gcm"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.flutter\.enable {#opt-perSystem.devenv.shells._name_.android.flutter.enable}



Whether to include the Flutter tools\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.flutter\.package {#opt-perSystem.devenv.shells._name_.android.flutter.package}



The Flutter package to use\.
By default, the Flutter package from nixpkgs is used\.



*Type:*
package



*Default:*
` pkgs.flutter `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.googleAPIs\.enable {#opt-perSystem.devenv.shells._name_.android.googleAPIs.enable}



Whether to use the Google APIs\.
By default, the Google APIs are used\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.googleTVAddOns\.enable {#opt-perSystem.devenv.shells._name_.android.googleTVAddOns.enable}



Whether to use the Google TV Add-Ons\.
By default, the Google TV Add-Ons are used\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.ndk\.enable {#opt-perSystem.devenv.shells._name_.android.ndk.enable}



Whether to include the Android NDK (Native Development Kit)\.
By default, the NDK is included\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.ndk\.version {#opt-perSystem.devenv.shells._name_.android.ndk.version}



The version of the Android NDK (Native Development Kit) to install\.
By default, version 26\.1\.10909125 is installed or for flutter version 28\.2\.13676358\.



*Type:*
list of string



*Default:*

```
[
  "26.1.10909125"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.platformTools\.version {#opt-perSystem.devenv.shells._name_.android.platformTools.version}



The version of the Android platform tools to install\.
Available versions depend on the nixpkgs version\.
To see available versions, try building with an invalid version; the error message will list all available options\.



*Type:*
string



*Default:*
Latest version in nixpkgs

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.platforms\.version {#opt-perSystem.devenv.shells._name_.android.platforms.version}



The Android platform versions to install\.
By default, versions 32, 34 and 36 are installed\.



*Type:*
list of string



*Default:*

```
[
  "32"
  "34"
  "36"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.reactNative\.enable {#opt-perSystem.devenv.shells._name_.android.reactNative.enable}



Whether to include the React Native tools\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.sources\.enable {#opt-perSystem.devenv.shells._name_.android.sources.enable}



Whether to include the Android sources\.
By default, the sources are not included\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.systemImageTypes {#opt-perSystem.devenv.shells._name_.android.systemImageTypes}



The Android system image types to install\.
By default, the google_apis_playstore system image is installed\.



*Type:*
list of string



*Default:*

```
[
  "google_apis_playstore"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.systemImages\.enable {#opt-perSystem.devenv.shells._name_.android.systemImages.enable}



Whether to include the Android system images\.
By default, the system images are included\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.android\.tools\.version {#opt-perSystem.devenv.shells._name_.android.tools.version}



The version of the Android SDK tools to install\.
By default, version 26\.1\.1 is installed\.



*Type:*
string



*Default:*
` "26.1.1" `

*Declared by:*
 - [devenv/src/modules/integrations/android\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/android.nix)



## perSystem\.devenv\.shells\.\<name>\.apple\.sdk {#opt-perSystem.devenv.shells._name_.apple.sdk}



The Apple SDK to add to the developer environment on macOS\.

If set to ` null `, the system SDK can be used if the shell allows access to external environment variables\.



*Type:*
null or package



*Default:*
` if pkgs.stdenv.isDarwin then pkgs.apple-sdk else null `



*Example:*
` pkgs.apple-sdk_15 `

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.enable {#opt-perSystem.devenv.shells._name_.aws-vault.enable}



Whether to enable aws-vault integration\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.package {#opt-perSystem.devenv.shells._name_.aws-vault.package}



The aws-vault package to use\.



*Type:*
package



*Default:*
` pkgs.aws-vault `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.awscliWrapper {#opt-perSystem.devenv.shells._name_.aws-vault.awscliWrapper}



Attribute set of packages including awscli2



*Type:*
submodule



*Default:*
` pkgs `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.awscliWrapper\.enable {#opt-perSystem.devenv.shells._name_.aws-vault.awscliWrapper.enable}



Whether to enable Wraps awscli2 binary as ` aws-vault exec <profile> -- aws <args> `\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.awscliWrapper\.package {#opt-perSystem.devenv.shells._name_.aws-vault.awscliWrapper.package}



The awscli2 package to use\.



*Type:*
package



*Default:*
` pkgs.awscli2 `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.opentofuWrapper {#opt-perSystem.devenv.shells._name_.aws-vault.opentofuWrapper}



Attribute set of packages including opentofu



*Type:*
submodule



*Default:*
` pkgs `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.opentofuWrapper\.enable {#opt-perSystem.devenv.shells._name_.aws-vault.opentofuWrapper.enable}



Whether to enable Wraps opentofu binary as ` aws-vault exec <profile> -- opentofu <args> `\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.opentofuWrapper\.package {#opt-perSystem.devenv.shells._name_.aws-vault.opentofuWrapper.package}



The opentofu package to use\.



*Type:*
package



*Default:*
` pkgs.opentofu `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.profile {#opt-perSystem.devenv.shells._name_.aws-vault.profile}



The profile name passed to ` aws-vault exec `\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.terraformWrapper {#opt-perSystem.devenv.shells._name_.aws-vault.terraformWrapper}



Attribute set of packages including terraform



*Type:*
submodule



*Default:*
` pkgs `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.terraformWrapper\.enable {#opt-perSystem.devenv.shells._name_.aws-vault.terraformWrapper.enable}



Whether to enable Wraps terraform binary as ` aws-vault exec <profile> -- terraform <args> `\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.aws-vault\.terraformWrapper\.package {#opt-perSystem.devenv.shells._name_.aws-vault.terraformWrapper.package}



The terraform package to use\.



*Type:*
package



*Default:*
` pkgs.terraform `

*Declared by:*
 - [devenv/src/modules/integrations/aws-vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/aws-vault.nix)



## perSystem\.devenv\.shells\.\<name>\.cachix\.enable {#opt-perSystem.devenv.shells._name_.cachix.enable}



Whether to enable Cachix integration\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/cachix\.nix](https://github.com/cachix/devenv/blob/main/src/modules/cachix.nix)



## perSystem\.devenv\.shells\.\<name>\.cachix\.package {#opt-perSystem.devenv.shells._name_.cachix.package}



The cachix package to use\.



*Type:*
package



*Default:*
` pkgs.cachix `



*Example:*
` inputs.devenv.inputs.cachix.packages.${pkgs.stdenv.system}.cachix `

*Declared by:*
 - [devenv/src/modules/cachix\.nix](https://github.com/cachix/devenv/blob/main/src/modules/cachix.nix)



## perSystem\.devenv\.shells\.\<name>\.cachix\.pull {#opt-perSystem.devenv.shells._name_.cachix.pull}



Which Cachix caches to pull from\.



*Type:*
list of string



*Default:*
` [ "devenv" ] `

*Declared by:*
 - [devenv/src/modules/cachix\.nix](https://github.com/cachix/devenv/blob/main/src/modules/cachix.nix)



## perSystem\.devenv\.shells\.\<name>\.cachix\.push {#opt-perSystem.devenv.shells._name_.cachix.push}



Which Cachix cache to push to\. This cache is also added to ` cachix.pull `\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/cachix\.nix](https://github.com/cachix/devenv/blob/main/src/modules/cachix.nix)



## perSystem\.devenv\.shells\.\<name>\.certFile {#opt-perSystem.devenv.shells._name_.certFile}



Custom certificate file name, uses mkcert default if unset



*Type:*
null or string



*Default:*
` null `



*Example:*
` "mycert.pem" `

*Declared by:*
 - [devenv/src/modules/integrations/mkcert\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/mkcert.nix)



## perSystem\.devenv\.shells\.\<name>\.certificates {#opt-perSystem.devenv.shells._name_.certificates}



List of domains to generate certificates for\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "example.com"
  "*.example.com"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/mkcert\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/mkcert.nix)



## perSystem\.devenv\.shells\.\<name>\.changelogs {#opt-perSystem.devenv.shells._name_.changelogs}



List of changelog entries for this module\.



*Type:*
list of (submodule)



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/changelogs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/changelogs.nix)



## perSystem\.devenv\.shells\.\<name>\.changelogs\.\*\.date {#opt-perSystem.devenv.shells._name_.changelogs._.date}



Date of the changelog entry in YYYY-MM-DD format\.



*Type:*
string matching the pattern ^\[0-9]{4}-\[0-9]{2}-\[0-9]{2}$



*Example:*
` "2025-01-15" `

*Declared by:*
 - [devenv/src/modules/changelogs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/changelogs.nix)



## perSystem\.devenv\.shells\.\<name>\.changelogs\.\*\.description {#opt-perSystem.devenv.shells._name_.changelogs._.description}



Markdown description of the change\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/changelogs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/changelogs.nix)



## perSystem\.devenv\.shells\.\<name>\.changelogs\.\*\.title {#opt-perSystem.devenv.shells._name_.changelogs._.title}



Title of the changelog entry\.



*Type:*
string



*Example:*
` "git-hooks.package is now pkgs.prek" `

*Declared by:*
 - [devenv/src/modules/changelogs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/changelogs.nix)



## perSystem\.devenv\.shells\.\<name>\.changelogs\.\*\.when {#opt-perSystem.devenv.shells._name_.changelogs._.when}



Whether to include this changelog entry (useful for conditional changelogs)\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/changelogs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/changelogs.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.enable {#opt-perSystem.devenv.shells._name_.claude.code.enable}



Whether to enable Claude Code integration with automatic hooks and commands setup\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.agents {#opt-perSystem.devenv.shells._name_.claude.code.agents}



Custom Claude Code sub-agents to create in the project\.
Sub-agents are specialized AI assistants that handle specific tasks
with their own context window and can be invoked automatically or explicitly\.

For more details, see: https://docs\.anthropic\.com/en/docs/claude-code/sub-agents



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  code-reviewer = {
    description = "Expert code review specialist that checks for quality, security, and best practices";
    proactive = true;
    model = "opus";
    tools = [ "Read" "Grep" "TodoWrite" ];
    permissionMode = "plan";
    prompt = ''
      You are an expert code reviewer. When reviewing code, check for:
      - Code readability and maintainability
      - Proper error handling
      - Security vulnerabilities
      - Performance issues
      - Adherence to project conventions

      Provide constructive feedback with specific suggestions for improvement.
    '';
  };

  test-writer = {
    description = "Specialized in writing comprehensive test suites";
    proactive = false;
    tools = [ "Read" "Write" "Edit" "Bash" ];
    prompt = ''
      You are a test writing specialist. Create comprehensive test suites that:
      - Cover edge cases and error conditions
      - Follow the project's testing conventions
      - Include unit, integration, and property-based tests where appropriate
      - Have clear test names that describe what is being tested
    '';
  };
}

```

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.agents\.\<name>\.description {#opt-perSystem.devenv.shells._name_.claude.code.agents._name_.description}



What the sub-agent does



*Type:*
string

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.agents\.\<name>\.model {#opt-perSystem.devenv.shells._name_.claude.code.agents._name_.model}



Override the model for this agent\.



*Type:*
null or one of “opus”, “sonnet”, “haiku”



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.agents\.\<name>\.permissionMode {#opt-perSystem.devenv.shells._name_.claude.code.agents._name_.permissionMode}



Permission mode for this specific sub-agent\.



*Type:*
null or one of “default”, “acceptEdits”, “plan”, “bypassPermissions”



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.agents\.\<name>\.proactive {#opt-perSystem.devenv.shells._name_.claude.code.agents._name_.proactive}



Whether Claude should use this sub-agent automatically



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.agents\.\<name>\.prompt {#opt-perSystem.devenv.shells._name_.claude.code.agents._name_.prompt}



The system prompt for the sub-agent



*Type:*
strings concatenated with “\\n”

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.agents\.\<name>\.tools {#opt-perSystem.devenv.shells._name_.claude.code.agents._name_.tools}



List of allowed tools for this sub-agent



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.apiKeyHelper {#opt-perSystem.devenv.shells._name_.claude.code.apiKeyHelper}



Custom script for generating authentication tokens\.
The script should output the API key to stdout\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "aws secretsmanager get-secret-value --secret-id claude-api-key | jq -r .SecretString" `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.cleanupPeriodDays {#opt-perSystem.devenv.shells._name_.claude.code.cleanupPeriodDays}



Retention period for chat transcripts in days\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 30 `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.commands {#opt-perSystem.devenv.shells._name_.claude.code.commands}



Custom Claude Code slash commands to create in the project\.
Commands are invoked with ` /command-name ` in Claude Code\.



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

``````
{
  test = ''
    Run all tests in the project

    ```bash
    cargo test
    ```
  '';
  fmt = ''
    Format all code in the project

    ```bash
    cargo fmt
    nixfmt **/*.nix
    ```
  '';
}

``````

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.env {#opt-perSystem.devenv.shells._name_.claude.code.env}



Custom environment variables for Claude Code sessions\.



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  NODE_ENV = "development";
  PYTHONPATH = "/custom/python/path";
}
```

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.forceLoginMethod {#opt-perSystem.devenv.shells._name_.claude.code.forceLoginMethod}



Restrict the login method to either browser or API key authentication\.



*Type:*
null or one of “browser”, “api-key”



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.hooks {#opt-perSystem.devenv.shells._name_.claude.code.hooks}



Hooks that run at different points in Claude Code’s workflow\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  protect-secrets = {
    enable = true;
    name = "Protect sensitive files";
    hookType = "PreToolUse";
    matcher = "^(Edit|MultiEdit|Write)$";
    command = ''
      json=$(cat);
      file_path = $(echo "$json" | jq - r '.file_path // empty');
      grep -q 'SECRET\\|PASSWORD\\|API_KEY' "$file_path" && echo 'Blocked: sensitive data detected' && exit 1 || exit 0
    '';
  };
  run-tests = {
    enable = true;
    name = "Run tests after edit";
    hookType = "PostToolUse";
    matcher = "^(Edit|MultiEdit|Write)$";
    command = "cargo test";
  };
  log-completion = {
    enable = true;
    name = "Log when Claude finishes";
    hookType = "Stop";
    command = "echo 'Claude finished responding' >> claude.log";
  };
}

```

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.hooks\.\<name>\.enable {#opt-perSystem.devenv.shells._name_.claude.code.hooks._name_.enable}



Whether to enable this hook\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.hooks\.\<name>\.command {#opt-perSystem.devenv.shells._name_.claude.code.hooks._name_.command}



The command to execute\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.hooks\.\<name>\.hookType {#opt-perSystem.devenv.shells._name_.claude.code.hooks._name_.hookType}



The type of hook:

 - PreToolUse: Runs before tool calls (can block them)
 - PostToolUse: Runs after tool calls complete
 - PostToolUseFailure: Runs after a tool call fails
 - Notification: Runs when Claude Code sends notifications
 - UserPromptSubmit: Runs when user submits a prompt
 - SessionStart: Runs when a Claude Code session starts
 - SessionEnd: Runs when a Claude Code session ends
 - Stop: Runs when Claude Code finishes responding
 - SubagentStart: Runs when a subagent task starts
 - SubagentStop: Runs when subagent tasks complete
 - PreCompact: Runs before message compaction
 - PermissionRequest: Runs when a permission is requested



*Type:*
one of “PreToolUse”, “PostToolUse”, “PostToolUseFailure”, “Notification”, “UserPromptSubmit”, “SessionStart”, “SessionEnd”, “Stop”, “SubagentStart”, “SubagentStop”, “PreCompact”, “PermissionRequest”



*Default:*
` "PostToolUse" `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.hooks\.\<name>\.matcher {#opt-perSystem.devenv.shells._name_.claude.code.hooks._name_.matcher}



Regex pattern to match against tool names (for PreToolUse/PostToolUse hooks)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.hooks\.\<name>\.name {#opt-perSystem.devenv.shells._name_.claude.code.hooks._name_.name}



The name of the hook (appears in logs)\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.mcpServers {#opt-perSystem.devenv.shells._name_.claude.code.mcpServers}



MCP (Model Context Protocol) servers to configure\.
These servers provide additional capabilities and context to Claude Code\.



*Type:*
attribute set of (submodule)



*Default:*

```
{
  "mcp.devenv.sh" = {
    type = "http";
    url = "https://mcp.devenv.sh";
  };
}
```



*Example:*

```
{
  awslabs-iam-mcp-server = {
    type = "stdio";
    command = lib.getExe pkgs.awslabs-iam-mcp-server;
    args = [ ];
    env = { };
  };
  github = {
    type = "http";
    url = "https://api.githubcopilot.com/mcp/";
    headers = {
      Authorization = "Bearer GITHUB_PAT";
    };
  };
  linear = {
    type = "http";
    url = "https://mcp.linear.app/mcp";
  };
  devenv = {
    type = "stdio";
    command = "devenv";
    args = [ "mcp" ];
    env = {
      DEVENV_ROOT = config.devenv.root;
    };
  };
}

```

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.mcpServers\.\<name>\.args {#opt-perSystem.devenv.shells._name_.claude.code.mcpServers._name_.args}



Arguments to pass to the command for stdio MCP servers\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.mcpServers\.\<name>\.command {#opt-perSystem.devenv.shells._name_.claude.code.mcpServers._name_.command}



Command to execute for stdio MCP servers\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.mcpServers\.\<name>\.env {#opt-perSystem.devenv.shells._name_.claude.code.mcpServers._name_.env}



Environment variables for stdio MCP servers\.



*Type:*
attribute set of string



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.mcpServers\.\<name>\.headers {#opt-perSystem.devenv.shells._name_.claude.code.mcpServers._name_.headers}



HTTP headers for HTTP MCP servers (e\.g\., for authentication)\.



*Type:*
attribute set of string



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.mcpServers\.\<name>\.type {#opt-perSystem.devenv.shells._name_.claude.code.mcpServers._name_.type}



Type of MCP server connection\.



*Type:*
one of “stdio”, “http”

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.mcpServers\.\<name>\.url {#opt-perSystem.devenv.shells._name_.claude.code.mcpServers._name_.url}



URL for HTTP MCP servers\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.model {#opt-perSystem.devenv.shells._name_.claude.code.model}



Override the default Claude model\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "claude-3-opus-20240229" `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions {#opt-perSystem.devenv.shells._name_.claude.code.permissions}



Fine-grained permissions for tool usage\.
Supports global settings and per-tool allow/ask/deny rules\.
Tool rules can be placed under ` rules ` or directly (backward compatible)\.



*Type:*
open submodule of attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  defaultMode = "acceptEdits";
  disableBypassPermissionsMode = true;
  additionalDirectories = [ "/shared/libs" ];
  rules = {
    Edit = {
      deny = [ "*.secret" "*.env" ];
    };
    Bash = {
      allow = [ "ls:*" "cat:*" ];
      ask = [ "git:*" "npm:*" ];
      deny = [ "rm -rf:*" "sudo:*" ];
    };
  };
}

```

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions\.additionalDirectories {#opt-perSystem.devenv.shells._name_.claude.code.permissions.additionalDirectories}



Allow Claude Code to access directories outside the project root\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "/shared/libs"
  "/common/configs"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions\.defaultMode {#opt-perSystem.devenv.shells._name_.claude.code.permissions.defaultMode}



Global permission mode for Claude Code\.

 - default: Prompts on first use of each tool
 - acceptEdits: Auto-accepts file edits
 - plan: Read-only mode
 - bypassPermissions: Skips all permission prompts



*Type:*
null or one of “default”, “acceptEdits”, “plan”, “bypassPermissions”



*Default:*
` null `



*Example:*
` "acceptEdits" `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions\.disableBypassPermissionsMode {#opt-perSystem.devenv.shells._name_.claude.code.permissions.disableBypassPermissionsMode}



Security option to prevent the dangerous bypassPermissions mode\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions\.rules {#opt-perSystem.devenv.shells._name_.claude.code.permissions.rules}



Per-tool permission rules\. Preferred location for tool permissions\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions\.rules\.\<name>\.allow {#opt-perSystem.devenv.shells._name_.claude.code.permissions.rules._name_.allow}



List of allowed patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions\.rules\.\<name>\.ask {#opt-perSystem.devenv.shells._name_.claude.code.permissions.rules._name_.ask}



List of patterns that require user approval\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.claude\.code\.permissions\.rules\.\<name>\.deny {#opt-perSystem.devenv.shells._name_.claude.code.permissions.rules._name_.deny}



List of denied patterns\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/integrations/claude\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/claude.nix)



## perSystem\.devenv\.shells\.\<name>\.container\.isBuilding {#opt-perSystem.devenv.shells._name_.container.isBuilding}



Set to true when the environment is building a container\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers {#opt-perSystem.devenv.shells._name_.containers}



Container specifications that can be built, copied and ran using ` devenv container `\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.enableLayerDeduplication {#opt-perSystem.devenv.shells._name_.containers._name_.enableLayerDeduplication}



Whether to enable layer deduplication using the approach described at https://blog\.eigenvalue\.net/2023-nix2container-everything-once/
\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.copyToRoot {#opt-perSystem.devenv.shells._name_.containers._name_.copyToRoot}



Add a path to the container\. Defaults to the whole git repo\.



*Type:*
absolute path or list of absolute path



*Default:*
` self `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.defaultCopyArgs {#opt-perSystem.devenv.shells._name_.containers._name_.defaultCopyArgs}



Default arguments to pass to ` skopeo copy `\.
You can override them by passing arguments to the script\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.entrypoint {#opt-perSystem.devenv.shells._name_.containers._name_.entrypoint}



Entrypoint of the container\.



*Type:*
list of anything



*Default:*
` [ entrypoint ] `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.isBuilding {#opt-perSystem.devenv.shells._name_.containers._name_.isBuilding}



Set to true when the environment is building this container\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers {#opt-perSystem.devenv.shells._name_.containers._name_.layers}



The layers to create\.



*Type:*
list of (submodule)



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.copyToRoot {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.copyToRoot}



A list of derivations copied to the image root directory\.

Store path prefixes ` /nix/store/hash-path ` are removed in order to relocate them to the image ` / `\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.deps {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.deps}



A list of store paths to include in the layer\.



*Type:*
list of package



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.ignore {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.ignore}



A store path to ignore when building the layer\. This is mainly useful to ignore the configuration file from the container layer\.



*Type:*
null or path in the Nix store



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.maxLayers {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.maxLayers}



The maximum number of layers to create\.



*Type:*
signed integer



*Default:*
` 1 `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms}



A list of file permissions which are set when the tar layer is created\.

These permissions are not written to the Nix store\.



*Type:*
list of (submodule)



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms\.\*\.gid {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms._.gid}



The group ID to apply to all of the files matched by the ` regex `\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` "1000" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms\.\*\.gname {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms._.gname}



The group name to apply to all of the files matched by the ` regex `\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "root" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms\.\*\.mode {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms._.mode}

The numeric permissions mode to apply to all of the files matched by the ` regex `\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "644" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms\.\*\.path {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms._.path}



A store path\.



*Type:*
path in the Nix store

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms\.\*\.regex {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms._.regex}



A regex pattern to select files or directories to apply the ` mode ` to\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` ".*" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms\.\*\.uid {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms._.uid}



The user ID to apply to all of the files matched by the ` regex `\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` "1000" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.perms\.\*\.uname {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.perms._.uname}



The user name to apply to all of the files matched by the ` regex `\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "root" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.layers\.\*\.reproducible {#opt-perSystem.devenv.shells._name_.containers._name_.layers._.reproducible}



Whether the layer should be reproducible\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.maxLayers {#opt-perSystem.devenv.shells._name_.containers._name_.maxLayers}



Maximum number of container layers created\.



*Type:*
null or signed integer



*Default:*
` 1 `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.name {#opt-perSystem.devenv.shells._name_.containers._name_.name}



Name of the container\.



*Type:*
null or string



*Default:*
` "top-level name or containers.mycontainer.name" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.registry {#opt-perSystem.devenv.shells._name_.containers._name_.registry}



Registry to push the container to\.



*Type:*
null or string



*Default:*
` "docker-daemon:" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.startupCommand {#opt-perSystem.devenv.shells._name_.containers._name_.startupCommand}



Command to run in the container\.

Can be a string, a package, or a list of strings for individual arguments\.
Use a list when your entrypoint expects separate arguments, e\.g\.:
` startupCommand = [ "-f" "/var/lib/haproxy/haproxy.cfg" ]; `



*Type:*
null or string or package or list of string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.version {#opt-perSystem.devenv.shells._name_.containers._name_.version}



Version/tag of the container\.



*Type:*
null or string



*Default:*
` "latest" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.containers\.\<name>\.workingDir {#opt-perSystem.devenv.shells._name_.containers._name_.workingDir}



Working directory of the container\.



*Type:*
string



*Default:*
` "/env" `

*Declared by:*
 - [devenv/src/modules/containers\.nix](https://github.com/cachix/devenv/blob/main/src/modules/containers.nix)



## perSystem\.devenv\.shells\.\<name>\.delta\.enable {#opt-perSystem.devenv.shells._name_.delta.enable}



Integrate delta into git: https://dandavison\.github\.io/delta/\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/delta\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/delta.nix)



## perSystem\.devenv\.shells\.\<name>\.devcontainer\.enable {#opt-perSystem.devenv.shells._name_.devcontainer.enable}



Whether to enable generation \.devcontainer\.json for devenv integration\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/devcontainer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/devcontainer.nix)



## perSystem\.devenv\.shells\.\<name>\.devcontainer\.settings {#opt-perSystem.devenv.shells._name_.devcontainer.settings}



Devcontainer settings\.



*Type:*
open submodule of (JSON value)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/integrations/devcontainer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/devcontainer.nix)



## perSystem\.devenv\.shells\.\<name>\.devcontainer\.settings\.customizations\.vscode\.extensions {#opt-perSystem.devenv.shells._name_.devcontainer.settings.customizations.vscode.extensions}



A list of pre-installed VS Code extensions\.



*Type:*
list of string



*Default:*

```
[
  "mkhl.direnv"
]
```

*Declared by:*
 - [devenv/src/modules/integrations/devcontainer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/devcontainer.nix)



## perSystem\.devenv\.shells\.\<name>\.devcontainer\.settings\.image {#opt-perSystem.devenv.shells._name_.devcontainer.settings.image}



The name of an image in a container registry\.



*Type:*
string



*Default:*
` "ghcr.io/cachix/devenv/devcontainer:latest" `

*Declared by:*
 - [devenv/src/modules/integrations/devcontainer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/devcontainer.nix)



## perSystem\.devenv\.shells\.\<name>\.devcontainer\.settings\.overrideCommand {#opt-perSystem.devenv.shells._name_.devcontainer.settings.overrideCommand}



Override the default command\.



*Type:*
anything



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/devcontainer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/devcontainer.nix)



## perSystem\.devenv\.shells\.\<name>\.devcontainer\.settings\.updateContentCommand {#opt-perSystem.devenv.shells._name_.devcontainer.settings.updateContentCommand}



A command to run after the container is created\.



*Type:*
anything



*Default:*
` "devenv test" `

*Declared by:*
 - [devenv/src/modules/integrations/devcontainer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/devcontainer.nix)



## perSystem\.devenv\.shells\.\<name>\.devenv\.debug {#opt-perSystem.devenv.shells._name_.devenv.debug}



Whether to enable debug mode of devenv enterShell script\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/debug\.nix](https://github.com/cachix/devenv/blob/main/src/modules/debug.nix)



## perSystem\.devenv\.shells\.\<name>\.devenv\.flakesIntegration {#opt-perSystem.devenv.shells._name_.devenv.flakesIntegration}



Tells if devenv is being imported by a flake\.nix file



*Type:*
boolean



*Default:*
` true ` when devenv is invoked via the flake integration; ` false ` otherwise\.

*Declared by:*
 - [devenv/src/modules/update-check\.nix](https://github.com/cachix/devenv/blob/main/src/modules/update-check.nix)



## perSystem\.devenv\.shells\.\<name>\.devenv\.isTesting {#opt-perSystem.devenv.shells._name_.devenv.isTesting}



Whether the environment is being used for testing\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/tests\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tests.nix)



## perSystem\.devenv\.shells\.\<name>\.devenv\.latestVersion {#opt-perSystem.devenv.shells._name_.devenv.latestVersion}



The latest version of devenv\.



*Type:*
string



*Default:*
` "1.11.2" `

*Declared by:*
 - [devenv/src/modules/update-check\.nix](https://github.com/cachix/devenv/blob/main/src/modules/update-check.nix)



## perSystem\.devenv\.shells\.\<name>\.devenv\.warnOnNewVersion {#opt-perSystem.devenv.shells._name_.devenv.warnOnNewVersion}



Whether to warn when a new version of either devenv or the direnv integration is available\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/update-check\.nix](https://github.com/cachix/devenv/blob/main/src/modules/update-check.nix)



## perSystem\.devenv\.shells\.\<name>\.difftastic\.enable {#opt-perSystem.devenv.shells._name_.difftastic.enable}



Integrate difftastic into git: https://difftastic\.wilfred\.me\.uk/\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/difftastic\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/difftastic.nix)



## perSystem\.devenv\.shells\.\<name>\.dotenv\.enable {#opt-perSystem.devenv.shells._name_.dotenv.enable}



Whether to enable \.env integration, doesn’t support comments or multiline values…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/dotenv\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/dotenv.nix)



## perSystem\.devenv\.shells\.\<name>\.dotenv\.disableHint {#opt-perSystem.devenv.shells._name_.dotenv.disableHint}



Disable the hint that are printed when the dotenv module is not enabled, but \.env is present\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/dotenv\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/dotenv.nix)



## perSystem\.devenv\.shells\.\<name>\.dotenv\.filename {#opt-perSystem.devenv.shells._name_.dotenv.filename}



The name of the dotenv file to load, or a list of dotenv files to load in order of precedence\.



*Type:*
string or list of string



*Default:*
` ".env" `

*Declared by:*
 - [devenv/src/modules/integrations/dotenv\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/dotenv.nix)



## perSystem\.devenv\.shells\.\<name>\.enterShell {#opt-perSystem.devenv.shells._name_.enterShell}



Bash code to execute when entering the shell\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.enterTest {#opt-perSystem.devenv.shells._name_.enterTest}



Bash code to execute to run the test\.



*Type:*
strings concatenated with “\\n”

*Declared by:*
 - [devenv/src/modules/tests\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tests.nix)



## perSystem\.devenv\.shells\.\<name>\.env {#opt-perSystem.devenv.shells._name_.env}



Environment variables to be exposed inside the developer environment\.



*Type:*
open submodule of lazy attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.files {#opt-perSystem.devenv.shells._name_.files}



A set of files that will be linked into devenv root\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/files\.nix](https://github.com/cachix/devenv/blob/main/src/modules/files.nix)



## perSystem\.devenv\.shells\.\<name>\.files\.\<name>\.executable {#opt-perSystem.devenv.shells._name_.files._name_.executable}



Make the file executable



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/files\.nix](https://github.com/cachix/devenv/blob/main/src/modules/files.nix)



## perSystem\.devenv\.shells\.\<name>\.files\.\<name>\.ini {#opt-perSystem.devenv.shells._name_.files._name_.ini}



ini contents



*Type:*
null or (attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string)))



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/files\.nix](https://github.com/cachix/devenv/blob/main/src/modules/files.nix)



## perSystem\.devenv\.shells\.\<name>\.files\.\<name>\.json {#opt-perSystem.devenv.shells._name_.files._name_.json}



json contents



*Type:*
null or JSON value



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/files\.nix](https://github.com/cachix/devenv/blob/main/src/modules/files.nix)



## perSystem\.devenv\.shells\.\<name>\.files\.\<name>\.text {#opt-perSystem.devenv.shells._name_.files._name_.text}



text contents



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/files\.nix](https://github.com/cachix/devenv/blob/main/src/modules/files.nix)



## perSystem\.devenv\.shells\.\<name>\.files\.\<name>\.toml {#opt-perSystem.devenv.shells._name_.files._name_.toml}



toml contents



*Type:*
null or TOML value



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/files\.nix](https://github.com/cachix/devenv/blob/main/src/modules/files.nix)



## perSystem\.devenv\.shells\.\<name>\.files\.\<name>\.yaml {#opt-perSystem.devenv.shells._name_.files._name_.yaml}



yaml contents



*Type:*
null or YAML 1\.1 value



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/files\.nix](https://github.com/cachix/devenv/blob/main/src/modules/files.nix)



## perSystem\.devenv\.shells\.\<name>\.git\.root {#opt-perSystem.devenv.shells._name_.git.root}



Git repository root path\. This field is populated automatically in devenv 1\.10 and newer\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/git\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/git.nix)



## perSystem\.devenv\.shells\.\<name>\.git-hooks {#opt-perSystem.devenv.shells._name_.git-hooks}



Integration with https://github\.com/cachix/git-hooks\.nix



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/integrations/git-hooks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/git-hooks.nix)



## perSystem\.devenv\.shells\.\<name>\.hosts {#opt-perSystem.devenv.shells._name_.hosts}



List of hosts entries\.



*Type:*
attribute set of (string or list of string)



*Default:*
` { } `



*Example:*

```
{
  "another-example.com" = [
    "::1"
    "127.0.0.1"
  ];
  "example.com" = "127.0.0.1";
}
```

*Declared by:*
 - [devenv/src/modules/integrations/hostctl\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/hostctl.nix)



## perSystem\.devenv\.shells\.\<name>\.hostsProfileName {#opt-perSystem.devenv.shells._name_.hostsProfileName}



Profile name to use\.



*Type:*
string



*Default:*
` "devenv-<hash>" `

*Declared by:*
 - [devenv/src/modules/integrations/hostctl\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/hostctl.nix)



## perSystem\.devenv\.shells\.\<name>\.infoSections {#opt-perSystem.devenv.shells._name_.infoSections}



Information about the environment



*Type:*
attribute set of list of string



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/info\.nix](https://github.com/cachix/devenv/blob/main/src/modules/info.nix)



## perSystem\.devenv\.shells\.\<name>\.inputsFrom {#opt-perSystem.devenv.shells._name_.inputsFrom}



A list of derivations whose build inputs will be merged into the shell environment\.



*Type:*
list of package



*Default:*
` [ ] `



*Example:*

```
[
  pkgs.hello
  (pkgs.python3.withPackages (ps: [ ps.numpy ps.pandas ]))
]

```

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.keyFile {#opt-perSystem.devenv.shells._name_.keyFile}



Custom key file name, uses mkcert default if unset



*Type:*
null or string



*Default:*
` null `



*Example:*
` "mykey.pem" `

*Declared by:*
 - [devenv/src/modules/integrations/mkcert\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/mkcert.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ansible\.enable {#opt-perSystem.devenv.shells._name_.languages.ansible.enable}



Whether to enable tools for Ansible development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ansible\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ansible.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ansible\.package {#opt-perSystem.devenv.shells._name_.languages.ansible.package}



The Ansible package to use\.



*Type:*
package



*Default:*
` pkgs.ansible `

*Declared by:*
 - [devenv/src/modules/languages/ansible\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ansible.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ansible\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.ansible.lsp.enable}



Whether to enable Ansible Language Server\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ansible\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ansible.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ansible\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.ansible.lsp.package}



The Ansible language server package to use\.



*Type:*
null or package



*Default:*
` pkgs.ansible-language-server `

*Declared by:*
 - [devenv/src/modules/languages/ansible\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ansible.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.c\.enable {#opt-perSystem.devenv.shells._name_.languages.c.enable}



Whether to enable tools for C development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/c\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/c.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.c\.debugger {#opt-perSystem.devenv.shells._name_.languages.c.debugger}



An optional debugger package to use with c\.
The default is ` gdb `, if supported on the current system\.



*Type:*
null or package



*Default:*
` pkgs.gdb `

*Declared by:*
 - [devenv/src/modules/languages/c\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/c.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.c\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.c.lsp.enable}



Whether to enable C Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/c\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/c.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.c\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.c.lsp.package}



The C language server package to use\.



*Type:*
package



*Default:*
` pkgs.ccls `

*Declared by:*
 - [devenv/src/modules/languages/c\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/c.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.clojure\.enable {#opt-perSystem.devenv.shells._name_.languages.clojure.enable}



Whether to enable tools for Clojure development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/clojure\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/clojure.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.clojure\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.clojure.lsp.enable}



Whether to enable Clojure Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/clojure\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/clojure.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.clojure\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.clojure.lsp.package}



The Clojure language server package to use\.



*Type:*
package



*Default:*
` pkgs.clojure-lsp `

*Declared by:*
 - [devenv/src/modules/languages/clojure\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/clojure.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.cplusplus\.enable {#opt-perSystem.devenv.shells._name_.languages.cplusplus.enable}



Whether to enable tools for C++ development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/cplusplus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/cplusplus.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.cplusplus\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.cplusplus.lsp.enable}



Whether to enable C++ Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/cplusplus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/cplusplus.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.cplusplus\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.cplusplus.lsp.package}



The C++ language server package to use\.



*Type:*
package



*Default:*
` pkgs.ccls `

*Declared by:*
 - [devenv/src/modules/languages/cplusplus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/cplusplus.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.crystal\.enable {#opt-perSystem.devenv.shells._name_.languages.crystal.enable}



Whether to enable Enable tools for Crystal development…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/crystal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/crystal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.crystal\.package {#opt-perSystem.devenv.shells._name_.languages.crystal.package}



The Crystal package to use\.



*Type:*
package



*Default:*
` pkgs.crystal `

*Declared by:*
 - [devenv/src/modules/languages/crystal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/crystal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.crystal\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.crystal.lsp.enable}



Whether to enable Crystal Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/crystal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/crystal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.crystal\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.crystal.lsp.package}



The Crystal language server package to use\.



*Type:*
package



*Default:*
` pkgs.crystalline `

*Declared by:*
 - [devenv/src/modules/languages/crystal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/crystal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.crystal\.shards {#opt-perSystem.devenv.shells._name_.languages.crystal.shards}



Configuration for shards



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/languages/crystal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/crystal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.crystal\.shards\.package {#opt-perSystem.devenv.shells._name_.languages.crystal.shards.package}



The Shards package to use\.



*Type:*
package



*Default:*
` pkgs.shards `

*Declared by:*
 - [devenv/src/modules/languages/crystal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/crystal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.cue\.enable {#opt-perSystem.devenv.shells._name_.languages.cue.enable}



Whether to enable tools for Cue development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/cue\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/cue.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.cue\.package {#opt-perSystem.devenv.shells._name_.languages.cue.package}



The CUE package to use\.



*Type:*
package



*Default:*
` pkgs.cue `

*Declared by:*
 - [devenv/src/modules/languages/cue\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/cue.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.cue\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.cue.lsp.enable}



Whether to enable CUE Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/cue\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/cue.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.cue\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.cue.lsp.package}



The CUE language server package to use\.



*Type:*
package



*Default:*
` pkgs.cuelsp `

*Declared by:*
 - [devenv/src/modules/languages/cue\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/cue.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.dart\.enable {#opt-perSystem.devenv.shells._name_.languages.dart.enable}



Whether to enable tools for Dart development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/dart\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/dart.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.dart\.package {#opt-perSystem.devenv.shells._name_.languages.dart.package}



The Dart package to use\.



*Type:*
package



*Default:*
` pkgs.dart `

*Declared by:*
 - [devenv/src/modules/languages/dart\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/dart.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.deno\.enable {#opt-perSystem.devenv.shells._name_.languages.deno.enable}



Whether to enable tools for Deno development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/deno\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/deno.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.deno\.package {#opt-perSystem.devenv.shells._name_.languages.deno.package}



Which package of Deno to use\.



*Type:*
package



*Default:*
` pkgs.deno `

*Declared by:*
 - [devenv/src/modules/languages/deno\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/deno.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.dotnet\.enable {#opt-perSystem.devenv.shells._name_.languages.dotnet.enable}



Whether to enable tools for \.NET development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/dotnet\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/dotnet.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.dotnet\.package {#opt-perSystem.devenv.shells._name_.languages.dotnet.package}



The \.NET SDK package to use\.



*Type:*
package



*Default:*
` pkgs.dotnet-sdk `

*Declared by:*
 - [devenv/src/modules/languages/dotnet\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/dotnet.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.dotnet\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.dotnet.lsp.enable}



Whether to enable \.NET Language Server\.



*Type:*
boolean



*Default:*
` true ` if csharp-ls is available on the host platform, ` false ` otherwise



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/dotnet\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/dotnet.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.dotnet\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.dotnet.lsp.package}



The \.NET language server package to use\.



*Type:*
package



*Default:*
` pkgs.csharp-ls `

*Declared by:*
 - [devenv/src/modules/languages/dotnet\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/dotnet.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.elixir\.enable {#opt-perSystem.devenv.shells._name_.languages.elixir.enable}



Whether to enable tools for Elixir development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/elixir\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/elixir.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.elixir\.package {#opt-perSystem.devenv.shells._name_.languages.elixir.package}



Which Elixir package to use\.



*Type:*
package



*Default:*
` pkgs.elixir `

*Declared by:*
 - [devenv/src/modules/languages/elixir\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/elixir.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.elixir\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.elixir.lsp.enable}



Whether to enable Elixir Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/elixir\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/elixir.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.elixir\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.elixir.lsp.package}



The Elixir language server package to use\.



*Type:*
package



*Default:*
` pkgs.elixir-ls `

*Declared by:*
 - [devenv/src/modules/languages/elixir\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/elixir.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.elm\.enable {#opt-perSystem.devenv.shells._name_.languages.elm.enable}



Whether to enable tools for Elm development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/elm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/elm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.elm\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.elm.lsp.enable}



Whether to enable Elm Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/elm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/elm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.elm\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.elm.lsp.package}



The Elm language server package to use\.



*Type:*
package



*Default:*
` pkgs.elmPackages.elm-language-server `

*Declared by:*
 - [devenv/src/modules/languages/elm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/elm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.erlang\.enable {#opt-perSystem.devenv.shells._name_.languages.erlang.enable}



Whether to enable tools for Erlang development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/erlang\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/erlang.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.erlang\.package {#opt-perSystem.devenv.shells._name_.languages.erlang.package}



Which Erlang package to use\.



*Type:*
package



*Default:*
` pkgs.erlang `

*Declared by:*
 - [devenv/src/modules/languages/erlang\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/erlang.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.erlang\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.erlang.lsp.enable}



Whether to enable Erlang Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/erlang\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/erlang.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.erlang\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.erlang.lsp.package}



The Erlang language server package to use\.



*Type:*
package



*Default:*
` pkgs.erlang-language-platform `

*Declared by:*
 - [devenv/src/modules/languages/erlang\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/erlang.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.fortran\.enable {#opt-perSystem.devenv.shells._name_.languages.fortran.enable}



Whether to enable tools for Fortran Development…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/fortran\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/fortran.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.fortran\.package {#opt-perSystem.devenv.shells._name_.languages.fortran.package}



The Fortran package to use\.



*Type:*
package



*Default:*
` pkgs.gfortran `

*Declared by:*
 - [devenv/src/modules/languages/fortran\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/fortran.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.fortran\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.fortran.lsp.enable}



Whether to enable Fortran Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/fortran\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/fortran.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.fortran\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.fortran.lsp.package}



The Fortran language server package to use\.



*Type:*
package



*Default:*
` pkgs.fortls `

*Declared by:*
 - [devenv/src/modules/languages/fortran\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/fortran.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.gawk\.enable {#opt-perSystem.devenv.shells._name_.languages.gawk.enable}



Whether to enable tools for GNU Awk development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/gawk\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/gawk.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.gleam\.enable {#opt-perSystem.devenv.shells._name_.languages.gleam.enable}



Whether to enable tools for Gleam development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/gleam\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/gleam.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.gleam\.package {#opt-perSystem.devenv.shells._name_.languages.gleam.package}



The Gleam package to use\.



*Type:*
package



*Default:*
` pkgs.gleam `

*Declared by:*
 - [devenv/src/modules/languages/gleam\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/gleam.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.go\.enable {#opt-perSystem.devenv.shells._name_.languages.go.enable}



Whether to enable tools for Go development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/go\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/go.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.go\.enableHardeningWorkaround {#opt-perSystem.devenv.shells._name_.languages.go.enableHardeningWorkaround}



Enable hardening workaround required for Delve debugger (https://github\.com/go-delve/delve/issues/3085)



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/go\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/go.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.go\.package {#opt-perSystem.devenv.shells._name_.languages.go.package}



The Go package to use\.



*Type:*
package



*Default:*
` pkgs.go `

*Declared by:*
 - [devenv/src/modules/languages/go\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/go.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.go\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.go.lsp.enable}



Whether to enable Go Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/go\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/go.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.go\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.go.lsp.package}



The Go language server package to use\.



*Type:*
package



*Default:*
` pkgs.gopls `

*Declared by:*
 - [devenv/src/modules/languages/go\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/go.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.go\.version {#opt-perSystem.devenv.shells._name_.languages.go.version}

The Go version to use\.
This automatically sets the ` languages.go.package ` using [go-overlay](https://github\.com/purpleclay/go-overlay)\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "1.22.0" `

*Declared by:*
 - [devenv/src/modules/languages/go\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/go.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.enable {#opt-perSystem.devenv.shells._name_.languages.haskell.enable}



Whether to enable tools for Haskell development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.package {#opt-perSystem.devenv.shells._name_.languages.haskell.package}



Haskell compiler to use\.



*Type:*
package



*Default:*
` pkgs.ghc `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.cabal\.enable {#opt-perSystem.devenv.shells._name_.languages.haskell.cabal.enable}



Whether to enable Cabal\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.cabal\.package {#opt-perSystem.devenv.shells._name_.languages.haskell.cabal.package}



Cabal package to use\.



*Type:*
package



*Default:*
` pkgs.cabal-install `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.haskell.lsp.enable}



Whether to enable Haskell Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.haskell.lsp.package}



The Haskell language server package to use\.



*Type:*
package



*Default:*
` pkgs.haskell-language-server `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.stack\.enable {#opt-perSystem.devenv.shells._name_.languages.haskell.stack.enable}



Whether to enable the Haskell Stack



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.stack\.package {#opt-perSystem.devenv.shells._name_.languages.haskell.stack.package}



Haskell stack package to use\.



*Type:*
package



*Default:*
` pkgs.stack `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.haskell\.stack\.args {#opt-perSystem.devenv.shells._name_.languages.haskell.stack.args}



Additional arguments to pass to stack\.
By default, stack is configured to use devenv’s GHC installation\.



*Type:*
list of string



*Default:*
` [ "--no-nix" "--system-ghc" "--no-install-ghc" ] `

*Declared by:*
 - [devenv/src/modules/languages/haskell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/haskell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.helm\.enable {#opt-perSystem.devenv.shells._name_.languages.helm.enable}



Whether to enable tools for Helm development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/helm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/helm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.helm\.package {#opt-perSystem.devenv.shells._name_.languages.helm.package}



The Helm package to use\.



*Type:*
package



*Default:*
` pkgs.kubernetes-helm `

*Declared by:*
 - [devenv/src/modules/languages/helm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/helm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.helm\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.helm.lsp.enable}



Whether to enable Helm Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/helm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/helm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.helm\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.helm.lsp.package}



The Helm language server package to use\.



*Type:*
package



*Default:*
` pkgs.helm-ls `

*Declared by:*
 - [devenv/src/modules/languages/helm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/helm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.helm\.plugins {#opt-perSystem.devenv.shells._name_.languages.helm.plugins}



List of Helm plugin names to include from pkgs\.kubernetes-helmPlugins\.

They will be symlinked into one directory and exposed via HELM_PLUGINS\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "helm-secrets"
  "helm-diff"
  "helm-unittest"
]
```

*Declared by:*
 - [devenv/src/modules/languages/helm\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/helm.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.idris\.enable {#opt-perSystem.devenv.shells._name_.languages.idris.enable}



Whether to enable tools for Idris development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/idris\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/idris.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.idris\.package {#opt-perSystem.devenv.shells._name_.languages.idris.package}



The Idris package to use\.



*Type:*
package



*Default:*
` pkgs.idris2 `



*Example:*
` pkgs.idris `

*Declared by:*
 - [devenv/src/modules/languages/idris\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/idris.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.idris\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.idris.lsp.enable}



Whether to enable Idris Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/idris\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/idris.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.idris\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.idris.lsp.package}



The Idris language server package to use\.



*Type:*
package



*Default:*
` pkgs.idris2Packages.idris2Lsp `

*Declared by:*
 - [devenv/src/modules/languages/idris\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/idris.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.enable {#opt-perSystem.devenv.shells._name_.languages.java.enable}



Whether to enable tools for Java development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.gradle\.enable {#opt-perSystem.devenv.shells._name_.languages.java.gradle.enable}



Whether to enable gradle\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.gradle\.package {#opt-perSystem.devenv.shells._name_.languages.java.gradle.package}



The Gradle package to use\.
The Gradle package by default inherits the JDK from ` languages.java.jdk.package `\.



*Type:*
package



*Default:*
` pkgs.gradle.override { java = cfg.jdk.package; } `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.jdk\.package {#opt-perSystem.devenv.shells._name_.languages.java.jdk.package}



The JDK package to use\.
This will also become available as ` JAVA_HOME `\.



*Type:*
package



*Default:*
` pkgs.jdk `



*Example:*
` pkgs.jdk8 `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.java.lsp.enable}



Whether to enable Java Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.java.lsp.package}



The Java language server package to use\.



*Type:*
package



*Default:*
` pkgs.jdt-language-server `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.maven\.enable {#opt-perSystem.devenv.shells._name_.languages.java.maven.enable}



Whether to enable maven\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.java\.maven\.package {#opt-perSystem.devenv.shells._name_.languages.java.maven.package}



The Maven package to use\.
The Maven package by default inherits the JDK from ` languages.java.jdk.package `\.



*Type:*
package



*Default:*
` pkgs.maven.override { jdk_headless = cfg.jdk.package; } `

*Declared by:*
 - [devenv/src/modules/languages/java\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/java.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.enable}



Whether to enable tools for JavaScript development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.package {#opt-perSystem.devenv.shells._name_.languages.javascript.package}



The Node\.js package to use\.



*Type:*
package



*Default:*
` pkgs.nodejs-slim `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.bun\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.bun.enable}



Whether to enable install bun\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.bun\.package {#opt-perSystem.devenv.shells._name_.languages.javascript.bun.package}



The bun package to use\.



*Type:*
package



*Default:*
` pkgs.bun `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.bun\.install\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.bun.install.enable}



Whether to enable bun install during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.corepack\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.corepack.enable}



Whether to enable wrappers for npm, pnpm and Yarn via Node\.js Corepack\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.directory {#opt-perSystem.devenv.shells._name_.languages.javascript.directory}



The JavaScript project’s root directory\. Defaults to the root of the devenv project\.
Can be an absolute path or one relative to the root of the devenv project\.



*Type:*
string



*Default:*
` config.devenv.root `



*Example:*
` "./directory" `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.lsp.enable}



Whether to enable TypeScript Language Server for JavaScript\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.javascript.lsp.package}



The TypeScript/JavaScript language server package to use\.



*Type:*
package



*Default:*
` pkgs.typescript-language-server `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.npm\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.npm.enable}



Whether to enable install npm\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.npm\.package {#opt-perSystem.devenv.shells._name_.languages.javascript.npm.package}



The Node\.js package to use\.



*Type:*
package



*Default:*
` languages.javascript.package `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.npm\.install\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.npm.install.enable}



Whether to enable npm install during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.pnpm\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.pnpm.enable}



Whether to enable install pnpm\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.pnpm\.package {#opt-perSystem.devenv.shells._name_.languages.javascript.pnpm.package}



The pnpm package to use\.



*Type:*
package



*Default:*
` pkgs.nodePackages.pnpm `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.pnpm\.install\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.pnpm.install.enable}



Whether to enable pnpm install during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.yarn\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.yarn.enable}



Whether to enable install yarn\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.yarn\.package {#opt-perSystem.devenv.shells._name_.languages.javascript.yarn.package}



The yarn package to use\.



*Type:*
package



*Default:*
` pkgs.yarn `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.javascript\.yarn\.install\.enable {#opt-perSystem.devenv.shells._name_.languages.javascript.yarn.install.enable}



Whether to enable yarn install during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/javascript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.jsonnet\.enable {#opt-perSystem.devenv.shells._name_.languages.jsonnet.enable}



Whether to enable tools for jsonnet development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/jsonnet\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/jsonnet.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.jsonnet\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.jsonnet.lsp.enable}



Whether to enable Jsonnet Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/jsonnet\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/jsonnet.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.jsonnet\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.jsonnet.lsp.package}



The Jsonnet language server package to use\.



*Type:*
package



*Default:*
` pkgs.jsonnet-language-server `

*Declared by:*
 - [devenv/src/modules/languages/jsonnet\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/jsonnet.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.julia\.enable {#opt-perSystem.devenv.shells._name_.languages.julia.enable}



Whether to enable tools for Julia development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/julia\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/julia.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.julia\.package {#opt-perSystem.devenv.shells._name_.languages.julia.package}



The Julia package to use\.



*Type:*
package



*Default:*
` pkgs.julia-bin `

*Declared by:*
 - [devenv/src/modules/languages/julia\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/julia.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.kotlin\.enable {#opt-perSystem.devenv.shells._name_.languages.kotlin.enable}



Whether to enable tools for Kotlin development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/kotlin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/kotlin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.kotlin\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.kotlin.lsp.enable}



Whether to enable Kotlin Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/kotlin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/kotlin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.kotlin\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.kotlin.lsp.package}



The Kotlin language server package to use\.



*Type:*
package



*Default:*
` pkgs.kotlin-language-server `

*Declared by:*
 - [devenv/src/modules/languages/kotlin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/kotlin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.lean4\.enable {#opt-perSystem.devenv.shells._name_.languages.lean4.enable}



Whether to enable tools for lean4 development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/lean4\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/lean4.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.lean4\.package {#opt-perSystem.devenv.shells._name_.languages.lean4.package}



The lean4 package to use\.



*Type:*
package



*Default:*
` pkgs.lean4 `

*Declared by:*
 - [devenv/src/modules/languages/lean4\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/lean4.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.lua\.enable {#opt-perSystem.devenv.shells._name_.languages.lua.enable}



Whether to enable tools for Lua development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/lua\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/lua.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.lua\.package {#opt-perSystem.devenv.shells._name_.languages.lua.package}



The Lua package to use\.



*Type:*
package



*Default:*
` pkgs.lua `

*Declared by:*
 - [devenv/src/modules/languages/lua\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/lua.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.lua\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.lua.lsp.enable}



Whether to enable Lua Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/lua\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/lua.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.lua\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.lua.lsp.package}



The Lua language server package to use\.



*Type:*
package



*Default:*
` pkgs.lua-language-server `

*Declared by:*
 - [devenv/src/modules/languages/lua\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/lua.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.nim\.enable {#opt-perSystem.devenv.shells._name_.languages.nim.enable}



Whether to enable tools for Nim development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/nim\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/nim.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.nim\.package {#opt-perSystem.devenv.shells._name_.languages.nim.package}



The Nim package to use\.



*Type:*
package



*Default:*
` pkgs.nim `

*Declared by:*
 - [devenv/src/modules/languages/nim\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/nim.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.nim\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.nim.lsp.enable}



Whether to enable Nim Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/nim\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/nim.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.nim\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.nim.lsp.package}



The Nim language server package to use\.



*Type:*
package



*Default:*
` pkgs.nimlangserver `

*Declared by:*
 - [devenv/src/modules/languages/nim\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/nim.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.nix\.enable {#opt-perSystem.devenv.shells._name_.languages.nix.enable}



Whether to enable tools for Nix development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/nix\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/nix.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.nix\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.nix.lsp.enable}



Whether to enable Nix Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/nix\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/nix.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.nix\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.nix.lsp.package}



The Nix language server package to use\.



*Type:*
package



*Default:*
` pkgs.nixd `

*Declared by:*
 - [devenv/src/modules/languages/nix\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/nix.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ocaml\.enable {#opt-perSystem.devenv.shells._name_.languages.ocaml.enable}



Whether to enable tools for OCaml development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ocaml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ocaml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ocaml\.packages {#opt-perSystem.devenv.shells._name_.languages.ocaml.packages}



The package set of OCaml to use



*Type:*
attribute set



*Default:*
` pkgs.ocaml-ng.ocamlPackages_4_12 `

*Declared by:*
 - [devenv/src/modules/languages/ocaml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ocaml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ocaml\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.ocaml.lsp.enable}



Whether to enable OCaml Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ocaml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ocaml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ocaml\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.ocaml.lsp.package}



The OCaml language server package to use\.



*Type:*
package



*Default:*
` pkgs.ocamlPackages.ocaml-lsp `

*Declared by:*
 - [devenv/src/modules/languages/ocaml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ocaml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.odin\.enable {#opt-perSystem.devenv.shells._name_.languages.odin.enable}



Whether to enable tools for Odin Language\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/odin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/odin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.odin\.package {#opt-perSystem.devenv.shells._name_.languages.odin.package}



The odin package to use\.



*Type:*
package



*Default:*
` pkgs.odin `

*Declared by:*
 - [devenv/src/modules/languages/odin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/odin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.odin\.debugger {#opt-perSystem.devenv.shells._name_.languages.odin.debugger}



An optional debugger package to use with odin\.
The default is ` gdb `, if supported on the current system\.



*Type:*
null or package



*Default:*
` pkgs.gdb `

*Declared by:*
 - [devenv/src/modules/languages/odin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/odin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.odin\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.odin.lsp.enable}



Whether to enable Odin Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/odin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/odin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.odin\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.odin.lsp.package}



The Odin language server package to use\.



*Type:*
package



*Default:*
` pkgs.ols `

*Declared by:*
 - [devenv/src/modules/languages/odin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/odin.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.opentofu\.enable {#opt-perSystem.devenv.shells._name_.languages.opentofu.enable}



Whether to enable tools for OpenTofu development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/opentofu\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/opentofu.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.opentofu\.package {#opt-perSystem.devenv.shells._name_.languages.opentofu.package}



The OpenTofu package to use\.



*Type:*
package



*Default:*
` pkgs.opentofu `

*Declared by:*
 - [devenv/src/modules/languages/opentofu\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/opentofu.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.opentofu\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.opentofu.lsp.enable}



Whether to enable OpenTofu Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/opentofu\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/opentofu.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.opentofu\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.opentofu.lsp.package}



The OpenTofu language server package to use\.



*Type:*
package



*Default:*
` pkgs.terraform-ls `

*Declared by:*
 - [devenv/src/modules/languages/opentofu\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/opentofu.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.pascal\.enable {#opt-perSystem.devenv.shells._name_.languages.pascal.enable}



Whether to enable tools for Pascal development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/pascal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/pascal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.pascal\.lazarus\.enable {#opt-perSystem.devenv.shells._name_.languages.pascal.lazarus.enable}



Whether to enable lazarus graphical IDE for the FreePascal language\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/pascal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/pascal.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.perl\.enable {#opt-perSystem.devenv.shells._name_.languages.perl.enable}



Whether to enable tools for Perl development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/perl\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/perl.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.perl\.packages {#opt-perSystem.devenv.shells._name_.languages.perl.packages}



Perl packages to include



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "Mojolicious"
]
```

*Declared by:*
 - [devenv/src/modules/languages/perl\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/perl.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.perl\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.perl.lsp.enable}



Whether to enable Perl Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/perl\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/perl.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.perl\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.perl.lsp.package}



The Perl language server package to use\.



*Type:*
package



*Default:*
` pkgs.perlnavigator `

*Declared by:*
 - [devenv/src/modules/languages/perl\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/perl.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.enable {#opt-perSystem.devenv.shells._name_.languages.php.enable}



Whether to enable tools for PHP development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.package {#opt-perSystem.devenv.shells._name_.languages.php.package}



Allows you to [override the default used package](https://nixos\.org/manual/nixpkgs/stable/\#ssec-php-user-guide)
to adjust the settings or add more extensions\. You can find the
extensions using ` devenv search 'php extensions' `



*Type:*
package



*Default:*
` pkgs.php `



*Example:*

```
pkgs.php.buildEnv {
  extensions = { all, enabled }: with all; enabled ++ [ xdebug ];
  extraConfig = ''
    memory_limit=1G
  '';
};

```

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.packages {#opt-perSystem.devenv.shells._name_.languages.php.packages}



Attribute set of packages including composer



*Type:*
submodule



*Default:*
` pkgs `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.packages\.composer {#opt-perSystem.devenv.shells._name_.languages.php.packages.composer}



composer package



*Type:*
null or package



*Default:*
` pkgs.phpPackages.composer `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.disableExtensions {#opt-perSystem.devenv.shells._name_.languages.php.disableExtensions}



PHP extensions to disable\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.extensions {#opt-perSystem.devenv.shells._name_.languages.php.extensions}



PHP extensions to enable\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.extraConfig {#opt-perSystem.devenv.shells._name_.languages.php.fpm.extraConfig}



Extra configuration that should be put in the global section of
the PHP-FPM configuration file\. Do not specify the options
` error_log ` or ` daemonize ` here, since they are generated by
NixOS\.



*Type:*
null or strings concatenated with “\\n”



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.phpOptions {#opt-perSystem.devenv.shells._name_.languages.php.fpm.phpOptions}



Options appended to the PHP configuration file ` php.ini `\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*

```
''
  date.timezone = "CET"
''
```

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools}



PHP-FPM pools\. If no pools are defined, the PHP-FPM
service is disabled\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  mypool = {
    user = "php";
    group = "php";
    phpPackage = pkgs.php;
    settings = {
      "pm" = "dynamic";
      "pm.max_children" = 75;
      "pm.start_servers" = 10;
      "pm.min_spare_servers" = 5;
      "pm.max_spare_servers" = 20;
      "pm.max_requests" = 500;
    };
  }
}
```

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools\.\<name>\.extraConfig {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools._name_.extraConfig}



Extra lines that go into the pool configuration\.
See the documentation on ` php-fpm.conf ` for
details on configuration directives\.



*Type:*
null or strings concatenated with “\\n”



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools\.\<name>\.listen {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools._name_.listen}



The address on which to accept FastCGI requests\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "/path/to/unix/socket" `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools\.\<name>\.phpEnv {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools._name_.phpEnv}



Environment variables used for this PHP-FPM pool\.



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  HOSTNAME = "$HOSTNAME";
  TMP = "/tmp";
  TMPDIR = "/tmp";
  TEMP = "/tmp";
}

```

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools\.\<name>\.phpOptions {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools._name_.phpOptions}



Options appended to the PHP configuration file ` php.ini ` used for this PHP-FPM pool\.



*Type:*
strings concatenated with “\\n”

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools\.\<name>\.phpPackage {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools._name_.phpPackage}



The PHP package to use for running this PHP-FPM pool\.



*Type:*
package



*Default:*
` phpfpm.phpPackage `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools\.\<name>\.settings {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools._name_.settings}



PHP-FPM pool directives\. Refer to the “List of pool directives” section of
[https://www\.php\.net/manual/en/install\.fpm\.configuration\.php"](https://www\.php\.net/manual/en/install\.fpm\.configuration\.php%22)
the manual for details\. Note that settings names must be
enclosed in quotes (e\.g\. ` "pm.max_children" ` instead of
` pm.max_children `)\.



*Type:*
attribute set of (string or signed integer or boolean)



*Default:*
` { } `



*Example:*

```
{
  "pm" = "dynamic";
  "pm.max_children" = 75;
  "pm.start_servers" = 10;
  "pm.min_spare_servers" = 5;
  "pm.max_spare_servers" = 20;
  "pm.max_requests" = 500;
}

```

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.pools\.\<name>\.socket {#opt-perSystem.devenv.shells._name_.languages.php.fpm.pools._name_.socket}



Path to the Unix socket file on which to accept FastCGI requests\.

This option is read-only and managed by NixOS\.



*Type:*
string *(read only)*



*Example:*
` config.env.DEVENV_STATE + "/php-fpm/<name>.sock" `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.fpm\.settings {#opt-perSystem.devenv.shells._name_.languages.php.fpm.settings}



PHP-FPM global directives\.

Refer to the “List of global php-fpm\.conf directives” section of
[https://www\.php\.net/manual/en/install\.fpm\.configuration\.php](https://www\.php\.net/manual/en/install\.fpm\.configuration\.php)
for details\.

Note that settings names must be enclosed in
quotes (e\.g\. ` "pm.max_children" ` instead of ` pm.max_children `)\.

You need not specify the options ` error_log ` or ` daemonize ` here, since
they are already set\.



*Type:*
attribute set of (string or signed integer or boolean)



*Default:*

```
{
  error_log = config.env.DEVENV_STATE + "/php-fpm/php-fpm.log";
}

```

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.ini {#opt-perSystem.devenv.shells._name_.languages.php.ini}



PHP\.ini directives\. Refer to the “List of php\.ini directives” of PHP’s



*Type:*
null or strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.php.lsp.enable}

Whether to enable PHP Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.php.lsp.package}



The PHP language server package to use\.



*Type:*
package



*Default:*
` pkgs.phpactor `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.php\.version {#opt-perSystem.devenv.shells._name_.languages.php.version}



The PHP version to use\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/languages/php\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/php.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.purescript\.enable {#opt-perSystem.devenv.shells._name_.languages.purescript.enable}



Whether to enable tools for PureScript development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/purescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/purescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.purescript\.package {#opt-perSystem.devenv.shells._name_.languages.purescript.package}



The PureScript compiler package to use\.
Uses [purescript-overlay](https://github\.com/thomashoneyman/purescript-overlay) by default\.



*Type:*
package



*Default:*
` purescript-overlay.packages.${pkgs.stdenv.system}.purs `

*Declared by:*
 - [devenv/src/modules/languages/purescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/purescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.purescript\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.purescript.lsp.enable}



Whether to enable PureScript Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/purescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/purescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.purescript\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.purescript.lsp.package}



The PureScript language server package to use\.
Uses [purescript-overlay](https://github\.com/thomashoneyman/purescript-overlay) by default\.



*Type:*
package



*Default:*
` purescript-overlay.packages.${pkgs.stdenv.system}.purescript-language-server `

*Declared by:*
 - [devenv/src/modules/languages/purescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/purescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.purescript\.spago\.enable {#opt-perSystem.devenv.shells._name_.languages.purescript.spago.enable}



Whether to enable Spago package manager\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/purescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/purescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.purescript\.spago\.package {#opt-perSystem.devenv.shells._name_.languages.purescript.spago.package}



The Spago package manager to use\.
Uses [purescript-overlay](https://github\.com/thomashoneyman/purescript-overlay) by default\.



*Type:*
package



*Default:*
` purescript-overlay.packages.${pkgs.stdenv.system}.spago `

*Declared by:*
 - [devenv/src/modules/languages/purescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/purescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.enable {#opt-perSystem.devenv.shells._name_.languages.python.enable}



Whether to enable tools for Python development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.package {#opt-perSystem.devenv.shells._name_.languages.python.package}



The Python package to use\.



*Type:*
package



*Default:*
` pkgs.python3 `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.directory {#opt-perSystem.devenv.shells._name_.languages.python.directory}



The Python project’s root directory\. Defaults to the root of the devenv project\.
Can be an absolute path or one relative to the root of the devenv project\.



*Type:*
string



*Default:*
` config.devenv.root `



*Example:*
` "./directory" `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.import {#opt-perSystem.devenv.shells._name_.languages.python.import}



Import a Python project using uv2nix\.

This function takes a path to a directory containing a pyproject\.toml file
and returns a derivation that builds the Python project using uv2nix\.

Example usage:

```nix
let
  mypackage = config.languages.python.import ./path/to/python/project {};
in {
  languages.python.enable = true;
  packages = [ mypackage ];
}
```



*Type:*
function that evaluates to a(n) function that evaluates to a(n) package

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.libraries {#opt-perSystem.devenv.shells._name_.languages.python.libraries}



Additional libraries to make available to the Python interpreter\.

This is useful when you want to use Python wheels that depend on native libraries\.



*Type:*
list of absolute path



*Default:*

```
[ "${config.devenv.dotfile}/profile" ]

```

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.python.lsp.enable}



Whether to enable Python Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.python.lsp.package}



The Python language server package to use\.



*Type:*
package



*Default:*
` pkgs.pyright `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.manylinux\.enable {#opt-perSystem.devenv.shells._name_.languages.python.manylinux.enable}



Whether to install manylinux2014 libraries\.

Enabled by default on linux;

This is useful when you want to use Python wheels that depend on manylinux2014 libraries\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.patches\.buildEnv\.enable {#opt-perSystem.devenv.shells._name_.languages.python.patches.buildEnv.enable}



Whether to apply fixes to Python’s ` buildEnv ` for correct runtime initialization:

 - Executables use ` --inherit-argv0 ` and ` --resolve-argv0 ` to ensure Python initializes with correct ` sys.prefix ` and ` sys.base_prefix `
 - Python package scripts are unwrapped to invoke the environment’s interpreter directly

Without these fixes, venvs cannot access environment packages via ` --system-site-packages `\.

Enabled by default\.
Newer nixpkgs releases may include upstream fixes that make this patch obsolete\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.enable {#opt-perSystem.devenv.shells._name_.languages.python.poetry.enable}



Whether to enable poetry\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.package {#opt-perSystem.devenv.shells._name_.languages.python.poetry.package}



The Poetry package to use\.



*Type:*
package



*Default:*
` pkgs.poetry `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.activate\.enable {#opt-perSystem.devenv.shells._name_.languages.python.poetry.activate.enable}



Whether to activate the poetry virtual environment automatically\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.enable {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.enable}



Whether to enable poetry install during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.allExtras {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.allExtras}



Whether to install all extras\. See ` --all-extras `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.allGroups {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.allGroups}



Whether to install all groups\. See ` --all-groups `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.compile {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.compile}



Whether ` poetry install ` should compile Python source files to bytecode\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.extras {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.extras}



Which extras to install\. See ` --extras `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.groups {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.groups}



Which dependency groups to install\. See ` --with `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.ignoredGroups {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.ignoredGroups}



Which dependency groups to ignore\. See ` --without `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.installRootPackage {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.installRootPackage}



Whether the root package (your project) should be installed\. See ` --no-root `



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.onlyGroups {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.onlyGroups}



Which dependency groups to exclusively install\. See ` --only `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.onlyInstallRootPackage {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.onlyInstallRootPackage}



Whether to only install the root package (your project) should be installed, but no dependencies\. See ` --only-root `



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.quiet {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.quiet}



Whether ` poetry install ` should avoid outputting messages during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.poetry\.install\.verbosity {#opt-perSystem.devenv.shells._name_.languages.python.poetry.install.verbosity}



What level of verbosity the output of ` poetry install ` should have\.



*Type:*
one of “no”, “little”, “more”, “debug”



*Default:*
` "no" `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.enable {#opt-perSystem.devenv.shells._name_.languages.python.uv.enable}



Whether to enable uv\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.package {#opt-perSystem.devenv.shells._name_.languages.python.uv.package}



The uv package to use\.



*Type:*
package



*Default:*
` pkgs.uv `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.enable {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.enable}



Whether to enable uv sync during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.packages {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.packages}



Sync for specific packages in the workspace\. See ` --package `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.allExtras {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.allExtras}



Whether to install all extras\. See ` --all-extras `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.allGroups {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.allGroups}



Whether to install all groups\. See ` --all-groups `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.allPackages {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.allPackages}



Sync all packages in the workspace\. See ` --all-packages `\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.arguments {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.arguments}



Command line arguments pass to ` uv sync ` during devenv initialisation\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.extras {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.extras}



Which extras to install\. See ` --extra `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.uv\.sync\.groups {#opt-perSystem.devenv.shells._name_.languages.python.uv.sync.groups}



Which dependency groups to install\. See ` --group `\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.venv\.enable {#opt-perSystem.devenv.shells._name_.languages.python.venv.enable}



Whether to enable Python virtual environment\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.venv\.quiet {#opt-perSystem.devenv.shells._name_.languages.python.venv.quiet}



Whether ` pip install ` should avoid outputting messages during devenv initialisation\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.venv\.requirements {#opt-perSystem.devenv.shells._name_.languages.python.venv.requirements}



Contents of pip requirements\.txt file\.
This is passed to ` pip install -r ` during ` devenv shell ` initialisation\.



*Type:*
null or strings concatenated with “\\n” or absolute path



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.python\.version {#opt-perSystem.devenv.shells._name_.languages.python.version}



The Python version to use\.
This automatically sets the ` languages.python.package ` using [nixpkgs-python](https://github\.com/cachix/nixpkgs-python)\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "3.11 or 3.11.2" `

*Declared by:*
 - [devenv/src/modules/languages/python](https://github.com/cachix/devenv/blob/main/src/modules/languages/python)



## perSystem\.devenv\.shells\.\<name>\.languages\.r\.enable {#opt-perSystem.devenv.shells._name_.languages.r.enable}



Whether to enable tools for R development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/r\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/r.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.r\.package {#opt-perSystem.devenv.shells._name_.languages.r.package}



The R package to use\.



*Type:*
package



*Default:*
` pkgs.R `

*Declared by:*
 - [devenv/src/modules/languages/r\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/r.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.r\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.r.lsp.enable}



Whether to enable R Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/r\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/r.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.r\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.r.lsp.package}



The R language server package to use\.



*Type:*
package



*Default:*
` pkgs.rPackages.languageserver `

*Declared by:*
 - [devenv/src/modules/languages/r\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/r.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.r\.radian\.enable {#opt-perSystem.devenv.shells._name_.languages.r.radian.enable}



Whether to enable a 21 century R console\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/r\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/r.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.r\.radian\.package {#opt-perSystem.devenv.shells._name_.languages.r.radian.package}



The radian package to use\.



*Type:*
package



*Default:*
` pkgs.radianWrapper `

*Declared by:*
 - [devenv/src/modules/languages/r\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/r.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.racket\.enable {#opt-perSystem.devenv.shells._name_.languages.racket.enable}



Whether to enable tools for Racket development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/racket\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/racket.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.racket\.package {#opt-perSystem.devenv.shells._name_.languages.racket.package}



The Racket package to use\.



*Type:*
package



*Default:*
` pkgs.racket-minimal `

*Declared by:*
 - [devenv/src/modules/languages/racket\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/racket.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.raku\.enable {#opt-perSystem.devenv.shells._name_.languages.raku.enable}



Whether to enable tools for Raku development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/raku\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/raku.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.robotframework\.enable {#opt-perSystem.devenv.shells._name_.languages.robotframework.enable}



Whether to enable tools for Robot Framework development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/robotframework\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/robotframework.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.robotframework\.python {#opt-perSystem.devenv.shells._name_.languages.robotframework.python}



The Python package to use\.



*Type:*
package



*Default:*
` pkgs.python3 `

*Declared by:*
 - [devenv/src/modules/languages/robotframework\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/robotframework.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.enable {#opt-perSystem.devenv.shells._name_.languages.ruby.enable}



Whether to enable tools for Ruby development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.package {#opt-perSystem.devenv.shells._name_.languages.ruby.package}



The Ruby package to use\.



*Type:*
package



*Default:*
` pkgs.ruby `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.bundler\.enable {#opt-perSystem.devenv.shells._name_.languages.ruby.bundler.enable}



Whether to enable bundler\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.bundler\.package {#opt-perSystem.devenv.shells._name_.languages.ruby.bundler.package}



The bundler package to use\.



*Type:*
package



*Default:*
` pkgs.bundler.override { ruby = cfg.package; } `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.documentation\.enable {#opt-perSystem.devenv.shells._name_.languages.ruby.documentation.enable}



Whether to enable documentation support for Ruby packages\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.ruby.lsp.enable}



Whether to enable Ruby Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.ruby.lsp.package}



The Ruby language server package to use\.



*Type:*
package



*Default:*
` pkgs.solargraph.override { ruby = cfg.package; } `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.version {#opt-perSystem.devenv.shells._name_.languages.ruby.version}



The Ruby version to use\.
This automatically sets the ` languages.ruby.package ` using [nixpkgs-ruby](https://github\.com/bobvanderlinden/nixpkgs-ruby)\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "3.2.1" `

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.ruby\.versionFile {#opt-perSystem.devenv.shells._name_.languages.ruby.versionFile}



The \.ruby-version file path to extract the Ruby version from\.
This automatically sets the ` languages.ruby.package ` using [nixpkgs-ruby](https://github\.com/bobvanderlinden/nixpkgs-ruby)\.
When the ` .ruby-version ` file exists in the same directory as the devenv configuration, you can use:

```nix
languages.ruby.versionFile = ./.ruby-version;
```



*Type:*
null or absolute path



*Default:*
` null `



*Example:*

```
./.ruby-version

```

*Declared by:*
 - [devenv/src/modules/languages/ruby\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/ruby.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.enable {#opt-perSystem.devenv.shells._name_.languages.rust.enable}



Whether to enable tools for Rust development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.channel {#opt-perSystem.devenv.shells._name_.languages.rust.channel}



The rustup toolchain to install\.



*Type:*
one of “nixpkgs”, “stable”, “beta”, “nightly”



*Default:*
` "nixpkgs" `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.components {#opt-perSystem.devenv.shells._name_.languages.rust.components}



List of [Rustup components](https://rust-lang\.github\.io/rustup/concepts/components\.html)
to install\. Defaults to those available in ` nixpkgs `\.



*Type:*
list of string



*Default:*
` [ "rustc" "cargo" "clippy" "rustfmt" "rust-analyzer" ] `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.import {#opt-perSystem.devenv.shells._name_.languages.rust.import}



Import a Cargo project using cargo2nix\.

This function takes a path to a directory containing a Cargo\.toml file
and returns a derivation that builds the Rust project using cargo2nix\.

Example usage:

```nix
let
mypackage = config.languages.rust.import ./path/to/cargo/project {};
in {
languages.rust.enable = true;
packages = [ mypackage ];
}
```



*Type:*
function that evaluates to a(n) function that evaluates to a(n) package

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.rust.lsp.enable}



Whether to enable Rust Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.rust.lsp.package}



The Rust language server package to use\.



*Type:*
package



*Default:*
` pkgs.rust-analyzer `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.mold\.enable {#opt-perSystem.devenv.shells._name_.languages.rust.mold.enable}



Use [mold](https://github\.com/rui314/mold) as the linker\.

mold is a faster drop-in replacement for existing Unix linkers\.
It is several times quicker than the LLVM lld linker\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.rustflags {#opt-perSystem.devenv.shells._name_.languages.rust.rustflags}



Extra flags to pass to the Rust compiler\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.targets {#opt-perSystem.devenv.shells._name_.languages.rust.targets}



List of extra [targets](https://doc\.rust-lang\.org/nightly/rustc/platform-support\.html)
to install\. Defaults to only the native target\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchain {#opt-perSystem.devenv.shells._name_.languages.rust.toolchain}



Rust component packages\. May optionally define additional components, for example ` miri `\.



*Type:*
open submodule of attribute set of package



*Default:*
` nixpkgs `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchain\.cargo {#opt-perSystem.devenv.shells._name_.languages.rust.toolchain.cargo}



cargo package



*Type:*
null or package



*Default:*
` pkgs.cargo `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchain\.clippy {#opt-perSystem.devenv.shells._name_.languages.rust.toolchain.clippy}



clippy package



*Type:*
null or package



*Default:*
` pkgs.clippy `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchain\.rust-analyzer {#opt-perSystem.devenv.shells._name_.languages.rust.toolchain.rust-analyzer}



rust-analyzer package



*Type:*
null or package



*Default:*
` pkgs.rust-analyzer `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchain\.rustc {#opt-perSystem.devenv.shells._name_.languages.rust.toolchain.rustc}



rustc package



*Type:*
null or package



*Default:*
` pkgs.rustc `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchain\.rustfmt {#opt-perSystem.devenv.shells._name_.languages.rust.toolchain.rustfmt}



rustfmt package



*Type:*
null or package



*Default:*
` pkgs.rustfmt `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchainFile {#opt-perSystem.devenv.shells._name_.languages.rust.toolchainFile}



Path to a ` rust-toolchain ` or ` rust-toolchain.toml ` file for automatic toolchain configuration\.

When set, devenv will use rust-overlay’s ` fromRustupToolchainFile ` to automatically
configure the toolchain based on the file contents (channel, components, targets, profile)\.

This follows the standard Rust toolchain file format documented at:
https://rust-lang\.github\.io/rustup/overrides\.html\#the-toolchain-file

Cannot be used together with manual ` channel ` or ` version ` configuration\.

Example:

```nix
languages.rust.toolchainFile = ./rust-toolchain.toml;
```



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` ./rust-toolchain.toml `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.toolchainPackage {#opt-perSystem.devenv.shells._name_.languages.rust.toolchainPackage}



The aggregated toolchain package, which includes the configured components and targets\.
This is automatically set based on the channel and components configuration\.



*Type:*
package

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.rust\.version {#opt-perSystem.devenv.shells._name_.languages.rust.version}



Which version of rust to use, this value could be ` latest `,` 1.81.0 `, ` 2021-01-01 `\.
Only works when languages\.rust\.channel is NOT nixpkgs\.



*Type:*
string



*Default:*
` "latest" `

*Declared by:*
 - [devenv/src/modules/languages/rust\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/rust.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.enable {#opt-perSystem.devenv.shells._name_.languages.scala.enable}



Whether to enable tools for Scala development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.package {#opt-perSystem.devenv.shells._name_.languages.scala.package}



The Scala package to use\.



*Type:*
package



*Default:*
` pkgs.scala_3 `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.scala.lsp.enable}



Whether to enable Scala Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.scala.lsp.package}



The Scala language server package to use\.



*Type:*
package



*Default:*
` pkgs.metals `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.mill\.enable {#opt-perSystem.devenv.shells._name_.languages.scala.mill.enable}



Whether to enable mill, a simplified, fast build tool for Scala\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.mill\.package {#opt-perSystem.devenv.shells._name_.languages.scala.mill.package}



The mill package to use\.



*Type:*
package



*Default:*
` pkgs.mill `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.sbt\.enable {#opt-perSystem.devenv.shells._name_.languages.scala.sbt.enable}



Whether to enable sbt, the standard build tool for Scala\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.scala\.sbt\.package {#opt-perSystem.devenv.shells._name_.languages.scala.sbt.package}



The sbt package to use\.



*Type:*
package



*Default:*
` pkgs.sbt `



*Example:*
` sbt-with-scala-native `

*Declared by:*
 - [devenv/src/modules/languages/scala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/scala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.shell\.enable {#opt-perSystem.devenv.shells._name_.languages.shell.enable}



Whether to enable tools for shell development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/shell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/shell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.shell\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.shell.lsp.enable}



Whether to enable Shell Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/shell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/shell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.shell\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.shell.lsp.package}



The Shell language server package to use\.



*Type:*
package



*Default:*
` pkgs.bash-language-server `

*Declared by:*
 - [devenv/src/modules/languages/shell\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/shell.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.solidity\.enable {#opt-perSystem.devenv.shells._name_.languages.solidity.enable}



Whether to enable tools for Solidity development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/solidity\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/solidity.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.solidity\.package {#opt-perSystem.devenv.shells._name_.languages.solidity.package}



Which compiler of Solidity to use\.



*Type:*
package



*Default:*
` pkgs.solc `

*Declared by:*
 - [devenv/src/modules/languages/solidity\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/solidity.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.solidity\.foundry\.enable {#opt-perSystem.devenv.shells._name_.languages.solidity.foundry.enable}

Whether to enable install Foundry\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/solidity\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/solidity.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.solidity\.foundry\.package {#opt-perSystem.devenv.shells._name_.languages.solidity.foundry.package}



Which Foundry package to use\.



*Type:*
package



*Default:*
` foundry.defaultPackage.$${pkgs.stdenv.system} `

*Declared by:*
 - [devenv/src/modules/languages/solidity\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/solidity.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.standardml\.enable {#opt-perSystem.devenv.shells._name_.languages.standardml.enable}



Whether to enable tools for Standard ML development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/standardml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/standardml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.standardml\.package {#opt-perSystem.devenv.shells._name_.languages.standardml.package}



The Standard ML package to use\.



*Type:*
package



*Default:*
` pkgs.mlton `

*Declared by:*
 - [devenv/src/modules/languages/standardml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/standardml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.standardml\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.standardml.lsp.enable}



Whether to enable Standard ML Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/standardml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/standardml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.standardml\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.standardml.lsp.package}



The Standard ML language server package to use\.



*Type:*
package



*Default:*
` pkgs.millet `

*Declared by:*
 - [devenv/src/modules/languages/standardml\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/standardml.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.swift\.enable {#opt-perSystem.devenv.shells._name_.languages.swift.enable}



Whether to enable tools for Swift development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/swift\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/swift.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.swift\.package {#opt-perSystem.devenv.shells._name_.languages.swift.package}



The Swift package to use\.



*Type:*
package



*Default:*
` pkgs.swift `

*Declared by:*
 - [devenv/src/modules/languages/swift\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/swift.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.swift\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.swift.lsp.enable}



Whether to enable Swift Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/swift\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/swift.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.swift\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.swift.lsp.package}



The Swift language server package to use\.



*Type:*
package



*Default:*
` pkgs.sourcekit-lsp `

*Declared by:*
 - [devenv/src/modules/languages/swift\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/swift.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.terraform\.enable {#opt-perSystem.devenv.shells._name_.languages.terraform.enable}



Whether to enable tools for Terraform development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/terraform\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/terraform.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.terraform\.package {#opt-perSystem.devenv.shells._name_.languages.terraform.package}



The Terraform package to use\.



*Type:*
package



*Default:*
` pkgs.terraform `

*Declared by:*
 - [devenv/src/modules/languages/terraform\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/terraform.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.terraform\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.terraform.lsp.enable}



Whether to enable Terraform Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/terraform\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/terraform.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.terraform\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.terraform.lsp.package}



The Terraform language server package to use\.



*Type:*
package



*Default:*
` pkgs.terraform-ls `

*Declared by:*
 - [devenv/src/modules/languages/terraform\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/terraform.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.terraform\.version {#opt-perSystem.devenv.shells._name_.languages.terraform.version}



The Terraform version to use\.
This automatically sets the ` languages.terraform.package ` using [nixpkgs-terraform](https://github\.com/stackbuilders/nixpkgs-terraform)\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "1.5.0 or 1.6.2" `

*Declared by:*
 - [devenv/src/modules/languages/terraform\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/terraform.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.texlive\.enable {#opt-perSystem.devenv.shells._name_.languages.texlive.enable}



Whether to enable TeX Live\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/texlive\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/texlive.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.texlive\.packages {#opt-perSystem.devenv.shells._name_.languages.texlive.packages}



Extra packages to add to the base TeX Live set



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "algorithms"
  "latexmk"
]
```

*Declared by:*
 - [devenv/src/modules/languages/texlive\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/texlive.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.texlive\.base {#opt-perSystem.devenv.shells._name_.languages.texlive.base}



TeX Live package set to use



*Type:*
unspecified value



*Default:*
` pkgs.texliveSmall `



*Example:*
` pkgs.texliveBasic `

*Declared by:*
 - [devenv/src/modules/languages/texlive\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/texlive.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.texlive\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.texlive.lsp.enable}



Whether to enable TeX Live Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/texlive\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/texlive.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.texlive\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.texlive.lsp.package}



The TeX Live language server package to use\.



*Type:*
package



*Default:*
` pkgs.texlab `

*Declared by:*
 - [devenv/src/modules/languages/texlive\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/texlive.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typescript\.enable {#opt-perSystem.devenv.shells._name_.languages.typescript.enable}



Whether to enable tools for TypeScript development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/typescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typescript\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.typescript.lsp.enable}



Whether to enable TypeScript Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/typescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typescript\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.typescript.lsp.package}



The TypeScript language server package to use\.



*Type:*
package



*Default:*
` pkgs.typescript-language-server `

*Declared by:*
 - [devenv/src/modules/languages/typescript\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typescript.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typst\.enable {#opt-perSystem.devenv.shells._name_.languages.typst.enable}



Whether to enable tools for Typst development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/typst\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typst.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typst\.package {#opt-perSystem.devenv.shells._name_.languages.typst.package}



Which package of Typst to use\.



*Type:*
package



*Default:*
` pkgs.typst `

*Declared by:*
 - [devenv/src/modules/languages/typst\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typst.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typst\.fontPaths {#opt-perSystem.devenv.shells._name_.languages.typst.fontPaths}



Directories to be searched for fonts\.



*Type:*
list of string



*Default:*
` [] `



*Example:*
` [ "${pkgs.roboto}/share/fonts/truetype" ] `

*Declared by:*
 - [devenv/src/modules/languages/typst\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typst.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typst\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.typst.lsp.enable}



Whether to enable Typst Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/typst\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typst.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.typst\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.typst.lsp.package}



The Typst language server package to use\.



*Type:*
package



*Default:*
` pkgs.tinymist `

*Declared by:*
 - [devenv/src/modules/languages/typst\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/typst.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.unison\.enable {#opt-perSystem.devenv.shells._name_.languages.unison.enable}



Whether to enable tools for Unison development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/unison\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/unison.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.unison\.package {#opt-perSystem.devenv.shells._name_.languages.unison.package}



Which package of Unison to use



*Type:*
package



*Default:*
` pkgs.unison-ucm `

*Declared by:*
 - [devenv/src/modules/languages/unison\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/unison.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.v\.enable {#opt-perSystem.devenv.shells._name_.languages.v.enable}



Whether to enable tools for V development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/v\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/v.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.v\.package {#opt-perSystem.devenv.shells._name_.languages.v.package}



The V package to use\.



*Type:*
package



*Default:*
` pkgs.vlang `

*Declared by:*
 - [devenv/src/modules/languages/v\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/v.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.vala\.enable {#opt-perSystem.devenv.shells._name_.languages.vala.enable}



Whether to enable tools for Vala development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/vala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/vala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.vala\.package {#opt-perSystem.devenv.shells._name_.languages.vala.package}



The Vala package to use\.



*Type:*
package



*Default:*
` pkgs.vala `



*Example:*
` pkgs.vala_0_54 `

*Declared by:*
 - [devenv/src/modules/languages/vala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/vala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.vala\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.vala.lsp.enable}



Whether to enable Vala Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/vala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/vala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.vala\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.vala.lsp.package}



The Vala language server package to use\.



*Type:*
package



*Default:*
` pkgs.vala-language-server `

*Declared by:*
 - [devenv/src/modules/languages/vala\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/vala.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.zig\.enable {#opt-perSystem.devenv.shells._name_.languages.zig.enable}



Whether to enable tools for Zig development\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/zig\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/zig.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.zig\.package {#opt-perSystem.devenv.shells._name_.languages.zig.package}



Which package of Zig to use\.



*Type:*
package



*Default:*
` pkgs.zig `

*Declared by:*
 - [devenv/src/modules/languages/zig\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/zig.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.zig\.lsp\.enable {#opt-perSystem.devenv.shells._name_.languages.zig.lsp.enable}



Whether to enable Zig Language Server\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/languages/zig\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/zig.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.zig\.lsp\.package {#opt-perSystem.devenv.shells._name_.languages.zig.lsp.package}



The Zig language server package to use\.



*Type:*
package



*Default:*
` pkgs.zls `

*Declared by:*
 - [devenv/src/modules/languages/zig\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/zig.nix)



## perSystem\.devenv\.shells\.\<name>\.languages\.zig\.version {#opt-perSystem.devenv.shells._name_.languages.zig.version}



The Zig version to use\.
This automatically sets the ` languages.zig.package ` and ` languages.zig.lsp.package ` using [zig-overlay](https://github\.com/mitchellh/zig-overlay)\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "0.15.1" `

*Declared by:*
 - [devenv/src/modules/languages/zig\.nix](https://github.com/cachix/devenv/blob/main/src/modules/languages/zig.nix)



## perSystem\.devenv\.shells\.\<name>\.machines {#opt-perSystem.devenv.shells._name_.machines}



Machines for NixOS, home-manager, and nix-darwin\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/machines\.nix](https://github.com/cachix/devenv/blob/main/src/modules/machines.nix)



## perSystem\.devenv\.shells\.\<name>\.machines\.\<name>\.home-manager {#opt-perSystem.devenv.shells._name_.machines._name_.home-manager}



Home Manager configuration for the machine\.



*Type:*
null or unspecified value



*Default:*
` null `



*Example:*

```
{
  home.username = "jdoe";
  home.homeDirectory = "/home/jdoe";
  programs.git.enable = true;
}

```

*Declared by:*
 - [devenv/src/modules/machines\.nix](https://github.com/cachix/devenv/blob/main/src/modules/machines.nix)



## perSystem\.devenv\.shells\.\<name>\.machines\.\<name>\.nix-darwin {#opt-perSystem.devenv.shells._name_.machines._name_.nix-darwin}



nix-darwin configuration for the machine\.



*Type:*
null or unspecified value



*Default:*
` null `



*Example:*

```
{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.vim
  ];
  services.nix-daemon.enable = true;
}

```

*Declared by:*
 - [devenv/src/modules/machines\.nix](https://github.com/cachix/devenv/blob/main/src/modules/machines.nix)



## perSystem\.devenv\.shells\.\<name>\.machines\.\<name>\.nixos {#opt-perSystem.devenv.shells._name_.machines._name_.nixos}



NixOS configuration for the machine\.



*Type:*
null or unspecified value



*Default:*
` null `



*Example:*

```
{
  fileSystems."/".device = "/dev/sda1";
  boot.loader.systemd-boot.enable = true;
  services.openssh.enable = true;
}

```

*Declared by:*
 - [devenv/src/modules/machines\.nix](https://github.com/cachix/devenv/blob/main/src/modules/machines.nix)



## perSystem\.devenv\.shells\.\<name>\.machines\.\<name>\.system {#opt-perSystem.devenv.shells._name_.machines._name_.system}



System architecture for the machine\.



*Type:*
string



*Default:*
` pkgs.stdenv.system `



*Example:*
` "x86_64-linux" `

*Declared by:*
 - [devenv/src/modules/machines\.nix](https://github.com/cachix/devenv/blob/main/src/modules/machines.nix)



## perSystem\.devenv\.shells\.\<name>\.name {#opt-perSystem.devenv.shells._name_.name}



Name of the project\.



*Type:*
null or string



*Default:*
` "devenv-shell" `

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.outputs {#opt-perSystem.devenv.shells._name_.outputs}



Nix outputs for ` devenv build ` consumption\.



*Type:*
outputOf (attribute set)



*Default:*
` { } `



*Example:*

```
{
  git = pkgs.git;
  foo = {
    ncdu = pkgs.ncdu;
  };
}

```

*Declared by:*
 - [devenv/src/modules/outputs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/outputs.nix)



## perSystem\.devenv\.shells\.\<name>\.overlays {#opt-perSystem.devenv.shells._name_.overlays}



List of overlays to apply to pkgs\. Each overlay is a function that takes two arguments: final and prev\. Supported by devenv 1\.4\.2 or newer\.



*Type:*
list of function that evaluates to a(n) function that evaluates to a(n) (attribute set)



*Default:*
` [ ] `



*Example:*

```
[
  (final: prev: {
    hello = prev.hello.overrideAttrs (oldAttrs: {
      patches = (oldAttrs.patches or []) ++ [ ./hello-fix.patch ];
    });
  })
]

```

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.manager\.after {#opt-perSystem.devenv.shells._name_.process.manager.after}



Bash code to execute after stopping processes\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.manager\.args {#opt-perSystem.devenv.shells._name_.process.manager.args}



Additional arguments to pass to the process manager\.



*Type:*
attribute set

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.manager\.before {#opt-perSystem.devenv.shells._name_.process.manager.before}



Bash code to execute before starting processes\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.manager\.implementation {#opt-perSystem.devenv.shells._name_.process.manager.implementation}



The process manager to use when running processes with ` devenv up `\.



*Type:*
one of “hivemind”, “honcho”, “mprocs”, “overmind”, “process-compose”



*Default:*
` "process-compose" `



*Example:*
` "overmind" `

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.hivemind\.package {#opt-perSystem.devenv.shells._name_.process.managers.hivemind.package}



The hivemind package to use\.



*Type:*
package



*Default:*
` pkgs.hivemind `

*Declared by:*
 - [devenv/src/modules/process-managers/hivemind\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/hivemind.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.honcho\.package {#opt-perSystem.devenv.shells._name_.process.managers.honcho.package}



The honcho package to use\.



*Type:*
package



*Default:*
` pkgs.honcho `

*Declared by:*
 - [devenv/src/modules/process-managers/honcho\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/honcho.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.mprocs\.package {#opt-perSystem.devenv.shells._name_.process.managers.mprocs.package}



The mprocs package to use\.



*Type:*
package



*Default:*
` pkgs.mprocs `

*Declared by:*
 - [devenv/src/modules/process-managers/mprocs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/mprocs.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.mprocs\.settings {#opt-perSystem.devenv.shells._name_.process.managers.mprocs.settings}



Top-level mprocs\.yaml options

https://github\.com/pvolok/mprocs?tab=readme-ov-file\#config



*Type:*
YAML 1\.1 value



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/process-managers/mprocs\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/mprocs.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.overmind\.package {#opt-perSystem.devenv.shells._name_.process.managers.overmind.package}



The overmind package to use\.



*Type:*
package



*Default:*
` pkgs.overmind `

*Declared by:*
 - [devenv/src/modules/process-managers/overmind\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/overmind.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.process-compose\.package {#opt-perSystem.devenv.shells._name_.process.managers.process-compose.package}



The process-compose package to use\.



*Type:*
package



*Default:*
` pkgs.process-compose `

*Declared by:*
 - [devenv/src/modules/process-managers/process-compose\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/process-compose.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.process-compose\.port {#opt-perSystem.devenv.shells._name_.process.managers.process-compose.port}



The port to bind the process-compose server to\.

Not used when ` unixSocket.enable ` is true\.



*Type:*
signed integer



*Default:*
` 8080 `

*Declared by:*
 - [devenv/src/modules/process-managers/process-compose\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/process-compose.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.process-compose\.settings {#opt-perSystem.devenv.shells._name_.process.managers.process-compose.settings}



Top-level process-compose\.yaml options

Example: https://github\.com/F1bonacc1/process-compose/blob/main/process-compose\.yaml\`



*Type:*
YAML 1\.1 value



*Default:*
` { } `



*Example:*

```
{
  availability = {
    backoff_seconds = 2;
    max_restarts = 5;
    restart = "on_failure";
  };
  depends_on = {
    some-other-process = {
      condition = "process_completed_successfully";
    };
  };
  environment = [
    "ENVVAR_FOR_THIS_PROCESS_ONLY=foobar"
  ];
}
```

*Declared by:*
 - [devenv/src/modules/process-managers/process-compose\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/process-compose.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.process-compose\.tui\.enable {#opt-perSystem.devenv.shells._name_.process.managers.process-compose.tui.enable}



Enable the TUI (Terminal User Interface)



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/process-managers/process-compose\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/process-compose.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.process-compose\.unixSocket\.enable {#opt-perSystem.devenv.shells._name_.process.managers.process-compose.unixSocket.enable}



Whether to enable running the process-compose server over unix domain sockets instead of tcp\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/process-managers/process-compose\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/process-compose.nix)



## perSystem\.devenv\.shells\.\<name>\.process\.managers\.process-compose\.unixSocket\.path {#opt-perSystem.devenv.shells._name_.process.managers.process-compose.unixSocket.path}



Override the path to the unix socket\.



*Type:*
string



*Default:*
` ${config.devenv.runtime}/pc.sock `

*Declared by:*
 - [devenv/src/modules/process-managers/process-compose\.nix](https://github.com/cachix/devenv/blob/main/src/modules/process-managers/process-compose.nix)



## perSystem\.devenv\.shells\.\<name>\.processes {#opt-perSystem.devenv.shells._name_.processes}



Processes can be started with ` devenv up ` and run in the foreground\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.processes\.\<name>\.cwd {#opt-perSystem.devenv.shells._name_.processes._name_.cwd}



Working directory to run the process in\. If not specified, the current working directory will be used\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.processes\.\<name>\.exec {#opt-perSystem.devenv.shells._name_.processes._name_.exec}



Bash code to run the process\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.processes\.\<name>\.process-compose {#opt-perSystem.devenv.shells._name_.processes._name_.process-compose}



process-compose\.yaml specific process attributes\.

Example: https://github\.com/F1bonacc1/process-compose/blob/main/process-compose\.yaml\`

Only used when using ` process.manager.implementation = "process-compose"; `



*Type:*
YAML 1\.1 value



*Default:*
` { } `



*Example:*

```
{
  availability = {
    backoff_seconds = 2;
    max_restarts = 5;
    restart = "on_failure";
  };
  depends_on = {
    some-other-process = {
      condition = "process_completed_successfully";
    };
  };
  environment = [
    "ENVVAR_FOR_THIS_PROCESS_ONLY=foobar"
  ];
}
```

*Declared by:*
 - [devenv/src/modules/processes\.nix](https://github.com/cachix/devenv/blob/main/src/modules/processes.nix)



## perSystem\.devenv\.shells\.\<name>\.profiles {#opt-perSystem.devenv.shells._name_.profiles}



Profile definitions that can be activated manually or automatically\.



*Type:*
open submodule of lazy attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  # Manual profiles (activated via --profile)
  "base" = {
    module = {
      languages.nix.enable = true;
      packages = [ pkgs.git ];
    };
  };
  "python-3.14" = {
    extends = [ "base" ];
    module = {
      languages.python.version = "3.14";
    };
  };
  "backend" = {
    extends = [ "base" ];
    module = {
      services.postgres.enable = true;
      services.redis.enable = true;
    };
  };
  "fullstack" = {
    extends = [ "backend" "python-3.14" ];
    module = {
      env.FULL_STACK = "true";
    };
  };
  # Automatic hostname-based profiles
  hostname."work-laptop" = {
    extends = [ "backend" ];
    module = {
      env.WORK_ENV = "true";
    };
  };
  # Automatic user-based profiles
  user."alice" = {
    extends = [ "python-3.14" ];
    module = {
      env.USER_ROLE = "developer";
    };
  };
}

```

*Declared by:*
 - [devenv/src/modules/profiles\.nix](https://github.com/cachix/devenv/blob/main/src/modules/profiles.nix)



## perSystem\.devenv\.shells\.\<name>\.profiles\.hostname {#opt-perSystem.devenv.shells._name_.profiles.hostname}



Profile definitions that are automatically activated based on the machine’s hostname\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/profiles\.nix](https://github.com/cachix/devenv/blob/main/src/modules/profiles.nix)



## perSystem\.devenv\.shells\.\<name>\.profiles\.hostname\.\<name>\.extends {#opt-perSystem.devenv.shells._name_.profiles.hostname._name_.extends}



List of profile names to extend/inherit from\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "base"
  "backend"
]
```

*Declared by:*
 - [devenv/src/modules/profiles\.nix](https://github.com/cachix/devenv/blob/main/src/modules/profiles.nix)



## perSystem\.devenv\.shells\.\<name>\.profiles\.hostname\.\<name>\.module {#opt-perSystem.devenv.shells._name_.profiles.hostname._name_.module}



Additional configuration to merge when this profile is active\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/profiles\.nix](https://github.com/cachix/devenv/blob/main/src/modules/profiles.nix)



## perSystem\.devenv\.shells\.\<name>\.profiles\.user {#opt-perSystem.devenv.shells._name_.profiles.user}



Profile definitions that are automatically activated based on the username\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/profiles\.nix](https://github.com/cachix/devenv/blob/main/src/modules/profiles.nix)



## perSystem\.devenv\.shells\.\<name>\.profiles\.user\.\<name>\.extends {#opt-perSystem.devenv.shells._name_.profiles.user._name_.extends}



List of profile names to extend/inherit from\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "base"
  "backend"
]
```

*Declared by:*
 - [devenv/src/modules/profiles\.nix](https://github.com/cachix/devenv/blob/main/src/modules/profiles.nix)



## perSystem\.devenv\.shells\.\<name>\.profiles\.user\.\<name>\.module {#opt-perSystem.devenv.shells._name_.profiles.user._name_.module}



Additional configuration to merge when this profile is active\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/profiles\.nix](https://github.com/cachix/devenv/blob/main/src/modules/profiles.nix)



## perSystem\.devenv\.shells\.\<name>\.scripts {#opt-perSystem.devenv.shells._name_.scripts}



A set of scripts available when the environment is active\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/scripts\.nix](https://github.com/cachix/devenv/blob/main/src/modules/scripts.nix)



## perSystem\.devenv\.shells\.\<name>\.scripts\.\<name>\.package {#opt-perSystem.devenv.shells._name_.scripts._name_.package}



The package to use to run the script\.



*Type:*
package



*Default:*
` pkgs.bash `

*Declared by:*
 - [devenv/src/modules/scripts\.nix](https://github.com/cachix/devenv/blob/main/src/modules/scripts.nix)



## perSystem\.devenv\.shells\.\<name>\.scripts\.\<name>\.packages {#opt-perSystem.devenv.shells._name_.scripts._name_.packages}



Packages to be available in PATH when the script runs\.



*Type:*
list of package



*Default:*
` [] `

*Declared by:*
 - [devenv/src/modules/scripts\.nix](https://github.com/cachix/devenv/blob/main/src/modules/scripts.nix)



## perSystem\.devenv\.shells\.\<name>\.scripts\.\<name>\.binary {#opt-perSystem.devenv.shells._name_.scripts._name_.binary}



Override the binary name from the default ` package.meta.mainProgram `



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/scripts\.nix](https://github.com/cachix/devenv/blob/main/src/modules/scripts.nix)



## perSystem\.devenv\.shells\.\<name>\.scripts\.\<name>\.description {#opt-perSystem.devenv.shells._name_.scripts._name_.description}



Description of the script\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/scripts\.nix](https://github.com/cachix/devenv/blob/main/src/modules/scripts.nix)



## perSystem\.devenv\.shells\.\<name>\.scripts\.\<name>\.exec {#opt-perSystem.devenv.shells._name_.scripts._name_.exec}



Shell code to execute when the script is run, or path to a script file\.



*Type:*
string or absolute path

*Declared by:*
 - [devenv/src/modules/scripts\.nix](https://github.com/cachix/devenv/blob/main/src/modules/scripts.nix)



## perSystem\.devenv\.shells\.\<name>\.secretspec\.enable {#opt-perSystem.devenv.shells._name_.secretspec.enable}



Whether secretspec integration is enabled (automatically true when secrets are loaded)



*Type:*
boolean *(read only)*



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/integrations/secretspec\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/secretspec.nix)



## perSystem\.devenv\.shells\.\<name>\.secretspec\.profile {#opt-perSystem.devenv.shells._name_.secretspec.profile}



The secretspec profile that was used to load secrets (read-only)



*Type:*
null or string *(read only)*



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/secretspec\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/secretspec.nix)



## perSystem\.devenv\.shells\.\<name>\.secretspec\.provider {#opt-perSystem.devenv.shells._name_.secretspec.provider}



The secretspec provider that was used to load secrets (read-only)



*Type:*
null or string *(read only)*



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/integrations/secretspec\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/secretspec.nix)



## perSystem\.devenv\.shells\.\<name>\.secretspec\.secrets {#opt-perSystem.devenv.shells._name_.secretspec.secrets}



Secrets loaded from secretspec\.toml (read-only)



*Type:*
attribute set of string *(read only)*



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/integrations/secretspec\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/secretspec.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.adminer\.enable {#opt-perSystem.devenv.shells._name_.services.adminer.enable}



Whether to enable Adminer process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/adminer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/adminer.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.adminer\.package {#opt-perSystem.devenv.shells._name_.services.adminer.package}



Which package of Adminer to use\.



*Type:*
package



*Default:*
` pkgs.adminer `

*Declared by:*
 - [devenv/src/modules/services/adminer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/adminer.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.adminer\.listen {#opt-perSystem.devenv.shells._name_.services.adminer.listen}



Listen address for the Adminer\.



*Type:*
string



*Default:*
` "127.0.0.1:8080" `

*Declared by:*
 - [devenv/src/modules/services/adminer\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/adminer.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.enable {#opt-perSystem.devenv.shells._name_.services.blackfire.enable}



Whether to enable Blackfire profiler agent

It automatically installs Blackfire PHP extension\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.enableApm {#opt-perSystem.devenv.shells._name_.services.blackfire.enableApm}



Whether to enable Enables application performance monitoring, requires special subscription\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.package {#opt-perSystem.devenv.shells._name_.services.blackfire.package}



Which package of blackfire to use



*Type:*
package



*Default:*
` pkgs.blackfire `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.client-id {#opt-perSystem.devenv.shells._name_.services.blackfire.client-id}



Sets the client id used to authenticate with Blackfire\.
You can find your personal client-id at [https://blackfire\.io/my/settings/credentials](https://blackfire\.io/my/settings/credentials)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.client-token {#opt-perSystem.devenv.shells._name_.services.blackfire.client-token}



Sets the client token used to authenticate with Blackfire\.
You can find your personal client-token at [https://blackfire\.io/my/settings/credentials](https://blackfire\.io/my/settings/credentials)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.server-id {#opt-perSystem.devenv.shells._name_.services.blackfire.server-id}



Sets the server id used to authenticate with Blackfire\.
You can find your personal server-id at [https://blackfire\.io/my/settings/credentials](https://blackfire\.io/my/settings/credentials)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.server-token {#opt-perSystem.devenv.shells._name_.services.blackfire.server-token}



Sets the server token used to authenticate with Blackfire\.
You can find your personal server-token at [https://blackfire\.io/my/settings/credentials](https://blackfire\.io/my/settings/credentials)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.blackfire\.socket {#opt-perSystem.devenv.shells._name_.services.blackfire.socket}



Sets the server socket path



*Type:*
string



*Default:*
` "tcp://127.0.0.1:8307" `

*Declared by:*
 - [devenv/src/modules/services/blackfire\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/blackfire.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.enable {#opt-perSystem.devenv.shells._name_.services.caddy.enable}



Whether to enable Caddy web server\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.package {#opt-perSystem.devenv.shells._name_.services.caddy.package}



Caddy package to use\.



*Type:*
package



*Default:*
` pkgs.caddy `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.adapter {#opt-perSystem.devenv.shells._name_.services.caddy.adapter}



Name of the config adapter to use\.
See [https://caddyserver\.com/docs/config-adapters](https://caddyserver\.com/docs/config-adapters) for the full list\.



*Type:*
string



*Default:*
` "caddyfile" `



*Example:*
` "nginx" `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.ca {#opt-perSystem.devenv.shells._name_.services.caddy.ca}



Certificate authority ACME server\. The default (Let’s Encrypt
production server) should be fine for most people\. Set it to null if
you don’t want to include any authority (or if you want to write a more
fine-graned configuration manually)\.



*Type:*
null or string



*Default:*
` "https://acme-v02.api.letsencrypt.org/directory" `



*Example:*
` "https://acme-staging-v02.api.letsencrypt.org/directory" `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.config {#opt-perSystem.devenv.shells._name_.services.caddy.config}

Verbatim Caddyfile to use\.

Refer to [https://caddyserver\.com/docs/caddyfile](https://caddyserver\.com/docs/caddyfile)
for more information\.

Caddy v2 supports multiple config formats via adapters (see [` services.caddy.adapter `](https://devenv.sh/reference/options/\#servicescaddyconfig))\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*

```
''
  # Global options block
  {
    debug
  }
  
  # Site block
  example.com {
    encode gzip
    log
    root /srv/http
  }
''
```

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.dataDir {#opt-perSystem.devenv.shells._name_.services.caddy.dataDir}



The data directory, for storing certificates\. Before 17\.09, this
would create a \.caddy directory\. With 17\.09 the contents of the
\.caddy directory are in the specified data directory instead\.
Caddy v2 replaced CADDYPATH with XDG directories\.
See [https://caddyserver\.com/docs/conventions\#file-locations](https://caddyserver\.com/docs/conventions\#file-locations)\.



*Type:*
absolute path



*Default:*
` "${config.env.DEVENV_STATE}/caddy" `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.email {#opt-perSystem.devenv.shells._name_.services.caddy.email}



Email address (for Let’s Encrypt certificate)\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.resume {#opt-perSystem.devenv.shells._name_.services.caddy.resume}



Use saved config, if any (and prefer over configuration passed with [` caddy.config `](https://devenv.sh/reference/options/\#servicescaddyconfig))\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.virtualHosts {#opt-perSystem.devenv.shells._name_.services.caddy.virtualHosts}



Declarative vhost config\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  "hydra.example.com" = {
    serverAliases = [ "www.hydra.example.com" ];
    extraConfig = ''''
      encode gzip
      log
      root /srv/http
    '''';
  };
};

```

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.virtualHosts\.\<name>\.extraConfig {#opt-perSystem.devenv.shells._name_.services.caddy.virtualHosts._name_.extraConfig}



These lines go into the vhost verbatim\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.caddy\.virtualHosts\.\<name>\.serverAliases {#opt-perSystem.devenv.shells._name_.services.caddy.virtualHosts._name_.serverAliases}



Additional names of virtual hosts served by this virtual host configuration\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "www.example.org"
  "example.org"
]
```

*Declared by:*
 - [devenv/src/modules/services/caddy\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/caddy.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.enable {#opt-perSystem.devenv.shells._name_.services.cassandra.enable}



Whether to enable Add Cassandra process script…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.package {#opt-perSystem.devenv.shells._name_.services.cassandra.package}



Which version of Cassandra to use



*Type:*
package



*Default:*
` pkgs.cassandra_4 `



*Example:*
` pkgs.cassandra_4; `

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.allowClients {#opt-perSystem.devenv.shells._name_.services.cassandra.allowClients}



Enables or disables the native transport server (CQL binary protocol)



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.clusterName {#opt-perSystem.devenv.shells._name_.services.cassandra.clusterName}



The name of the cluster



*Type:*
string



*Default:*
` "Test Cluster" `

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.extraConfig {#opt-perSystem.devenv.shells._name_.services.cassandra.extraConfig}



Extra options to be merged into ` cassandra.yaml ` as nix attribute set\.



*Type:*
attribute set



*Default:*
` { } `



*Example:*

```
{
  commitlog_sync_batch_window_in_ms = 3;
}
```

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.jvmOpts {#opt-perSystem.devenv.shells._name_.services.cassandra.jvmOpts}



Options to pass to the JVM through the JVM_OPTS environment variable



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.listenAddress {#opt-perSystem.devenv.shells._name_.services.cassandra.listenAddress}



Listen address



*Type:*
string



*Default:*
` "127.0.0.1" `



*Example:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cassandra\.seedAddresses {#opt-perSystem.devenv.shells._name_.services.cassandra.seedAddresses}



The addresses of hosts designated as contact points of the cluster



*Type:*
list of string



*Default:*

```
[
  "127.0.0.1"
]
```

*Declared by:*
 - [devenv/src/modules/services/cassandra\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cassandra.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.clickhouse\.enable {#opt-perSystem.devenv.shells._name_.services.clickhouse.enable}



Whether to enable clickhouse-server\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/clickhouse\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/clickhouse.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.clickhouse\.package {#opt-perSystem.devenv.shells._name_.services.clickhouse.package}



Which package of clickhouse to use



*Type:*
package



*Default:*
` pkgs.clickhouse `

*Declared by:*
 - [devenv/src/modules/services/clickhouse\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/clickhouse.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.clickhouse\.config {#opt-perSystem.devenv.shells._name_.services.clickhouse.config}



ClickHouse configuration in YAML\.



*Type:*
strings concatenated with “\\n”

*Declared by:*
 - [devenv/src/modules/services/clickhouse\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/clickhouse.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.clickhouse\.httpPort {#opt-perSystem.devenv.shells._name_.services.clickhouse.httpPort}



Which http port to run clickhouse on



*Type:*
signed integer



*Default:*
` 8123 `

*Declared by:*
 - [devenv/src/modules/services/clickhouse\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/clickhouse.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.clickhouse\.port {#opt-perSystem.devenv.shells._name_.services.clickhouse.port}



Which port to run clickhouse on



*Type:*
signed integer



*Default:*
` 9000 `

*Declared by:*
 - [devenv/src/modules/services/clickhouse\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/clickhouse.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cockroachdb\.enable {#opt-perSystem.devenv.shells._name_.services.cockroachdb.enable}



Whether to enable Add CockroachDB process\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/cockroachdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cockroachdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cockroachdb\.package {#opt-perSystem.devenv.shells._name_.services.cockroachdb.package}



The CockroachDB package to use\.



*Type:*
unspecified value



*Default:*
` pkgs.cockroachdb `

*Declared by:*
 - [devenv/src/modules/services/cockroachdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cockroachdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cockroachdb\.http_addr {#opt-perSystem.devenv.shells._name_.services.cockroachdb.http_addr}



The hostname or IP address to bind to for HTTP requests\.



*Type:*
string



*Default:*
` "localhost:8080" `

*Declared by:*
 - [devenv/src/modules/services/cockroachdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cockroachdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.cockroachdb\.listen_addr {#opt-perSystem.devenv.shells._name_.services.cockroachdb.listen_addr}



The address/hostname and port to listen on\.



*Type:*
string



*Default:*
` "localhost:26257" `

*Declared by:*
 - [devenv/src/modules/services/cockroachdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/cockroachdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.enable {#opt-perSystem.devenv.shells._name_.services.couchdb.enable}



Whether to enable CouchDB process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.package {#opt-perSystem.devenv.shells._name_.services.couchdb.package}



Which version of CouchDB to use



*Type:*
package



*Default:*
` pkgs.couchdb3 `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.baseDir {#opt-perSystem.devenv.shells._name_.services.couchdb.baseDir}



The directory where CouchDB will store its data\.



*Type:*
string *(read only)*



*Default:*
` config.env.DEVENV_STATE + "/couchdb" `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.settings {#opt-perSystem.devenv.shells._name_.services.couchdb.settings}



CouchDB configuration\.
to know more about all settings, look at:
\<link
xlink:href=“https://docs\.couchdb\.org/en/stable/config/couchdb\.html”
/>



*Type:*
open submodule of attribute set of section of an INI file (attrs of INI atom (null, bool, int, float or string))



*Default:*
` { } `



*Example:*

```
{
  couchdb = {
    database_dir = baseDir;
    single_node = true;
    view_index_dir = baseDir;
    uri_file = "${config.services.couchdb.baseDir}/couchdb.uri";
  };
  admins = {
    "admin_username" = "pass";
  };
  chttpd = {
    bind_address = "127.0.0.1";
    port = 5984;
  };
}

```

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.settings\.chttpd\.bind_address {#opt-perSystem.devenv.shells._name_.services.couchdb.settings.chttpd.bind_address}



Defines the IP address by which CouchDB will be accessible\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.settings\.chttpd\.port {#opt-perSystem.devenv.shells._name_.services.couchdb.settings.chttpd.port}



Defined the port number to listen\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 5984 `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.settings\.couchdb\.database_dir {#opt-perSystem.devenv.shells._name_.services.couchdb.settings.couchdb.database_dir}



Specifies location of CouchDB database files (\*\.couch named)\. This
location should be writable and readable for the user the CouchDB
service runs as (couchdb by default)\.



*Type:*
absolute path



*Default:*
` config.env.DEVENV_STATE + "/couchdb" `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.settings\.couchdb\.single_node {#opt-perSystem.devenv.shells._name_.services.couchdb.settings.couchdb.single_node}



When this configuration setting is set to true, automatically create
the system databases on startup\. Must be set false for a clustered
CouchDB installation\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.settings\.couchdb\.uri_file {#opt-perSystem.devenv.shells._name_.services.couchdb.settings.couchdb.uri_file}



This file contains the full URI that can be used to access this
instance of CouchDB\. It is used to help discover the port CouchDB is
running on (if it was set to 0 (e\.g\. automatically assigned any free
one)\. This file should be writable and readable for the user that
runs the CouchDB service (couchdb by default)\.



*Type:*
absolute path



*Default:*
` config.env.DEVENV_STATE + "/couchdb"/couchdb.uri `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.couchdb\.settings\.couchdb\.view_index_dir {#opt-perSystem.devenv.shells._name_.services.couchdb.settings.couchdb.view_index_dir}



Specifies location of CouchDB view index files\. This location should
be writable and readable for the user that runs the CouchDB service
(couchdb by default)\.



*Type:*
absolute path



*Default:*
` config.env.DEVENV_STATE + "/couchdb" `

*Declared by:*
 - [devenv/src/modules/services/couchdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/couchdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.dynamodb-local\.enable {#opt-perSystem.devenv.shells._name_.services.dynamodb-local.enable}



Whether to enable DynamoDB Local\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/dynamodb-local\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/dynamodb-local.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.dynamodb-local\.package {#opt-perSystem.devenv.shells._name_.services.dynamodb-local.package}



Which package of DynamoDB to use\.



*Type:*
package



*Default:*
` pkgs.dynamodb-local `

*Declared by:*
 - [devenv/src/modules/services/dynamodb-local\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/dynamodb-local.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.dynamodb-local\.port {#opt-perSystem.devenv.shells._name_.services.dynamodb-local.port}



Listen address for the Dynamodb-local\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 8000 `

*Declared by:*
 - [devenv/src/modules/services/dynamodb-local\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/dynamodb-local.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.dynamodb-local\.sharedDb {#opt-perSystem.devenv.shells._name_.services.dynamodb-local.sharedDb}



If true, enables the -sharedDb flag for DynamoDB Local\.
When enabled, DynamoDB Local creates a single database file named shared-local-instance\.db\.
Every program that connects to DynamoDB accesses this file\. If you delete the file, you lose any data stored in it\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/dynamodb-local\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/dynamodb-local.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticmq\.enable {#opt-perSystem.devenv.shells._name_.services.elasticmq.enable}



Whether to enable elasticmq-server\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/elasticmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticmq\.package {#opt-perSystem.devenv.shells._name_.services.elasticmq.package}



Which package of elasticmq-server-bin to use



*Type:*
package



*Default:*
` pkgs.elasticmq-server-bin `

*Declared by:*
 - [devenv/src/modules/services/elasticmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticmq\.settings {#opt-perSystem.devenv.shells._name_.services.elasticmq.settings}



Configuration for elasticmq-server



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/elasticmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.enable {#opt-perSystem.devenv.shells._name_.services.elasticsearch.enable}



Whether to enable elasticsearch\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.package {#opt-perSystem.devenv.shells._name_.services.elasticsearch.package}



Elasticsearch package to use\.



*Type:*
package



*Default:*
` pkgs.elasticsearch7 `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.cluster_name {#opt-perSystem.devenv.shells._name_.services.elasticsearch.cluster_name}



Elasticsearch name that identifies your cluster for auto-discovery\.



*Type:*
string



*Default:*
` "elasticsearch" `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.extraCmdLineOptions {#opt-perSystem.devenv.shells._name_.services.elasticsearch.extraCmdLineOptions}



Extra command line options for the elasticsearch launcher\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.extraConf {#opt-perSystem.devenv.shells._name_.services.elasticsearch.extraConf}



Extra configuration for elasticsearch\.



*Type:*
string



*Default:*
` "" `



*Example:*

```
''
  node.name: "elasticsearch"
  node.master: true
  node.data: false
''
```

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.extraJavaOptions {#opt-perSystem.devenv.shells._name_.services.elasticsearch.extraJavaOptions}



Extra command line options for Java\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "-Djava.net.preferIPv4Stack=true"
]
```

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.listenAddress {#opt-perSystem.devenv.shells._name_.services.elasticsearch.listenAddress}



Elasticsearch listen address\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.logging {#opt-perSystem.devenv.shells._name_.services.elasticsearch.logging}



Elasticsearch logging configuration\.



*Type:*
string



*Default:*

```
''
  logger.action.name = org.elasticsearch.action
  logger.action.level = info
  appender.console.type = Console
  appender.console.name = console
  appender.console.layout.type = PatternLayout
  appender.console.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] %marker%m%n
  rootLogger.level = info
  rootLogger.appenderRef.console.ref = console
''
```

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.plugins {#opt-perSystem.devenv.shells._name_.services.elasticsearch.plugins}



Extra elasticsearch plugins



*Type:*
list of package



*Default:*
` [ ] `



*Example:*
` [ pkgs.elasticsearchPlugins.discovery-ec2 ] `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.port {#opt-perSystem.devenv.shells._name_.services.elasticsearch.port}



Elasticsearch port to listen for HTTP traffic\.



*Type:*
signed integer



*Default:*
` 9200 `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.single_node {#opt-perSystem.devenv.shells._name_.services.elasticsearch.single_node}



Start a single-node cluster



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.elasticsearch\.tcp_port {#opt-perSystem.devenv.shells._name_.services.elasticsearch.tcp_port}



Elasticsearch port for the node to node communication\.



*Type:*
signed integer



*Default:*
` 9300 `

*Declared by:*
 - [devenv/src/modules/services/elasticsearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/elasticsearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.httpbin\.enable {#opt-perSystem.devenv.shells._name_.services.httpbin.enable}



Whether to enable httpbin\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/httpbin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/httpbin.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.httpbin\.bind {#opt-perSystem.devenv.shells._name_.services.httpbin.bind}



Addresses for httpbin to listen on\.



*Type:*
list of string



*Default:*

```
[
  "127.0.0.1:8080"
]
```

*Declared by:*
 - [devenv/src/modules/services/httpbin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/httpbin.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.httpbin\.extraArgs {#opt-perSystem.devenv.shells._name_.services.httpbin.extraArgs}



Gunicorn CLI arguments for httpbin\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/httpbin\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/httpbin.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.influxdb\.enable {#opt-perSystem.devenv.shells._name_.services.influxdb.enable}



Whether to enable influxdb\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/influxdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/influxdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.influxdb\.package {#opt-perSystem.devenv.shells._name_.services.influxdb.package}



An open-source distributed time series database



*Type:*
package



*Default:*
` pkgs.influxdb `

*Declared by:*
 - [devenv/src/modules/services/influxdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/influxdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.influxdb\.config {#opt-perSystem.devenv.shells._name_.services.influxdb.config}



Configuration for InfluxDB-server



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/influxdb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/influxdb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.enable {#opt-perSystem.devenv.shells._name_.services.kafka.enable}



Whether to enable Apache Kafka\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.package {#opt-perSystem.devenv.shells._name_.services.kafka.package}



The apacheKafka package to use\.



*Type:*
package



*Default:*
` pkgs.apacheKafka `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.configFiles\.log4jProperties {#opt-perSystem.devenv.shells._name_.services.kafka.configFiles.log4jProperties}



Kafka log4j property configuration file path



*Type:*
absolute path



*Default:*
` "pkgs.writeText \"log4j.properties\" cfg.log4jProperties" `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.configFiles\.serverProperties {#opt-perSystem.devenv.shells._name_.services.kafka.configFiles.serverProperties}



Kafka server\.properties configuration file path\.
Defaults to the rendered ` settings `\.



*Type:*
absolute path

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.enable {#opt-perSystem.devenv.shells._name_.services.kafka.connect.enable}



Whether to enable Kafka Connect\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.initialConnectors {#opt-perSystem.devenv.shells._name_.services.kafka.connect.initialConnectors}



List of Kafka Connect connectors to set up initially



*Type:*
list of (open submodule of lazy attribute set of (null or boolean or signed integer or string or list of (boolean or signed integer or string)))



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.initialConnectors\.\*\.config {#opt-perSystem.devenv.shells._name_.services.kafka.connect.initialConnectors._.config}



Initial configuration for the connector



*Type:*
attribute set

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.initialConnectors\.\*\.name {#opt-perSystem.devenv.shells._name_.services.kafka.connect.initialConnectors._.name}



Name of the connector



*Type:*
string

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings}



` connect-standalone.properties `\.

Note that \.properties files contain mappings from string to string\.
Keys with dots are NOT represented by nested attrs in these settings,
but instead as quoted strings (ie\. ` settings."broker.id" `, NOT
` settings.broker.id `)\.



*Type:*
open submodule of lazy attribute set of (null or boolean or signed integer or string or list of (boolean or signed integer or string))



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."bootstrap\.servers" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.bootstrap.servers}



A list of host/port pairs to use for establishing the initial connection to the Kafka cluster\.



*Type:*
list of string



*Default:*

```
[
  "localhost:9092"
]
```

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."key\.converter" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.key.converter}



The key converter to use for the connector\.



*Type:*
string



*Default:*
` "org.apache.kafka.connect.json.JsonConverter" `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."key\.converter\.schemas\.enable" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.key.converter.schemas.enable}



Whether the key converter should include schema information in the message\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\.listeners {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.listeners}



List of listeners for Kafka Connect
(By default Kafka Connect listens on http://localhost:8083)



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
[
  "http://localhost:8080"
]
```

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."offset\.flush\.interval\.ms" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.offset.flush.interval.ms}



Interval at which to try committing offsets for tasks



*Type:*
signed integer



*Default:*
` 10000 `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."offset\.storage\.file\.filename" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.offset.storage.file.filename}



The file to store connector offsets in\. By storing offsets on disk, a standalone process can be stopped and started on a single node and resume where it previously left off\.



*Type:*
string



*Default:*
` ${config.env.DEVENV_STATE}/kafka/connect/connect.offsets `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."plugin\.path" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.plugin.path}



The list should consist of top level directories that include any combination of:
a) directories immediately containing jars with plugins and their dependencies
b) uber-jars with plugins and their dependencies
c) directories immediately containing the package directory structure of classes of plugins and their dependencies
Note: symlinks will be followed to discover dependencies or plugins\.



*Type:*
null or (list of (string or absolute path))



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."value\.converter" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.value.converter}



The value converter to use for the connector\.



*Type:*
string



*Default:*
` "org.apache.kafka.connect.json.JsonConverter" `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.connect\.settings\."value\.converter\.schemas\.enable" {#opt-perSystem.devenv.shells._name_.services.kafka.connect.settings.value.converter.schemas.enable}



Whether the value converter should include schema information in the message\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/kafka-connect\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka-connect.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.defaultMode {#opt-perSystem.devenv.shells._name_.services.kafka.defaultMode}



Which defaults to set for the mode Kafka should run in

 - ` kraft ` (default): Run Kafka in KRaft mode, Which requires no extra configuration\.
 - ` zookeeper `: Run Kafka in Zookeeper mode, this requires more configuration\.



*Type:*
one of “zookeeper”, “kraft”



*Default:*
` "kraft" `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.formatLogDirs {#opt-perSystem.devenv.shells._name_.services.kafka.formatLogDirs}



Whether to format log dirs in KRaft mode if all log dirs are
unformatted, ie\. they contain no meta\.properties\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.formatLogDirsIgnoreFormatted {#opt-perSystem.devenv.shells._name_.services.kafka.formatLogDirsIgnoreFormatted}



Whether to ignore already formatted log dirs when formatting log dirs,
instead of failing\. Useful when replacing or adding disks\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.jre {#opt-perSystem.devenv.shells._name_.services.kafka.jre}



The JRE with which to run Kafka



*Type:*
package



*Default:*
` pkgs.apacheKafka.passthru.jre `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.jvmOptions {#opt-perSystem.devenv.shells._name_.services.kafka.jvmOptions}



Extra command line options for the JVM running Kafka\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "-Djava.net.preferIPv4Stack=true"
  "-Dcom.sun.management.jmxremote"
  "-Dcom.sun.management.jmxremote.local.only=true"
]
```

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.log4jProperties {#opt-perSystem.devenv.shells._name_.services.kafka.log4jProperties}



Kafka log4j property configuration\.



*Type:*
strings concatenated with “\\n”



*Default:*

```
''
  log4j.rootLogger=INFO, stdout
  
  log4j.appender.stdout=org.apache.log4j.ConsoleAppender
  log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
  log4j.appender.stdout.layout.ConversionPattern=[%d] %p %m (%c)%n
''
```

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.settings {#opt-perSystem.devenv.shells._name_.services.kafka.settings}



[Kafka broker configuration](https://kafka\.apache\.org/documentation\.html\#brokerconfigs)
` server.properties `\.

Note that \.properties files contain mappings from string to string\.
Keys with dots are NOT represented by nested attrs in these settings,
but instead as quoted strings (ie\. ` settings."broker.id" `, NOT
` settings.broker.id `)\.



*Type:*
open submodule of lazy attribute set of (null or boolean or signed integer or string or list of (boolean or signed integer or string))



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.settings\."broker\.id" {#opt-perSystem.devenv.shells._name_.services.kafka.settings.broker.id}



Broker ID\. -1 or null to auto-allocate in zookeeper mode\.



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.settings\.listeners {#opt-perSystem.devenv.shells._name_.services.kafka.settings.listeners}



Kafka Listener List\.
See [listeners](https://kafka\.apache\.org/documentation/\#brokerconfigs_listeners)\.
If you change this, you should also update the readiness probe\.



*Type:*
list of string



*Default:*

```
[
  "PLAINTEXT://localhost:9092"
]
```

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.kafka\.settings\."log\.dirs" {#opt-perSystem.devenv.shells._name_.services.kafka.settings.log.dirs}



Log file directories\.



*Type:*
list of absolute path



*Default:*
` [ "${config.devenv.state + "/kafka"}/logs" ] `

*Declared by:*
 - [devenv/src/modules/services/kafka\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/kafka.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.enable {#opt-perSystem.devenv.shells._name_.services.keycloak.enable}



Whether to enable the Keycloak identity and access management
server\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.package {#opt-perSystem.devenv.shells._name_.services.keycloak.package}



The keycloak package to use\.



*Type:*
package



*Default:*
` pkgs.keycloak `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.database\.type {#opt-perSystem.devenv.shells._name_.services.keycloak.database.type}



The type of database Keycloak should connect to\.
If you use ` dev-mem `, the realm export over script
` keycloak-realm-export-* ` does not work\.



*Type:*
one of “dev-mem”, “dev-file”



*Default:*
` "dev-file" `



*Example:*
` "dev-mem" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.initialAdminPassword {#opt-perSystem.devenv.shells._name_.services.keycloak.initialAdminPassword}



Initial password set for the temporary ` admin ` user\.
The password is not stored safely and should be changed
immediately in the admin panel\.

See [Admin bootstrap and recovery](https://www\.keycloak\.org/server/bootstrap-admin-recovery) for details\.



*Type:*
string



*Default:*
` "admin" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.plugins {#opt-perSystem.devenv.shells._name_.services.keycloak.plugins}



Keycloak plugin jar, ear files or derivations containing
them\. Packaged plugins are available through
` pkgs.keycloak.plugins `\.



*Type:*
list of absolute path



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.processes\.exportRealms {#opt-perSystem.devenv.shells._name_.services.keycloak.processes.exportRealms}



Global toggle to enable/disable the realms export process ` keycloak-realm-export-all `
if any realms have ` realms.«name».export == true `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.realms {#opt-perSystem.devenv.shells._name_.services.keycloak.realms}



Specify the realms you want to import on start up and
export on a manual start of process/script ‘keycloak-realm-export-all’\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  myrealm = {
    path = "./myfolder/export.json";
    import = true; # default
    export = true;
  };
}

```

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.realms\.\<name>\.export {#opt-perSystem.devenv.shells._name_.services.keycloak.realms._name_.export}



If you want to export that realm on process/script launch ` keycloak-export-realms `\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.realms\.\<name>\.import {#opt-perSystem.devenv.shells._name_.services.keycloak.realms._name_.import}



If you want to import that realm on start up, if the realm does not yet exist\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.realms\.\<name>\.path {#opt-perSystem.devenv.shells._name_.services.keycloak.realms._name_.path}



The path (string, relative to ` DEVENV_ROOT `) where you want to import (or export) this realm «name» to\.
If not set and ` import ` is ` true ` this realm is not imported\.
If not set and ` export ` is ` true ` its exported to ` $DEVENV_STATE/keycloak/realm-export/«name».json `\.



*Type:*
null or relative path not in the Nix store



*Default:*
` null `



*Example:*
` "./realms/a.json" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.scripts\.exportRealm {#opt-perSystem.devenv.shells._name_.services.keycloak.scripts.exportRealm}



Global toggle to enable/disable the **single** realm export
script ` keycloak-realm-export `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.settings {#opt-perSystem.devenv.shells._name_.services.keycloak.settings}

Configuration options corresponding to parameters set in
` conf/keycloak.conf `\.

Most available options are documented at [https://www\.keycloak\.org/server/all-config](https://www\.keycloak\.org/server/all-config)\.

Options containing secret data should be set to an attribute
set containing the attribute ` _secret ` - a
string pointing to a file containing the value the option
should be set to\. See the example to get a better picture of
this: in the resulting
` conf/keycloak.conf ` file, the
` https-key-store-password ` key will be set
to the contents of the
` /run/keys/store_password ` file\.



*Type:*
open submodule of attribute set of (null or string or signed integer or boolean or attribute set of absolute path)



*Example:*

```
{
  hostname = "localhost";
  https-key-store-file = "/path/to/file";
  https-key-store-password = { _secret = "/run/keys/store_password"; };
}

```

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.settings\.hostname {#opt-perSystem.devenv.shells._name_.services.keycloak.settings.hostname}



The hostname part of the public URL used as base for
all frontend requests\.

See [https://www\.keycloak\.org/server/hostname](https://www\.keycloak\.org/server/hostname)
for more information about hostname configuration\.



*Type:*
string



*Default:*
` "localhost" `



*Example:*
` "localhost" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.settings\.http-host {#opt-perSystem.devenv.shells._name_.services.keycloak.settings.http-host}



On which address Keycloak should accept new connections\.



*Type:*
string



*Default:*
` "::" `



*Example:*
` "::1" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.settings\.http-port {#opt-perSystem.devenv.shells._name_.services.keycloak.settings.http-port}



On which port Keycloak should listen for new HTTP connections\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 8080 `



*Example:*
` 8080 `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.settings\.http-relative-path {#opt-perSystem.devenv.shells._name_.services.keycloak.settings.http-relative-path}



The path relative to ` / ` for serving
resources\.

**Note:** In versions of Keycloak using Wildfly (\<17),
this defaulted to ` /auth `\. If
upgrading from the Wildfly version of Keycloak,
i\.e\. a NixOS version before 22\.05, you’ll likely
want to set this to ` /auth ` to
keep compatibility with your clients\.

See [https://www\.keycloak\.org/migration/migrating-to-quarkus](https://www\.keycloak\.org/migration/migrating-to-quarkus)
for more information on migrating from Wildfly to Quarkus\.



*Type:*
string



*Default:*
` "/" `



*Example:*
` "/auth" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.settings\.https-port {#opt-perSystem.devenv.shells._name_.services.keycloak.settings.https-port}



On which port Keycloak should listen for new HTTPS connections\.
If its not set, its disabled\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 34429 `



*Example:*
` 34429 `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.sslCertificate {#opt-perSystem.devenv.shells._name_.services.keycloak.sslCertificate}



The path to a PEM formatted certificate to use for TLS/SSL
connections\.



*Type:*
null or relative path not in the Nix store



*Default:*
` null `



*Example:*
` "/run/keys/ssl_cert" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.keycloak\.sslCertificateKey {#opt-perSystem.devenv.shells._name_.services.keycloak.sslCertificateKey}



The path to a PEM formatted private key to use for TLS/SSL
connections\.



*Type:*
null or relative path not in the Nix store



*Default:*
` null `



*Example:*
` "/run/keys/ssl_key" `

*Declared by:*
 - [devenv/src/modules/services/keycloak\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/keycloak.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailhog\.enable {#opt-perSystem.devenv.shells._name_.services.mailhog.enable}



Whether to enable mailhog process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/mailhog\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailhog.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailhog\.package {#opt-perSystem.devenv.shells._name_.services.mailhog.package}



Which package of mailhog to use



*Type:*
package



*Default:*
` pkgs.mailhog `

*Declared by:*
 - [devenv/src/modules/services/mailhog\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailhog.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailhog\.additionalArgs {#opt-perSystem.devenv.shells._name_.services.mailhog.additionalArgs}



Additional arguments passed to ` mailhog `\.



*Type:*
list of strings concatenated with “\\n”



*Default:*
` [ ] `



*Example:*

```
[
  "-invite-jim"
]
```

*Declared by:*
 - [devenv/src/modules/services/mailhog\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailhog.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailhog\.apiListenAddress {#opt-perSystem.devenv.shells._name_.services.mailhog.apiListenAddress}



Listen address for API\.



*Type:*
string



*Default:*
` "127.0.0.1:8025" `

*Declared by:*
 - [devenv/src/modules/services/mailhog\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailhog.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailhog\.smtpListenAddress {#opt-perSystem.devenv.shells._name_.services.mailhog.smtpListenAddress}



Listen address for SMTP\.



*Type:*
string



*Default:*
` "127.0.0.1:1025" `

*Declared by:*
 - [devenv/src/modules/services/mailhog\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailhog.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailhog\.uiListenAddress {#opt-perSystem.devenv.shells._name_.services.mailhog.uiListenAddress}



Listen address for UI\.



*Type:*
string



*Default:*
` "127.0.0.1:8025" `

*Declared by:*
 - [devenv/src/modules/services/mailhog\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailhog.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailpit\.enable {#opt-perSystem.devenv.shells._name_.services.mailpit.enable}



Whether to enable mailpit process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/mailpit\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailpit.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailpit\.package {#opt-perSystem.devenv.shells._name_.services.mailpit.package}



Which package of mailpit to use



*Type:*
package



*Default:*
` pkgs.mailpit `

*Declared by:*
 - [devenv/src/modules/services/mailpit\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailpit.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailpit\.additionalArgs {#opt-perSystem.devenv.shells._name_.services.mailpit.additionalArgs}



Additional arguments passed to ` mailpit `\.



*Type:*
list of strings concatenated with “\\n”



*Default:*
` [ ] `



*Example:*

```
[
  "--max=500"
]
```

*Declared by:*
 - [devenv/src/modules/services/mailpit\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailpit.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailpit\.smtpListenAddress {#opt-perSystem.devenv.shells._name_.services.mailpit.smtpListenAddress}



Listen address for SMTP\.



*Type:*
string



*Default:*
` "127.0.0.1:1025" `

*Declared by:*
 - [devenv/src/modules/services/mailpit\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailpit.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mailpit\.uiListenAddress {#opt-perSystem.devenv.shells._name_.services.mailpit.uiListenAddress}



Listen address for UI\.



*Type:*
string



*Default:*
` "127.0.0.1:8025" `

*Declared by:*
 - [devenv/src/modules/services/mailpit\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mailpit.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.enable {#opt-perSystem.devenv.shells._name_.services.meilisearch.enable}



Whether to enable Meilisearch\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.package {#opt-perSystem.devenv.shells._name_.services.meilisearch.package}



Which Meilisearch package to use



*Type:*
package



*Default:*
` "pkgs.meilisearch" `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.environment {#opt-perSystem.devenv.shells._name_.services.meilisearch.environment}



Defines the running environment of Meilisearch\.



*Type:*
one of “development”, “production”



*Default:*
` "development" `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.listenAddress {#opt-perSystem.devenv.shells._name_.services.meilisearch.listenAddress}



Meilisearch listen address\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.listenPort {#opt-perSystem.devenv.shells._name_.services.meilisearch.listenPort}



Meilisearch port to listen on\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 7700 `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.logLevel {#opt-perSystem.devenv.shells._name_.services.meilisearch.logLevel}



Defines how much detail should be present in Meilisearch’s logs\.
Meilisearch currently supports four log levels, listed in order of increasing verbosity:

 - ‘ERROR’: only log unexpected events indicating Meilisearch is not functioning as expected
 - ‘WARN:’ log all unexpected events, regardless of their severity
 - ‘INFO:’ log all events\. This is the default value
 - ‘DEBUG’: log all events and including detailed information on Meilisearch’s internal processes\.
   Useful when diagnosing issues and debugging



*Type:*
string



*Default:*
` "INFO" `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.maxIndexSize {#opt-perSystem.devenv.shells._name_.services.meilisearch.maxIndexSize}



Sets the maximum size of the index\.
Value must be given in bytes or explicitly stating a base unit\.
For example, the default value can be written as 107374182400, ‘107\.7Gb’, or ‘107374 Mb’\.
Default is 100 GiB



*Type:*
string



*Default:*
` "107374182400" `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.meilisearch\.noAnalytics {#opt-perSystem.devenv.shells._name_.services.meilisearch.noAnalytics}



Deactivates analytics\.
Analytics allow Meilisearch to know how many users are using Meilisearch,
which versions and which platforms are used\.
This process is entirely anonymous\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/meilisearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/meilisearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.memcached\.enable {#opt-perSystem.devenv.shells._name_.services.memcached.enable}



Whether to enable memcached process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/memcached\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/memcached.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.memcached\.package {#opt-perSystem.devenv.shells._name_.services.memcached.package}



Which package of memcached to use



*Type:*
package



*Default:*
` pkgs.memcached `

*Declared by:*
 - [devenv/src/modules/services/memcached\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/memcached.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.memcached\.bind {#opt-perSystem.devenv.shells._name_.services.memcached.bind}



The IP interface to bind to\.
` null ` means “all interfaces”\.



*Type:*
null or string



*Default:*
` "127.0.0.1" `



*Example:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/memcached\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/memcached.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.memcached\.port {#opt-perSystem.devenv.shells._name_.services.memcached.port}



The TCP port to accept connections\.
If port 0 is specified memcached will not listen on a TCP socket\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 11211 `

*Declared by:*
 - [devenv/src/modules/services/memcached\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/memcached.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.memcached\.startArgs {#opt-perSystem.devenv.shells._name_.services.memcached.startArgs}



Additional arguments passed to ` memcached ` during startup\.



*Type:*
list of strings concatenated with “\\n”



*Default:*
` [ ] `



*Example:*

```
[
  "--memory-limit=100M"
]
```

*Declared by:*
 - [devenv/src/modules/services/memcached\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/memcached.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.enable {#opt-perSystem.devenv.shells._name_.services.minio.enable}



Whether to enable MinIO Object Storage\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.package {#opt-perSystem.devenv.shells._name_.services.minio.package}



MinIO package to use\.



*Type:*
package



*Default:*
` pkgs.minio `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.accessKey {#opt-perSystem.devenv.shells._name_.services.minio.accessKey}



Access key of 5 to 20 characters in length that clients use to access the server\.



*Type:*
string



*Default:*
` "minioadmin" `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.afterStart {#opt-perSystem.devenv.shells._name_.services.minio.afterStart}



Bash code to execute after minio is running\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*

```
''
  mc anonymous set download local/mybucket
''
```

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.browser {#opt-perSystem.devenv.shells._name_.services.minio.browser}



Enable or disable access to web UI\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.buckets {#opt-perSystem.devenv.shells._name_.services.minio.buckets}



List of buckets to ensure exist on startup\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.clientConfig {#opt-perSystem.devenv.shells._name_.services.minio.clientConfig}



Contents of the mc ` config.json `, as a nix attribute set\.

By default, ` local ` is configured to connect to the devenv minio service\.
Use ` lib.mkForce null ` to use your regular mc configuration from ` $HOME/.mc ` instead\.



*Type:*
null or JSON value

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.clientPackage {#opt-perSystem.devenv.shells._name_.services.minio.clientPackage}



MinIO client package to use\.



*Type:*
package



*Default:*
` pkgs.minio-client `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.consoleAddress {#opt-perSystem.devenv.shells._name_.services.minio.consoleAddress}



IP address and port of the web UI (console)\.



*Type:*
string



*Default:*
` "127.0.0.1:9001" `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.listenAddress {#opt-perSystem.devenv.shells._name_.services.minio.listenAddress}



IP address and port of the server\.



*Type:*
string



*Default:*
` "127.0.0.1:9000" `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.region {#opt-perSystem.devenv.shells._name_.services.minio.region}



The physical location of the server\. By default it is set to us-east-1, which is same as AWS S3’s and MinIO’s default region\.



*Type:*
string



*Default:*
` "us-east-1" `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.minio\.secretKey {#opt-perSystem.devenv.shells._name_.services.minio.secretKey}



Specify the Secret key of 8 to 40 characters in length that clients use to access the server\.



*Type:*
string



*Default:*
` "minioadmin" `

*Declared by:*
 - [devenv/src/modules/services/minio\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/minio.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mongodb\.enable {#opt-perSystem.devenv.shells._name_.services.mongodb.enable}



Whether to enable MongoDB process and expose utilities\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/mongodb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mongodb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mongodb\.package {#opt-perSystem.devenv.shells._name_.services.mongodb.package}



Which MongoDB package to use\.



*Type:*
package



*Default:*
` pkgs.mongodb-ce `

*Declared by:*
 - [devenv/src/modules/services/mongodb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mongodb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mongodb\.additionalArgs {#opt-perSystem.devenv.shells._name_.services.mongodb.additionalArgs}



Additional arguments passed to ` mongod `\.



*Type:*
list of strings concatenated with “\\n”



*Default:*

```
[
  "--noauth"
]
```



*Example:*

```
[
  "--port"
  "27017"
  "--noauth"
]
```

*Declared by:*
 - [devenv/src/modules/services/mongodb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mongodb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mongodb\.initDatabasePassword {#opt-perSystem.devenv.shells._name_.services.mongodb.initDatabasePassword}



This used in conjunction with initDatabaseUsername, create a new user and set that user’s password\. This user is created in the admin authentication database and given the role of root, which is a “superuser” role\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "secret" `

*Declared by:*
 - [devenv/src/modules/services/mongodb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mongodb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mongodb\.initDatabaseUsername {#opt-perSystem.devenv.shells._name_.services.mongodb.initDatabaseUsername}



This used in conjunction with initDatabasePassword, create a new user and set that user’s password\. This user is created in the admin authentication database and given the role of root, which is a “superuser” role\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "mongoadmin" `

*Declared by:*
 - [devenv/src/modules/services/mongodb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mongodb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mongodb\.replication\.enable {#opt-perSystem.devenv.shells._name_.services.mongodb.replication.enable}



Whether to enable MongoDB replication with a 1-node replica-set…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/mongodb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mongodb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mongodb\.replication\.replSet {#opt-perSystem.devenv.shells._name_.services.mongodb.replication.replSet}



Replica-set name



*Type:*
string



*Default:*
` "rs0" `



*Example:*
` "rs0" `

*Declared by:*
 - [devenv/src/modules/services/mongodb\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mongodb.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.enable {#opt-perSystem.devenv.shells._name_.services.mysql.enable}



Whether to enable MySQL process and expose utilities\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.package {#opt-perSystem.devenv.shells._name_.services.mysql.package}



Which package of MySQL to use



*Type:*
package



*Default:*
` pkgs.mariadb `

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.ensureUsers {#opt-perSystem.devenv.shells._name_.services.mysql.ensureUsers}



Ensures that the specified users exist and have at least the ensured permissions\.
The MySQL users will be identified using Unix socket authentication\. This authenticates the Unix user with the
same name only, and that without the need for a password\.
This option will never delete existing users or remove permissions, especially not when the value of this
option is changed\. This means that users created and permissions assigned once through this option or
otherwise have to be removed manually\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  {
    name = "devenv";
    ensurePermissions = {
      "devenv.*" = "ALL PRIVILEGES";
    };
  }
]

```

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.ensureUsers\.\*\.ensurePermissions {#opt-perSystem.devenv.shells._name_.services.mysql.ensureUsers._.ensurePermissions}



Permissions to ensure for the user, specified as attribute set\.
The attribute names specify the database and tables to grant the permissions for,
separated by a dot\. You may use wildcards here\.
The attribute values specfiy the permissions to grant\.
You may specify one or multiple comma-separated SQL privileges here\.
For more information on how to specify the target
and on which privileges exist, see the
[GRANT syntax](https://mariadb\.com/kb/en/library/grant/)\.
The attributes are used as ` GRANT ${attrName} ON ${attrValue} `\.



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  "database.*" = "ALL PRIVILEGES";
  "*.*" = "SELECT, LOCK TABLES";
}

```

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.ensureUsers\.\*\.host {#opt-perSystem.devenv.shells._name_.services.mysql.ensureUsers._.host}



Host of the user to ensure\.



*Type:*
string



*Default:*
` "localhost" `

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.ensureUsers\.\*\.name {#opt-perSystem.devenv.shells._name_.services.mysql.ensureUsers._.name}



Name of the user to ensure\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.ensureUsers\.\*\.password {#opt-perSystem.devenv.shells._name_.services.mysql.ensureUsers._.password}



Password of the user to ensure\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.importTimeZones {#opt-perSystem.devenv.shells._name_.services.mysql.importTimeZones}



Whether to import tzdata on the first startup of the mysql server



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.initialDatabases {#opt-perSystem.devenv.shells._name_.services.mysql.initialDatabases}



List of database names and their initial schemas that should be used to create databases on the first startup
of MySQL\. The schema attribute is optional: If not specified, an empty database is created\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  { name = "foodatabase"; schema = ./foodatabase.sql; }
  { name = "bardatabase"; }
]

```

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.initialDatabases\.\*\.name {#opt-perSystem.devenv.shells._name_.services.mysql.initialDatabases._.name}



The name of the database to create\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.initialDatabases\.\*\.schema {#opt-perSystem.devenv.shells._name_.services.mysql.initialDatabases._.schema}



The initial schema of the database; if null (the default),
an empty database is created\.



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.settings {#opt-perSystem.devenv.shells._name_.services.mysql.settings}



MySQL configuration\.



*Type:*
lazy attribute set of lazy attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  mysqld = {
    key_buffer_size = "6G";
    table_cache = 1600;
    log-error = "/var/log/mysql_err.log";
    plugin-load-add = [ "server_audit" "ed25519=auth_ed25519" ];
  };
  mysqldump = {
    quick = true;
    max_allowed_packet = "16M";
  };
}

```

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.mysql\.useDefaultsExtraFile {#opt-perSystem.devenv.shells._name_.services.mysql.useDefaultsExtraFile}



Whether to use defaults-exta-file for the mysql command instead of defaults-file\.
This is useful if you want to provide a config file on the command line\.
However this can problematic if you have MySQL installed globaly because its config might leak into your environment\.
This option does not affect the mysqld command\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/mysql\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/mysql.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.enable {#opt-perSystem.devenv.shells._name_.services.nats.enable}



Whether to enable the NATS messaging server\.

NATS is a simple, secure and high performance messaging
system for cloud native applications, IoT messaging,
and microservices architectures\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.package {#opt-perSystem.devenv.shells._name_.services.nats.package}



Which NATS server package to use\.



*Type:*
package



*Default:*
` pkgs.nats-server `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.authorization\.enable {#opt-perSystem.devenv.shells._name_.services.nats.authorization.enable}



Whether to enable authorization for client connections\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.authorization\.password {#opt-perSystem.devenv.shells._name_.services.nats.authorization.password}



Password required for client connections\.
Only used if authorization is enabled\.
Warning: This will be visible in the Nix store\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "nats-pass" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.authorization\.token {#opt-perSystem.devenv.shells._name_.services.nats.authorization.token}



Token required for client connections\.
Alternative to user/password authentication\.
Warning: This will be visible in the Nix store\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "my-secret-token" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.authorization\.user {#opt-perSystem.devenv.shells._name_.services.nats.authorization.user}



Username required for client connections\.
Only used if authorization is enabled\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "nats-user" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.clientAdvertise {#opt-perSystem.devenv.shells._name_.services.nats.clientAdvertise}



Client URL to advertise to other servers in a cluster\.
Useful when running behind NAT or in containers\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "localhost:4222" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.debug {#opt-perSystem.devenv.shells._name_.services.nats.debug}



Enable debug logging for troubleshooting\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.host {#opt-perSystem.devenv.shells._name_.services.nats.host}



Network host to listen on for client connections\.
Set to “0\.0\.0\.0” to listen on all interfaces\.
Default is localhost for security\.



*Type:*
string



*Default:*
` "127.0.0.1" `



*Example:*
` "0.0.0.0" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.jetstream\.enable {#opt-perSystem.devenv.shells._name_.services.nats.jetstream.enable}



Whether to enable JetStream persistence layer for streaming and queues\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.jetstream\.maxFileStore {#opt-perSystem.devenv.shells._name_.services.nats.jetstream.maxFileStore}



Maximum disk space for file-based streams\.
Use suffixes: K, M, G, T for sizes\.



*Type:*
string



*Default:*
` "10G" `



*Example:*
` "100G" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.jetstream\.maxMemory {#opt-perSystem.devenv.shells._name_.services.nats.jetstream.maxMemory}



Maximum memory for in-memory streams\.
Use suffixes: K, M, G, T for sizes\.



*Type:*
string



*Default:*
` "1G" `



*Example:*
` "512M" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.logFile {#opt-perSystem.devenv.shells._name_.services.nats.logFile}



Path to log file\. If empty, logs to stdout\.
Stdout is recommended for devenv as logs are captured by process manager\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "/var/log/nats-server.log" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.monitoring\.enable {#opt-perSystem.devenv.shells._name_.services.nats.monitoring.enable}



Enable HTTP monitoring endpoint\.
Provides /healthz, /varz, /connz, and other monitoring endpoints\.
Highly recommended for production deployments\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.monitoring\.port {#opt-perSystem.devenv.shells._name_.services.nats.monitoring.port}



Port for HTTP monitoring endpoint\.
Access monitoring at http://host:port/varz



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 8222 `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.port {#opt-perSystem.devenv.shells._name_.services.nats.port}



Port to listen on for client connections\.
Default NATS client port is 4222\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 4222 `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.serverName {#opt-perSystem.devenv.shells._name_.services.nats.serverName}



Server name for identification in clusters\.
If empty, NATS will auto-generate a unique name\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "nats-dev-1" `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.settings {#opt-perSystem.devenv.shells._name_.services.nats.settings}



Additional NATS server configuration as a Nix attribute set\.
This will be converted to NATS config file format\.

Use this for advanced features like:

 - TLS/SSL configuration
 - Clustering with routes
 - MQTT gateway
 - WebSocket support
 - Custom authorization

See https://docs\.nats\.io/running-a-nats-service/configuration



*Type:*
attribute set



*Default:*
` { } `



*Example:*

```
{
  tls = {
    cert_file = "/path/to/cert.pem";
    key_file = "/path/to/key.pem";
    verify = true;
  };
  cluster = {
    name = "my-cluster";
    listen = "0.0.0.0:6222";
    routes = [
      "nats://node1:6222"
      "nats://node2:6222"
    ];
  };
}

```

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nats\.trace {#opt-perSystem.devenv.shells._name_.services.nats.trace}



Enable protocol tracing for deep debugging\.
Warning: Very verbose output\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/nats\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nats.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nginx\.enable {#opt-perSystem.devenv.shells._name_.services.nginx.enable}



Whether to enable nginx\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/nginx\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nginx.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nginx\.package {#opt-perSystem.devenv.shells._name_.services.nginx.package}



The nginx package to use\.



*Type:*
package



*Default:*
` pkgs.nginx `

*Declared by:*
 - [devenv/src/modules/services/nginx\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nginx.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nginx\.defaultMimeTypes {#opt-perSystem.devenv.shells._name_.services.nginx.defaultMimeTypes}



Default MIME types for NGINX, as MIME types definitions from NGINX are very incomplete,
we use by default the ones bundled in the mailcap package, used by most of the other
Linux distributions\.



*Type:*
absolute path



*Default:*
` ${pkgs.mailcap}/etc/nginx/mime.types `



*Example:*
` ${pkgs.nginx}/conf/mime.types `

*Declared by:*
 - [devenv/src/modules/services/nginx\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nginx.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nginx\.eventsConfig {#opt-perSystem.devenv.shells._name_.services.nginx.eventsConfig}



The nginx events configuration\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/nginx\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nginx.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nginx\.httpConfig {#opt-perSystem.devenv.shells._name_.services.nginx.httpConfig}



The nginx configuration\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/nginx\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nginx.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nixseparatedebuginfod\.enable {#opt-perSystem.devenv.shells._name_.services.nixseparatedebuginfod.enable}



Whether to enable nixseparatedebuginfod\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/nixseparatedebuginfod\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nixseparatedebuginfod.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nixseparatedebuginfod\.package {#opt-perSystem.devenv.shells._name_.services.nixseparatedebuginfod.package}



nixseparatedebuginfod package to use\.



*Type:*
package



*Default:*
` pkgs.nixseparatedebuginfod2 `

*Declared by:*
 - [devenv/src/modules/services/nixseparatedebuginfod\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nixseparatedebuginfod.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nixseparatedebuginfod\.cache\.directory {#opt-perSystem.devenv.shells._name_.services.nixseparatedebuginfod.cache.directory}



Override the directory where files downloaded from the substituter are stored\.

Default is ` $XDG_CACHE_DIR/nixseparatedebuginfod2 `\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/nixseparatedebuginfod\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nixseparatedebuginfod.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nixseparatedebuginfod\.cache\.expiration {#opt-perSystem.devenv.shells._name_.services.nixseparatedebuginfod.cache.expiration}



How long to keep cache entries\.
A number followed by a unit\.



*Type:*
string



*Default:*
` "1d" `

*Declared by:*
 - [devenv/src/modules/services/nixseparatedebuginfod\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nixseparatedebuginfod.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nixseparatedebuginfod\.host {#opt-perSystem.devenv.shells._name_.services.nixseparatedebuginfod.host}



IP address for nixseparatedebuginfod to listen on\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/nixseparatedebuginfod\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nixseparatedebuginfod.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nixseparatedebuginfod\.port {#opt-perSystem.devenv.shells._name_.services.nixseparatedebuginfod.port}



Port for nixseparatedebuginfod to listen on\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 1949 `

*Declared by:*
 - [devenv/src/modules/services/nixseparatedebuginfod\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nixseparatedebuginfod.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.nixseparatedebuginfod\.substituters {#opt-perSystem.devenv.shells._name_.services.nixseparatedebuginfod.substituters}



Substituters to fetch debuginfo from\.



*Type:*
list of string



*Default:*

```
[
  "local:"
  "https://cache.nixos.org"
]
```

*Declared by:*
 - [devenv/src/modules/services/nixseparatedebuginfod\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/nixseparatedebuginfod.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.enable {#opt-perSystem.devenv.shells._name_.services.opensearch.enable}



Whether to enable OpenSearch\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.package {#opt-perSystem.devenv.shells._name_.services.opensearch.package}



The OpenSearch package to use\.



*Type:*
package



*Default:*
` pkgs.opensearch `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.extraCmdLineOptions {#opt-perSystem.devenv.shells._name_.services.opensearch.extraCmdLineOptions}



Extra command line options for the OpenSearch launcher\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.extraJavaOptions {#opt-perSystem.devenv.shells._name_.services.opensearch.extraJavaOptions}



Extra command line options for Java\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "-Djava.net.preferIPv4Stack=true"
]
```

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.logging {#opt-perSystem.devenv.shells._name_.services.opensearch.logging}



OpenSearch logging configuration\.



*Type:*
string



*Default:*

```
''
  logger.action.name = org.opensearch.action
  logger.action.level = info
  appender.console.type = Console
  appender.console.name = console
  appender.console.layout.type = PatternLayout
  appender.console.layout.pattern = [%d{ISO8601}][%-5p][%-25c{1.}] %marker%m%n
  rootLogger.level = info
  rootLogger.appenderRef.console.ref = console
''
```

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.settings {#opt-perSystem.devenv.shells._name_.services.opensearch.settings}

OpenSearch configuration\.



*Type:*
open submodule of (YAML 1\.1 value)



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.settings\."cluster\.name" {#opt-perSystem.devenv.shells._name_.services.opensearch.settings.cluster.name}



The name of the cluster\.



*Type:*
string



*Default:*
` "opensearch" `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.settings\."discovery\.type" {#opt-perSystem.devenv.shells._name_.services.opensearch.settings.discovery.type}



The type of discovery to use\.



*Type:*
string



*Default:*
` "single-node" `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.settings\."http\.port" {#opt-perSystem.devenv.shells._name_.services.opensearch.settings.http.port}



The port to listen on for HTTP traffic\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 9200 `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.settings\."network\.host" {#opt-perSystem.devenv.shells._name_.services.opensearch.settings.network.host}



Which port this service should listen on\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.settings\."plugins\.security\.disabled" {#opt-perSystem.devenv.shells._name_.services.opensearch.settings.plugins.security.disabled}



Whether to disable the security plugin\. When set to false, SSL configuration is required\.
To enable SSL, set ` plugins.security.ssl.transport.keystore_filepath ` or both
` plugins.security.ssl.transport.server.pemcert_filepath ` and
` plugins.security.ssl.transport.client.pemcert_filepath `\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opensearch\.settings\."transport\.port" {#opt-perSystem.devenv.shells._name_.services.opensearch.settings.transport.port}



The port to listen on for transport traffic\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 9300 `

*Declared by:*
 - [devenv/src/modules/services/opensearch\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opensearch.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opentelemetry-collector\.enable {#opt-perSystem.devenv.shells._name_.services.opentelemetry-collector.enable}



Whether to enable opentelemetry-collector\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/opentelemetry-collector\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opentelemetry-collector.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opentelemetry-collector\.package {#opt-perSystem.devenv.shells._name_.services.opentelemetry-collector.package}



The OpenTelemetry Collector package to use



*Type:*
package



*Default:*
` pkgs.opentelemetry-collector-contrib `

*Declared by:*
 - [devenv/src/modules/services/opentelemetry-collector\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opentelemetry-collector.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opentelemetry-collector\.configFile {#opt-perSystem.devenv.shells._name_.services.opentelemetry-collector.configFile}



Override the configuration file used by OpenTelemetry Collector\.
By default, a configuration is generated from ` services.opentelemetry-collector.settings `\.

If overriding, enable the ` health_check ` extension to allow process-compose to check whether the Collector is ready\.
Otherwise, disable the readiness probe by setting ` processes.opentelemetry-collector.process-compose.readiness_probe = lib.mkForce {}; `\.



*Type:*
null or absolute path



*Default:*
` null `



*Example:*

```
pkgs.writeTextFile { name = "otel-config.yaml"; text = "..."; }

```

*Declared by:*
 - [devenv/src/modules/services/opentelemetry-collector\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opentelemetry-collector.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.opentelemetry-collector\.settings {#opt-perSystem.devenv.shells._name_.services.opentelemetry-collector.settings}



OpenTelemetry Collector configuration\.
Refer to https://opentelemetry\.io/docs/collector/configuration/
for more information on how to configure the Collector\.



*Type:*
open submodule of (YAML 1\.1 value)



*Default:*
` defaultSettings `

*Declared by:*
 - [devenv/src/modules/services/opentelemetry-collector\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/opentelemetry-collector.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.enable {#opt-perSystem.devenv.shells._name_.services.postgres.enable}



Whether to enable Add PostgreSQL process\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.package {#opt-perSystem.devenv.shells._name_.services.postgres.package}



The PostgreSQL package to use\. Use this to override the default with a specific version\.



*Type:*
package



*Default:*
` pkgs.postgresql `



*Example:*

```
pkgs.postgresql_15

```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.createDatabase {#opt-perSystem.devenv.shells._name_.services.postgres.createDatabase}



Create a database named like current user on startup\. Only applies when initialDatabases is an empty list\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.extensions {#opt-perSystem.devenv.shells._name_.services.postgres.extensions}



Additional PostgreSQL extensions to install\.

The available extensions are:

 - age
 - anonymizer
 - apache_datasketches
 - callPackage
 - citus
 - cstore_fdw
 - h3-pg
 - hypopg
 - ip4r
 - jsonb_deep_sum
 - lantern
 - omnigres
 - periods
 - pg-gvm
 - pg-semver
 - pg_auto_failover
 - pg_background
 - pg_bigm
 - pg_byteamagic
 - pg_cron
 - pg_csv
 - pg_ed25519
 - pg_embedding
 - pg_graphql
 - pg_hint_plan
 - pg_hll
 - pg_ivm
 - pg_libversion
 - pg_net
 - pg_partman
 - pg_rational
 - pg_relusage
 - pg_repack
 - pg_roaringbitmap
 - pg_safeupdate
 - pg_similarity
 - pg_squeeze
 - pg_tle
 - pg_topn
 - pg_uuidv7
 - pgaudit
 - pgddl
 - pgjwt
 - pgmq
 - pgroonga
 - pgrouting
 - pgsodium
 - pgsql-http
 - pgtap
 - pgvecto-rs
 - pgvector
 - pgvectorscale
 - pgx_ulid
 - plperl
 - plpgsql_check
 - plpython3
 - plr
 - pltcl
 - plv8
 - pointcloud
 - postgis
 - repmgr
 - rum
 - smlar
 - sqlite_fdw
 - system_stats
 - tds_fdw
 - temporal_tables
 - timescaledb
 - timescaledb-apache
 - timescaledb_toolkit
 - tsja
 - vectorchord
 - wal2json



*Type:*
null or (function that evaluates to a(n) list of package)



*Default:*
` null `



*Example:*

```
extensions: [
  extensions.pg_cron
  extensions.postgis
  extensions.timescaledb
];

```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.hbaConf {#opt-perSystem.devenv.shells._name_.services.postgres.hbaConf}



The contents of a custom pg_hba\.conf file to copy into the postgres installation\.
This allows for custom connection rules that you want to establish on the server\.



*Type:*
null or string



*Default:*
` null `



*Example:*

```
builtins.readFile ./my-custom/directory/to/pg_hba.conf

```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initdbArgs {#opt-perSystem.devenv.shells._name_.services.postgres.initdbArgs}



Additional arguments passed to ` initdb ` during data dir
initialisation\.



*Type:*
list of strings concatenated with “\\n”



*Default:*

```
[
  "--locale=C"
  "--encoding=UTF8"
]
```



*Example:*

```
[
  "--data-checksums"
  "--allow-group-access"
]
```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initialDatabases {#opt-perSystem.devenv.shells._name_.services.postgres.initialDatabases}



List of database names and their initial schemas that should be used to create databases on the first startup
of Postgres\. The schema attribute is optional: If not specified, an empty database is created\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  {
    name = "foodatabase";
    schema = ./foodatabase.sql;
  }
  { name = "bardatabase"; }
]

```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initialDatabases\.\*\.initialSQL {#opt-perSystem.devenv.shells._name_.services.postgres.initialDatabases._.initialSQL}



SQL commands to run on this specific database during it’s initialization\.
Multiple SQL expressions can be separated by semicolons\.



*Type:*
null or string



*Default:*
` null `



*Example:*

```
CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT);
INSERT INTO users (name) VALUES ('admin');
CREATE EXTENSION IF NOT EXISTS pg_uuidv7;

```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initialDatabases\.\*\.name {#opt-perSystem.devenv.shells._name_.services.postgres.initialDatabases._.name}



The name of the database to create\.



*Type:*
string

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initialDatabases\.\*\.pass {#opt-perSystem.devenv.shells._name_.services.postgres.initialDatabases._.pass}



Password of owner of the database (only takes effect if ` user ` is not ` null `)\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initialDatabases\.\*\.schema {#opt-perSystem.devenv.shells._name_.services.postgres.initialDatabases._.schema}



The initial schema of the database; if null (the default),
an empty database is created\.



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initialDatabases\.\*\.user {#opt-perSystem.devenv.shells._name_.services.postgres.initialDatabases._.user}



Username of owner of the database (if null, the default $USER is used)\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.initialScript {#opt-perSystem.devenv.shells._name_.services.postgres.initialScript}



Initial SQL commands to run during database initialization\. This can be multiple
SQL expressions separated by a semi-colon\.
Use ` initialScript ` for server-wide setup, such as creating roles or configuring
global settings\. For database-specific initialization, use ` initialSQL ` within
` initialDatabases `\.



*Type:*
null or string



*Default:*
` null `



*Example:*

```
CREATE ROLE postgres SUPERUSER;
CREATE ROLE bar;

```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.listen_addresses {#opt-perSystem.devenv.shells._name_.services.postgres.listen_addresses}



A comma-separated list of TCP/IP address(es) on which the server should listen for connections\.

By default, the server only accepts connections over unix sockets\.

This option is parsed to set the ` PGHOST ` environment variable\.

Special values:

 - '\*' to listen on all available network interfaces\.
 - '0\.0\.0\.0' to listen on all available IPv4 network interfaces\.
 - '::' to listen on all available IPv6 network interfaces\.
 - 'localhost' to listen only on the loopback interface\.
 - '' (empty string) disables TCP/IP connections and listens only on the unix socket\.



*Type:*
string



*Default:*
` "" `



*Example:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.port {#opt-perSystem.devenv.shells._name_.services.postgres.port}



The TCP port to accept connections\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 5432 `

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.postgres\.settings {#opt-perSystem.devenv.shells._name_.services.postgres.settings}



PostgreSQL configuration\. Refer to
[https://www\.postgresql\.org/docs/11/config-setting\.html\#CONFIG-SETTING-CONFIGURATION-FILE](https://www\.postgresql\.org/docs/11/config-setting\.html\#CONFIG-SETTING-CONFIGURATION-FILE)
for an overview of ` postgresql.conf `\.

String values will automatically be enclosed in single quotes\. Single quotes will be
escaped with two single quotes as described by the upstream documentation linked above\.



*Type:*
attribute set of (boolean or floating point number or signed integer or string)



*Default:*
` { } `



*Example:*

```
{
  log_connections = true;
  log_statement = "all";
  logging_collector = true
  log_disconnections = true
  log_destination = lib.mkForce "syslog";
}

```

*Declared by:*
 - [devenv/src/modules/services/postgres\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/postgres.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.enable {#opt-perSystem.devenv.shells._name_.services.prometheus.enable}



Whether to enable Prometheus monitoring system\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.package {#opt-perSystem.devenv.shells._name_.services.prometheus.package}



Which package of Prometheus to use



*Type:*
package



*Default:*
` pkgs.prometheus `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.advanced\.storage {#opt-perSystem.devenv.shells._name_.services.prometheus.advanced.storage}



Storage configuration



*Type:*
attribute set



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.advanced\.tsdb {#opt-perSystem.devenv.shells._name_.services.prometheus.advanced.tsdb}



TSDB configuration



*Type:*
attribute set



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.alerting {#opt-perSystem.devenv.shells._name_.services.prometheus.alerting}



Alerting configuration



*Type:*
null or (attribute set)



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.experimentalFeatures\.enableExemplars {#opt-perSystem.devenv.shells._name_.services.prometheus.experimentalFeatures.enableExemplars}



Enable exemplar storage



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.experimentalFeatures\.enableOTLP {#opt-perSystem.devenv.shells._name_.services.prometheus.experimentalFeatures.enableOTLP}



Enable OTLP receiver



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.experimentalFeatures\.enableTracing {#opt-perSystem.devenv.shells._name_.services.prometheus.experimentalFeatures.enableTracing}



Enable tracing



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.extraArgs {#opt-perSystem.devenv.shells._name_.services.prometheus.extraArgs}



Additional arguments to pass to Prometheus



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.globalConfig {#opt-perSystem.devenv.shells._name_.services.prometheus.globalConfig}



Global Prometheus configuration



*Type:*
attribute set



*Default:*

```
{
  evaluation_interval = "1m";
  scrape_interval = "1m";
  scrape_timeout = "10s";
}
```

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.port {#opt-perSystem.devenv.shells._name_.services.prometheus.port}



Port for Prometheus web interface



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 9090 `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.remoteRead {#opt-perSystem.devenv.shells._name_.services.prometheus.remoteRead}



Remote read configurations



*Type:*
list of (attribute set)



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.remoteWrite {#opt-perSystem.devenv.shells._name_.services.prometheus.remoteWrite}



Remote write configurations



*Type:*
list of (attribute set)



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.ruleFiles {#opt-perSystem.devenv.shells._name_.services.prometheus.ruleFiles}



List of rule files to load



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.scrapeConfigs {#opt-perSystem.devenv.shells._name_.services.prometheus.scrapeConfigs}



List of scrape configurations



*Type:*
list of (attribute set)



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.storage\.path {#opt-perSystem.devenv.shells._name_.services.prometheus.storage.path}



Path where Prometheus will store its database



*Type:*
string



*Default:*
` ${config.devenv.state}/prometheus `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.prometheus\.storage\.retentionTime {#opt-perSystem.devenv.shells._name_.services.prometheus.storage.retentionTime}



How long to retain data



*Type:*
string



*Default:*
` "15d" `

*Declared by:*
 - [devenv/src/modules/services/prometheus\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/prometheus.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.enable {#opt-perSystem.devenv.shells._name_.services.rabbitmq.enable}



Whether to enable the RabbitMQ server, an Advanced Message
Queuing Protocol (AMQP) broker\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.package {#opt-perSystem.devenv.shells._name_.services.rabbitmq.package}



Which rabbitmq package to use\.



*Type:*
package



*Default:*
` pkgs.rabbitmq-server `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.configItems {#opt-perSystem.devenv.shells._name_.services.rabbitmq.configItems}



Configuration options in RabbitMQ’s new config file format,
which is a simple key-value format that can not express nested
data structures\. This is known as the ` rabbitmq.conf ` file,
although outside NixOS that filename may have Erlang syntax, particularly
prior to RabbitMQ 3\.7\.0\.
If you do need to express nested data structures, you can use
` config ` option\. Configuration from ` config `
will be merged into these options by RabbitMQ at runtime to
form the final configuration\.
See [https://www\.rabbitmq\.com/configure\.html\#config-items](https://www\.rabbitmq\.com/configure\.html\#config-items)
For the distinct formats, see [https://www\.rabbitmq\.com/configure\.html\#config-file-formats](https://www\.rabbitmq\.com/configure\.html\#config-file-formats)



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  "auth_backends.1.authn" = "rabbit_auth_backend_ldap";
  "auth_backends.1.authz" = "rabbit_auth_backend_internal";
}

```

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.cookie {#opt-perSystem.devenv.shells._name_.services.rabbitmq.cookie}



Erlang cookie is a string of arbitrary length which must
be the same for several nodes to be allowed to communicate\.
Leave empty to generate automatically\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.listenAddress {#opt-perSystem.devenv.shells._name_.services.rabbitmq.listenAddress}



IP address on which RabbitMQ will listen for AMQP
connections\.  Set to the empty string to listen on all
interfaces\.  Note that RabbitMQ creates a user named
` guest ` with password
` guest ` by default, so you should delete
this user if you intend to allow external access\.
Together with ‘port’ setting it’s mostly an alias for
configItems\.“listeners\.tcp\.1” and it’s left for backwards
compatibility with previous version of this module\.



*Type:*
string



*Default:*
` "127.0.0.1" `



*Example:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.managementPlugin\.enable {#opt-perSystem.devenv.shells._name_.services.rabbitmq.managementPlugin.enable}



Whether to enable the management plugin\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.managementPlugin\.port {#opt-perSystem.devenv.shells._name_.services.rabbitmq.managementPlugin.port}



On which port to run the management plugin



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 15672 `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.nodeName {#opt-perSystem.devenv.shells._name_.services.rabbitmq.nodeName}



The name of the RabbitMQ node\.  This is used to identify
the node in a cluster\.  If you are running multiple
RabbitMQ nodes on the same machine, you must give each
node a unique name\.  The name must be of the form
` name@host `, where ` name ` is an arbitrary name and
` host ` is the domain name of the host\.



*Type:*
string



*Default:*
` "rabbit@localhost" `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.pluginDirs {#opt-perSystem.devenv.shells._name_.services.rabbitmq.pluginDirs}



The list of directories containing external plugins



*Type:*
list of absolute path



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.plugins {#opt-perSystem.devenv.shells._name_.services.rabbitmq.plugins}



The names of plugins to enable



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.rabbitmq\.port {#opt-perSystem.devenv.shells._name_.services.rabbitmq.port}



Port on which RabbitMQ will listen for AMQP connections\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 5672 `

*Declared by:*
 - [devenv/src/modules/services/rabbitmq\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/rabbitmq.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.redis\.enable {#opt-perSystem.devenv.shells._name_.services.redis.enable}



Whether to enable Redis process and expose utilities\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/redis\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/redis.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.redis\.package {#opt-perSystem.devenv.shells._name_.services.redis.package}



Which package of Redis to use



*Type:*
package



*Default:*
` pkgs.redis `

*Declared by:*
 - [devenv/src/modules/services/redis\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/redis.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.redis\.bind {#opt-perSystem.devenv.shells._name_.services.redis.bind}



The IP interface to bind to\.
` null ` means “all interfaces”\.



*Type:*
null or string



*Default:*
` "127.0.0.1" `



*Example:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/redis\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/redis.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.redis\.extraConfig {#opt-perSystem.devenv.shells._name_.services.redis.extraConfig}



Additional text to be appended to ` redis.conf `\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "locale-collate C" `

*Declared by:*
 - [devenv/src/modules/services/redis\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/redis.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.redis\.port {#opt-perSystem.devenv.shells._name_.services.redis.port}



The TCP port to accept connections\.
If port 0 is specified Redis, will not listen on a TCP socket and a unix socket file will be found at $REDIS_UNIX_SOCKET\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 6379 `

*Declared by:*
 - [devenv/src/modules/services/redis\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/redis.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.sqld\.enable {#opt-perSystem.devenv.shells._name_.services.sqld.enable}



Whether to enable sqld\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/sqld\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/sqld.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.sqld\.extraArgs {#opt-perSystem.devenv.shells._name_.services.sqld.extraArgs}



Add other sqld flags\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/sqld\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/sqld.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.sqld\.port {#opt-perSystem.devenv.shells._name_.services.sqld.port}



Port number to listen on



*Type:*
signed integer



*Default:*
` 8080 `

*Declared by:*
 - [devenv/src/modules/services/sqld\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/sqld.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tailscale\.funnel\.enable {#opt-perSystem.devenv.shells._name_.services.tailscale.funnel.enable}



Whether to enable Tailscale funnel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/tailscale\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tailscale.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tailscale\.funnel\.target {#opt-perSystem.devenv.shells._name_.services.tailscale.funnel.target}



Target host or host:port for Tailscale funnel



*Type:*
string

*Declared by:*
 - [devenv/src/modules/services/tailscale\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tailscale.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.enable {#opt-perSystem.devenv.shells._name_.services.temporal.enable}



Whether to enable Temporal process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.package {#opt-perSystem.devenv.shells._name_.services.temporal.package}



Which package of Temporal to use\.



*Type:*
package



*Default:*
` pkgs.temporal-cli `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.dynamicConfig {#opt-perSystem.devenv.shells._name_.services.temporal.dynamicConfig}



Dynamic configuration for the Temporal server\.



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  "frontend.namespacerps" = "2500";
  "frontend.rps" = "2500";
}
```

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.ip {#opt-perSystem.devenv.shells._name_.services.temporal.ip}



IPv4 address to bind the frontend service to\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.namespaces {#opt-perSystem.devenv.shells._name_.services.temporal.namespaces}



Specify namespaces that should be pre-created (namespace “default” is always created)\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "my-namespace"
  "my-other-namespace"
]
```

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.port {#opt-perSystem.devenv.shells._name_.services.temporal.port}



Port for the frontend gRPC service\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 7233 `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.state {#opt-perSystem.devenv.shells._name_.services.temporal.state}



State configuration\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.state\.ephemeral {#opt-perSystem.devenv.shells._name_.services.temporal.state.ephemeral}



When enabled, the Temporal state gets lost when the process exists\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.state\.sqlite-pragma {#opt-perSystem.devenv.shells._name_.services.temporal.state.sqlite-pragma}



Sqlite pragma statements



*Type:*
attribute set of string



*Default:*
` { } `



*Example:*

```
{
  journal_mode = "wal";
  synchronous = "2";
}
```

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.ui {#opt-perSystem.devenv.shells._name_.services.temporal.ui}



UI configuration\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.ui\.enable {#opt-perSystem.devenv.shells._name_.services.temporal.ui.enable}



Enable the Web UI\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.ui\.ip {#opt-perSystem.devenv.shells._name_.services.temporal.ui.ip}



IPv4 address to bind the Web UI to\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.temporal\.ui\.port {#opt-perSystem.devenv.shells._name_.services.temporal.ui.port}



Port for the Web UI\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
[` services.temporal.port `](https://devenv.sh/reference/options/\#servicestemporalport) + 1000

*Declared by:*
 - [devenv/src/modules/services/temporal\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/temporal.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tideways\.enable {#opt-perSystem.devenv.shells._name_.services.tideways.enable}



Whether to enable Tideways profiler daemon

It automatically installs Tideways PHP extension\.
\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/tideways\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tideways.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tideways\.apiKey {#opt-perSystem.devenv.shells._name_.services.tideways.apiKey}



Sets the API-Key for the Tideways Daemon\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/tideways\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tideways.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tideways\.cliPackage {#opt-perSystem.devenv.shells._name_.services.tideways.cliPackage}



Which package of tideways-cli to use



*Type:*
package



*Default:*
` pkgs.tideways-cli `

*Declared by:*
 - [devenv/src/modules/services/tideways\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tideways.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tideways\.daemonPackage {#opt-perSystem.devenv.shells._name_.services.tideways.daemonPackage}



Which package of tideways-daemon to use



*Type:*
package



*Default:*
` pkgs.tideways-daemon `

*Declared by:*
 - [devenv/src/modules/services/tideways\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tideways.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tideways\.environment {#opt-perSystem.devenv.shells._name_.services.tideways.environment}



Sets the Environment for Tideways Daemon\.



*Type:*
string



*Default:*
` "devenv" `

*Declared by:*
 - [devenv/src/modules/services/tideways\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tideways.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tideways\.profilingSpace {#opt-perSystem.devenv.shells._name_.services.tideways.profilingSpace}



When the profiling space is enabled, the default monitoring will be disabled\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/tideways\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tideways.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.tideways\.service {#opt-perSystem.devenv.shells._name_.services.tideways.service}



Sets the Service name for Tideways Daemon\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/services/tideways\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/tideways.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.enable {#opt-perSystem.devenv.shells._name_.services.trafficserver.enable}



Whether to enable Apache Traffic Server\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.package {#opt-perSystem.devenv.shells._name_.services.trafficserver.package}



Apache Traffic Server package



*Type:*
package



*Default:*
` pkgs.trafficserver `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.cache {#opt-perSystem.devenv.shells._name_.services.trafficserver.cache}



Caching rules that overrule the origin’s caching policy\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/cache\.config\.en\.html)
for more details\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*
` "dest_domain=example.com suffix=js action=never-cache" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.hosting {#opt-perSystem.devenv.shells._name_.services.trafficserver.hosting}



Partition the cache according to origin server or domain

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/hosting\.config\.en\.html)
for more details\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*
` "domain=example.com volume=1" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.ipAllow {#opt-perSystem.devenv.shells._name_.services.trafficserver.ipAllow}



Control client access to Traffic Server and Traffic Server connections
to upstream servers\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/ip_allow\.yaml\.en\.html)
for more details\.



*Type:*
null or YAML 1\.1 value



*Default:*
upstream defaults



*Example:*

```
{
  ip_allow = [{
    apply = "in";
    ip_addrs = "127.0.0.1";
    action = "allow";
    methods = "ALL";
  }];
}

```

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.logging {#opt-perSystem.devenv.shells._name_.services.trafficserver.logging}



Configure logs\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/logging\.yaml\.en\.html)
for more details\.



*Type:*
null or YAML 1\.1 value



*Default:*
upstream defaults



*Example:*
` { } `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.parent {#opt-perSystem.devenv.shells._name_.services.trafficserver.parent}



Identify the parent proxies used in an cache hierarchy\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/parent\.config\.en\.html)
for more details\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*

```
''
  dest_domain=. method=get parent="p1.example:8080; p2.example:8080" round_robin=true
''
```

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.plugins {#opt-perSystem.devenv.shells._name_.services.trafficserver.plugins}



Controls run-time loadable plugins available to Traffic Server, as
well as their configuration\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/plugin\.config\.en\.html)
for more details\.



*Type:*
list of (submodule)



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.plugins\.\*\.arg {#opt-perSystem.devenv.shells._name_.services.trafficserver.plugins._.arg}



arguments to pass to the plugin



*Type:*
string



*Default:*
` "" `



*Example:*
` "--header=ATS-My-Debug" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.plugins\.\*\.path {#opt-perSystem.devenv.shells._name_.services.trafficserver.plugins._.path}



Path to plugin\. The path can either be absolute, or relative to
the plugin directory\.



*Type:*
string



*Example:*
` "xdebug.so" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.records {#opt-perSystem.devenv.shells._name_.services.trafficserver.records}



List of configurable variables used by Traffic Server\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/records\.config\.en\.html)
for more details\.

When defining the values for the option ` x.y `, a nested attribute should
be used\. Using a flat attribute set with the attribute name ` x.y ` will
result in an error\.

If options for both ` x.y ` and ` x.y.z ` needs to be set, you can set
` x.y._ ` as ` x.y `\. This only applies to Traffic Server versions prior to
10\. Traffic Server 10 and onwards uses YAML configuration, which doesn’t
have this kind of problem\.



*Type:*
Traffic Server records value



*Default:*
` { } `



*Example:*

```
{
  proxy = {
    config = {
      proxy_name = "my_server";
    };
  };
}
```

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.remap {#opt-perSystem.devenv.shells._name_.services.trafficserver.remap}



URL remapping rules used by Traffic Server\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/remap\.config\.en\.html)
for more details\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*
` "map http://from.example http://origin.example" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.runroot {#opt-perSystem.devenv.shells._name_.services.trafficserver.runroot}



File layout used by Traffic Server



*Type:*
unspecified value *(read only)*

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.sni {#opt-perSystem.devenv.shells._name_.services.trafficserver.sni}



Configure aspects of TLS connection handling for both inbound and
outbound connections\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/sni\.yaml\.en\.html)
for more details\.



*Type:*
null or YAML 1\.1 value



*Default:*
` null `



*Example:*

```
{
  sni = [{
    fqdn = "no-http2.example.com";
    https = "off";
  }];
}

```

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.splitDns {#opt-perSystem.devenv.shells._name_.services.trafficserver.splitDns}



Specify the DNS server that Traffic Server should use under specific
conditions\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/splitdns\.config\.en\.html)
for more details\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*

```
''
  dest_domain=internal.corp.example named="255.255.255.255:212 255.255.255.254" def_domain=corp.example search_list="corp.example corp1.example"
  dest_domain=!internal.corp.example named=255.255.255.253
''
```

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.sslMulticert {#opt-perSystem.devenv.shells._name_.services.trafficserver.sslMulticert}

Configure SSL server certificates to terminate the SSL sessions\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/ssl_multicert\.config\.en\.html)
for more details\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `



*Example:*
` "dest_ip=* ssl_cert_name=default.pem" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.storage {#opt-perSystem.devenv.shells._name_.services.trafficserver.storage}



List all the storage that make up the Traffic Server cache\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/storage\.config\.en\.html)
for more details\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "${config.services.traffic-server.runroot.cachedir} 256M" `



*Example:*
` "/dev/disk/by-id/XXXXX volume=1" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.strategies {#opt-perSystem.devenv.shells._name_.services.trafficserver.strategies}



Specify the next hop proxies used in an cache hierarchy and the
algorithms used to select the next proxy\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/strategies\.yaml\.en\.html)
for more details\.



*Type:*
null or YAML 1\.1 value



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.trafficserver\.volume {#opt-perSystem.devenv.shells._name_.services.trafficserver.volume}



Manage cache space more efficiently and restrict disk usage by
creating cache volumes of different sizes\.

Consult the [upstream documentation](https://docs\.trafficserver\.apache\.org/en/latest/admin-guide/files/volume\.config\.en\.html)
for more details\.



*Type:*
null or YAML 1\.1 value



*Default:*
` "" `



*Example:*
` "volume=1 scheme=http size=20%" `

*Declared by:*
 - [devenv/src/modules/services/trafficserver](https://github.com/cachix/devenv/blob/main/src/modules/services/trafficserver)



## perSystem\.devenv\.shells\.\<name>\.services\.typesense\.enable {#opt-perSystem.devenv.shells._name_.services.typesense.enable}



Whether to enable typesense process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/typesense\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/typesense.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.typesense\.package {#opt-perSystem.devenv.shells._name_.services.typesense.package}



Which package of typesense to use



*Type:*
package



*Default:*
` pkgs.typesense `

*Declared by:*
 - [devenv/src/modules/services/typesense\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/typesense.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.typesense\.additionalArgs {#opt-perSystem.devenv.shells._name_.services.typesense.additionalArgs}



Additional arguments passed to ` typesense `\.



*Type:*
list of strings concatenated with “\\n”



*Default:*
` [ ] `



*Example:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/services/typesense\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/typesense.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.typesense\.apiKey {#opt-perSystem.devenv.shells._name_.services.typesense.apiKey}



API Key\.



*Type:*
string



*Default:*
` "example" `

*Declared by:*
 - [devenv/src/modules/services/typesense\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/typesense.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.typesense\.host {#opt-perSystem.devenv.shells._name_.services.typesense.host}



The HTTP host to accept connections\.



*Type:*
string



*Default:*
` "127.0.0.1" `

*Declared by:*
 - [devenv/src/modules/services/typesense\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/typesense.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.typesense\.port {#opt-perSystem.devenv.shells._name_.services.typesense.port}



The HTTP port to accept connections\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Default:*
` 8108 `

*Declared by:*
 - [devenv/src/modules/services/typesense\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/typesense.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.typesense\.searchOnlyKey {#opt-perSystem.devenv.shells._name_.services.typesense.searchOnlyKey}



Search Only Key\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/services/typesense\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/typesense.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.varnish\.enable {#opt-perSystem.devenv.shells._name_.services.varnish.enable}



Whether to enable Varnish process and expose utilities\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/varnish\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/varnish.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.varnish\.package {#opt-perSystem.devenv.shells._name_.services.varnish.package}



Which Varnish package to use\.



*Type:*
package



*Default:*
` pkgs.varnish `

*Declared by:*
 - [devenv/src/modules/services/varnish\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/varnish.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.varnish\.extraModules {#opt-perSystem.devenv.shells._name_.services.varnish.extraModules}



Varnish modules (except ‘std’)\.



*Type:*
list of package



*Default:*
` [ ] `



*Example:*
` [ pkgs.varnish73Packages.modules ] `

*Declared by:*
 - [devenv/src/modules/services/varnish\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/varnish.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.varnish\.listen {#opt-perSystem.devenv.shells._name_.services.varnish.listen}



Which address to listen on\.



*Type:*
string



*Default:*
` "127.0.0.1:6081" `

*Declared by:*
 - [devenv/src/modules/services/varnish\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/varnish.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.varnish\.memorySize {#opt-perSystem.devenv.shells._name_.services.varnish.memorySize}



How much memory to allocate to Varnish\.



*Type:*
string



*Default:*
` "64M" `

*Declared by:*
 - [devenv/src/modules/services/varnish\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/varnish.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.varnish\.vcl {#opt-perSystem.devenv.shells._name_.services.varnish.vcl}



Varnish VCL configuration\.



*Type:*
strings concatenated with “\\n”



*Default:*

```
''
  vcl 4.0;
  
  backend default {
    .host = "127.0.0.1";
    .port = "80";
  }
''
```

*Declared by:*
 - [devenv/src/modules/services/varnish\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/varnish.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.vault\.enable {#opt-perSystem.devenv.shells._name_.services.vault.enable}



Whether to enable vault process\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/vault.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.vault\.package {#opt-perSystem.devenv.shells._name_.services.vault.package}



Which package of Vault to use\.



*Type:*
package



*Default:*
` pkgs.vault-bin `

*Declared by:*
 - [devenv/src/modules/services/vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/vault.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.vault\.address {#opt-perSystem.devenv.shells._name_.services.vault.address}



Specifies the address to bind to for listening



*Type:*
string



*Default:*
` "127.0.0.1:8200" `

*Declared by:*
 - [devenv/src/modules/services/vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/vault.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.vault\.disableClustering {#opt-perSystem.devenv.shells._name_.services.vault.disableClustering}



Specifies whether clustering features such as request forwarding are enabled



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/vault.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.vault\.disableMlock {#opt-perSystem.devenv.shells._name_.services.vault.disableMlock}



Disables the server from executing the mlock syscall



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/vault.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.vault\.ui {#opt-perSystem.devenv.shells._name_.services.vault.ui}



Enables the built-in web UI



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [devenv/src/modules/services/vault\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/vault.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.wiremock\.enable {#opt-perSystem.devenv.shells._name_.services.wiremock.enable}



Whether to enable WireMock\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/services/wiremock\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/wiremock.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.wiremock\.package {#opt-perSystem.devenv.shells._name_.services.wiremock.package}



Which package of WireMock to use\.



*Type:*
package



*Default:*
` pkgs.wiremock `

*Declared by:*
 - [devenv/src/modules/services/wiremock\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/wiremock.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.wiremock\.disableBanner {#opt-perSystem.devenv.shells._name_.services.wiremock.disableBanner}



Whether to disable print banner logo\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/wiremock\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/wiremock.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.wiremock\.mappings {#opt-perSystem.devenv.shells._name_.services.wiremock.mappings}



The mappings to mock\.
See the JSON examples on [https://wiremock\.org/docs/stubbing/](https://wiremock\.org/docs/stubbing/) for more information\.



*Type:*
JSON value



*Default:*
` [ ] `



*Example:*

```
[
  {
    request = {
      method = "GET";
      url = "/body";
    };
    response = {
      body = "Literal text to put in the body";
      headers = {
        Content-Type = "text/plain";
      };
      status = 200;
    };
  }
  {
    request = {
      method = "GET";
      url = "/json";
    };
    response = {
      jsonBody = {
        someField = "someValue";
      };
      status = 200;
    };
  }
]
```

*Declared by:*
 - [devenv/src/modules/services/wiremock\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/wiremock.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.wiremock\.port {#opt-perSystem.devenv.shells._name_.services.wiremock.port}



The port number for the HTTP server to listen on\.



*Type:*
signed integer



*Default:*
` 8080 `

*Declared by:*
 - [devenv/src/modules/services/wiremock\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/wiremock.nix)



## perSystem\.devenv\.shells\.\<name>\.services\.wiremock\.verbose {#opt-perSystem.devenv.shells._name_.services.wiremock.verbose}



Whether to log verbosely to stdout\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/services/wiremock\.nix](https://github.com/cachix/devenv/blob/main/src/modules/services/wiremock.nix)



## perSystem\.devenv\.shells\.\<name>\.starship\.enable {#opt-perSystem.devenv.shells._name_.starship.enable}



Whether to enable the Starship\.rs command prompt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/starship\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/starship.nix)



## perSystem\.devenv\.shells\.\<name>\.starship\.package {#opt-perSystem.devenv.shells._name_.starship.package}



The Starship package to use\.



*Type:*
package



*Default:*
` pkgs.starship `

*Declared by:*
 - [devenv/src/modules/integrations/starship\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/starship.nix)



## perSystem\.devenv\.shells\.\<name>\.starship\.config\.enable {#opt-perSystem.devenv.shells._name_.starship.config.enable}



Whether to enable Starship config override\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/starship\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/starship.nix)



## perSystem\.devenv\.shells\.\<name>\.starship\.config\.path {#opt-perSystem.devenv.shells._name_.starship.config.path}



The Starship configuration file to use\.



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` ${config.env.DEVENV_ROOT}/starship.toml `

*Declared by:*
 - [devenv/src/modules/integrations/starship\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/starship.nix)



## perSystem\.devenv\.shells\.\<name>\.starship\.config\.settings {#opt-perSystem.devenv.shells._name_.starship.config.settings}



Starship configuration to use



*Type:*
TOML value



*Default:*
` {} `

*Declared by:*
 - [devenv/src/modules/integrations/starship\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/starship.nix)



## perSystem\.devenv\.shells\.\<name>\.stdenv {#opt-perSystem.devenv.shells._name_.stdenv}



The stdenv to use for the developer environment\.



*Type:*
package



*Default:*
` pkgs.stdenv `

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks {#opt-perSystem.devenv.shells._name_.tasks}



A set of tasks\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.package {#opt-perSystem.devenv.shells._name_.tasks._name_.package}



Package to install for this task\.



*Type:*
package



*Default:*
` pkgs.bash `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.after {#opt-perSystem.devenv.shells._name_.tasks._name_.after}



List of tasks that must complete before this task runs\.

Here’s a helpful mnemonic to remember: This task runs *after* these tasks\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.before {#opt-perSystem.devenv.shells._name_.tasks._name_.before}



List of tasks that depend on this task completing first\.

Here’s a helpful mnemonic to remember: This task runs *before* these tasks\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.binary {#opt-perSystem.devenv.shells._name_.tasks._name_.binary}



Override the binary name from the default ` package.meta.mainProgram `\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.cwd {#opt-perSystem.devenv.shells._name_.tasks._name_.cwd}



Working directory to run the task in\. If not specified, the current working directory will be used\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.description {#opt-perSystem.devenv.shells._name_.tasks._name_.description}



Description of the task\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.exec {#opt-perSystem.devenv.shells._name_.tasks._name_.exec}



Command to execute the task\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.execIfModified {#opt-perSystem.devenv.shells._name_.tasks._name_.execIfModified}



Paths to files that should trigger a task execution if modified\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.exports {#opt-perSystem.devenv.shells._name_.tasks._name_.exports}



List of environment variables to export\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.input {#opt-perSystem.devenv.shells._name_.tasks._name_.input}



Input values for the task, encoded as JSON\.



*Type:*
attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.showOutput {#opt-perSystem.devenv.shells._name_.tasks._name_.showOutput}



Always show task output (stdout and stderr), regardless of whether the task succeeds or fails\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.status {#opt-perSystem.devenv.shells._name_.tasks._name_.status}



Check if the command should be ran



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.tasks\.\<name>\.type {#opt-perSystem.devenv.shells._name_.tasks._name_.type}



Type of task:

 - oneshot: Task runs once and completes (default)
 - process: Task is a long-running process



*Type:*
one of “oneshot”, “process”



*Default:*
` "oneshot" `

*Declared by:*
 - [devenv/src/modules/tasks\.nix](https://github.com/cachix/devenv/blob/main/src/modules/tasks.nix)



## perSystem\.devenv\.shells\.\<name>\.treefmt\.enable {#opt-perSystem.devenv.shells._name_.treefmt.enable}



Whether to enable treefmt integration (through treefmt-nix)\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [devenv/src/modules/integrations/treefmt\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/treefmt.nix)



## perSystem\.devenv\.shells\.\<name>\.treefmt\.config {#opt-perSystem.devenv.shells._name_.treefmt.config}



treefmt configuration\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [devenv/src/modules/integrations/treefmt\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/treefmt.nix)



## perSystem\.devenv\.shells\.\<name>\.treefmt\.config\.pkgs {#opt-perSystem.devenv.shells._name_.treefmt.config.pkgs}



Nixpkgs to use in ` treefmt `\.



*Type:*
lazy attribute set of raw value

*Declared by:*
 - [devenv/src/modules/integrations/treefmt\.nix](https://github.com/cachix/devenv/blob/main/src/modules/integrations/treefmt.nix)



## perSystem\.devenv\.shells\.\<name>\.unsetEnvVars {#opt-perSystem.devenv.shells._name_.unsetEnvVars}



A list of removed environment variables to make the shell/direnv more lean\.



*Type:*
list of string



*Default:*

```
[
  "HOST_PATH"
  "NIX_BUILD_CORES"
  "__structuredAttrs"
  "buildInputs"
  "buildPhase"
  "builder"
  "depsBuildBuild"
  "depsBuildBuildPropagated"
  "depsBuildTarget"
  "depsBuildTargetPropagated"
  "depsHostHost"
  "depsHostHostPropagated"
  "depsTargetTarget"
  "depsTargetTargetPropagated"
  "dontAddDisableDepTrack"
  "doCheck"
  "doInstallCheck"
  "nativeBuildInputs"
  "out"
  "outputs"
  "patches"
  "phases"
  "preferLocalBuild"
  "propagatedBuildInputs"
  "propagatedNativeBuildInputs"
  "shell"
  "shellHook"
  "stdenv"
  "strictDeps"
]
```

*Declared by:*
 - [devenv/src/modules/top-level\.nix](https://github.com/cachix/devenv/blob/main/src/modules/top-level.nix)

