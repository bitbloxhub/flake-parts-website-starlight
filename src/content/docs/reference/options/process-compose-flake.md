---
title: process-compose-flake

---




This flake-parts module allows you to declare one or more process-compose configurations using Nix attribute sets. It will generate corresponding packages that wrap the [process-compose](https://github.com/F1bonacc1/process-compose) binary with the given configuration.

See [quick example](https://community.flake.parts/process-compose-flake#quick-example) to get started with [process-compose-flake](https://github.com/Platonic-Systems/process-compose-flake)


## Installation

To use these options, add to your flake inputs:

```nix
process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
```

and inside the `mkFlake`:


```nix
imports = [
  inputs.process-compose-flake.flakeModule
];
```

Run `nix flake lock` and you're set.

## Options

## perSystem\.process-compose {#opt-perSystem.process-compose}

process-compose-flake: creates [process-compose](https://github\.com/F1bonacc1/process-compose)
executables from process-compose configurations written as Nix attribute sets\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [process-compose-flake/nix/flake-module\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/flake-module.nix)



## perSystem\.process-compose\.\<name>\.package {#opt-perSystem.process-compose._name_.package}



The process-compose package to bundle up in the command package and flake app\.



*Type:*
package



*Default:*
` pkgs.process-compose `

*Declared by:*
 - [process-compose-flake/nix/process-compose](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose)



## perSystem\.process-compose\.\<name>\.cli\.environment {#opt-perSystem.process-compose._name_.cli.environment}



Environment variables to pass to process-compose binary\.
Note that flags directly configured via cli\.options will override these values\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_ADDRESS {#opt-perSystem.process-compose._name_.cli.environment.PC_ADDRESS}



address on which to bind process-compose listener



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_CONFIG_FILES {#opt-perSystem.process-compose._name_.cli.environment.PC_CONFIG_FILES}



comma-separated list of path to config files to load



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_DISABLED_PROCESSES {#opt-perSystem.process-compose._name_.cli.environment.PC_DISABLED_PROCESSES}



comma-separated list of process to initially disable



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_DISABLE_DOTENV {#opt-perSystem.process-compose._name_.cli.environment.PC_DISABLE_DOTENV}



disable \.env file loading



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_DISABLE_TUI {#opt-perSystem.process-compose._name_.cli.environment.PC_DISABLE_TUI}



disable the TUI (Text User Interface) of process-compose



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_HIDE_DISABLED_PROC {#opt-perSystem.process-compose._name_.cli.environment.PC_HIDE_DISABLED_PROC}



hide disabled processes



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_LOG_FILE {#opt-perSystem.process-compose._name_.cli.environment.PC_LOG_FILE}



specify the log file path



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_NO_SERVER {#opt-perSystem.process-compose._name_.cli.environment.PC_NO_SERVER}



disable HTTP server



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_ORDERED_SHUTDOWN {#opt-perSystem.process-compose._name_.cli.environment.PC_ORDERED_SHUTDOWN}



shut down processes in reverse dependency order



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_PORT_NUM {#opt-perSystem.process-compose._name_.cli.environment.PC_PORT_NUM}



port number on which to bind process-compose listener



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_READ_ONLY {#opt-perSystem.process-compose._name_.cli.environment.PC_READ_ONLY}



enable read-only mode



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_RECURSIVE_METRICS {#opt-perSystem.process-compose._name_.cli.environment.PC_RECURSIVE_METRICS}



collect metrics recursively



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_SHORTCUTS_FILES {#opt-perSystem.process-compose._name_.cli.environment.PC_SHORTCUTS_FILES}



comma-separated list of paths to shortcut config files to load



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_SOCKET_PATH {#opt-perSystem.process-compose._name_.cli.environment.PC_SOCKET_PATH}



path to unix socket



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.environment\.PC_TUI_FULL_SCREEN {#opt-perSystem.process-compose._name_.cli.environment.PC_TUI_FULL_SCREEN}



enable TUI full screen



*Type:*
null or boolean



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options {#opt-perSystem.process-compose._name_.cli.options}



CLI options to pass to process-compose binary



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.keep-project {#opt-perSystem.process-compose._name_.cli.options.keep-project}



Pass --keep-project to process-compose



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.log-file {#opt-perSystem.process-compose._name_.cli.options.log-file}



Pass --log-file to process-compose



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.no-server {#opt-perSystem.process-compose._name_.cli.options.no-server}



Pass --no-server to process-compose



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.ordered-shutdown {#opt-perSystem.process-compose._name_.cli.options.ordered-shutdown}



Pass --ordered-shutdown to process-compose



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.port {#opt-perSystem.process-compose._name_.cli.options.port}



Pass --port to process-compose



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.read-only {#opt-perSystem.process-compose._name_.cli.options.read-only}



Pass --read-only to process-compose



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.unix-socket {#opt-perSystem.process-compose._name_.cli.options.unix-socket}



Pass --unix-socket to process-compose



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.options\.use-uds {#opt-perSystem.process-compose._name_.cli.options.use-uds}



Pass --use-uds to process-compose



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.outputs\.environment {#opt-perSystem.process-compose._name_.cli.outputs.environment}



Shell script prefix setting environment variables



*Type:*
string *(read only)*



*Default:*
` "              " `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.outputs\.options {#opt-perSystem.process-compose._name_.cli.outputs.options}



The final CLI arguments we will pass to process-compose binary\.



*Type:*
string *(read only)*



*Default:*
` "" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.postHook {#opt-perSystem.process-compose._name_.cli.postHook}



Shell commands to run after process-compose completes\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.cli\.preHook {#opt-perSystem.process-compose._name_.cli.preHook}



Shell commands to run before process-compose starts\.



*Type:*
strings concatenated with “\\n”



*Default:*
` "" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/cli\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/cli.nix)



## perSystem\.process-compose\.\<name>\.defaults\.enable {#opt-perSystem.process-compose._name_.defaults.enable}



Whether to enable default settings for processes in this configuration\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/defaults\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/defaults.nix)



## perSystem\.process-compose\.\<name>\.defaults\.processSettings {#opt-perSystem.process-compose._name_.defaults.processSettings}



Default settings that will be applied to all processes in this configuration\.

Individual process settings can override these defaults\. When setting defaults,
use ` lib.mkDefault ` to ensure individual process settings take precedence\.

Example:

```nix
defaults.processSettings = {
  availability.restart = lib.mkDefault "on_failure";
  availability.max_restarts = lib.mkDefault 3;
  namespace = lib.mkDefault "myapp";
};
```



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [process-compose-flake/nix/process-compose/defaults\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/defaults.nix)



## perSystem\.process-compose\.\<name>\.outputs\.package {#opt-perSystem.process-compose._name_.outputs.package}



The final package that will run ‘process-compose up’ for this configuration\.



*Type:*
package

*Declared by:*
 - [process-compose-flake/nix/process-compose](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose)



## perSystem\.process-compose\.\<name>\.outputs\.check {#opt-perSystem.process-compose._name_.outputs.check}



Run the ` process-compose ` package with ` test ` process Enabled\.

Note: This is meant to be run in CI\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/test\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/test.nix)



## perSystem\.process-compose\.\<name>\.outputs\.testPackage {#opt-perSystem.process-compose._name_.outputs.testPackage}



Like ` outputs.package ` but includes the “test” process

Set to null if there is no “test” process\.



*Type:*
null or package

*Declared by:*
 - [process-compose-flake/nix/process-compose](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose)



## perSystem\.process-compose\.\<name>\.settings {#opt-perSystem.process-compose._name_.settings}



For each attribute ` x = process-compose config ` a flake app and package ` x ` is added to the flake\.
Which runs process-compose with the declared config\.



*Type:*
submodule



*Default:*
` { } `



*Example:*

```
{
  watch-server = {
    processes = {
      backend = "${pkgs.simple-http-server}";
      frontend = "${pkgs.simple-http-server}";
    };
  };
};

```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.disable_env_expansion {#opt-perSystem.process-compose._name_.settings.disable_env_expansion}



Globally disables automatic $ variable expansion\.
Enabled by default, unlike upstream process-compose\.



*Type:*
null or boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.env_cmds {#opt-perSystem.process-compose._name_.settings.env_cmds}



Dynamically populate environment variables by executing commands before starting processes\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  OS_NAME = "awk -F = '/PRETTY/ {print $2}' /etc/os-release";
  UPTIME = "uptime -p";
}
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.environment {#opt-perSystem.process-compose._name_.settings.environment}



Attrset of environment variables\.

List of strings is also allowed\.



*Type:*
null or (list of string) or attribute set of string



*Default:*
` null `



*Example:*

```
{
  ABC = "2221";
  PRINT_ERR = "111";
}
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.extends {#opt-perSystem.process-compose._name_.settings.extends}



Make the current configuration inherit all values in the given file\.

See https://f1bonacc1\.github\.io/process-compose/merge\#configuration-inheritance-with-extends



*Type:*
null or absolute path



*Default:*
` null `



*Example:*
` "process-compose.base.yaml" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.is_strict {#opt-perSystem.process-compose._name_.settings.is_strict}



Enables additional checks on YAML configuration correctness\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration {#opt-perSystem.process-compose._name_.settings.log_configuration}



The default settings for global logging\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.add_timestamp {#opt-perSystem.process-compose._name_.settings.log_configuration.add_timestamp}



If enabled, prepends a timestamp to log entries\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.disable_json {#opt-perSystem.process-compose._name_.settings.log_configuration.disable_json}



If enabled, output as plain text rather than json\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.fields_order {#opt-perSystem.process-compose._name_.settings.log_configuration.fields_order}



Order of logging fields\. The default is time, level, message



*Type:*
null or (list of (one of “time”, “level”, “message”))



*Default:*
` null `



*Example:*

```
[
  "time"
  "level"
  "message"
]
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.flush_each_line {#opt-perSystem.process-compose._name_.settings.log_configuration.flush_each_line}



If enabled, disables output buffering and flushes each line to the logfile immediately\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.no_color {#opt-perSystem.process-compose._name_.settings.log_configuration.no_color}



Enabling ` no_color ` prevents the use of ANSI colors in the logger\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.no_metadata {#opt-perSystem.process-compose._name_.settings.log_configuration.no_metadata}



If enabled, do not add process name and replica number to logs\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.rotation {#opt-perSystem.process-compose._name_.settings.log_configuration.rotation}



Settings related to process log rotation\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.rotation\.compress {#opt-perSystem.process-compose._name_.settings.log_configuration.rotation.compress}



If enabled, compress rolled logfiles with gzip\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.rotation\.max_age_days {#opt-perSystem.process-compose._name_.settings.log_configuration.rotation.max_age_days}



Maximum age in days to keep a rolled logfile\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 7 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.rotation\.max_backups {#opt-perSystem.process-compose._name_.settings.log_configuration.rotation.max_backups}



Maximum number of rolled logfiles to keep\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 3 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.rotation\.max_size_mb {#opt-perSystem.process-compose._name_.settings.log_configuration.rotation.max_size_mb}



Maximum size in MB of the logfile before it’s rolled\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 1 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_configuration\.timestamp_format {#opt-perSystem.process-compose._name_.settings.log_configuration.timestamp_format}



Timestamp format, per Go’s time\.Parse function\.
Requires ` add_timestamp ` be enabled to be effective\.

See https://pkg\.go\.dev/time\#pkg-constants for examples\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "2006-01-02T15:04:05.000Z" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.log_length {#opt-perSystem.process-compose._name_.settings.log_length}



Log length to display in TUI mode\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 3000 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.log_level {#opt-perSystem.process-compose._name_.settings.log_level}



Level of logs to output\.



*Type:*
null or one of “trace”, “debug”, “info”, “warn”, “error”, “fatal”, “panic”



*Default:*
` null `



*Example:*
` "info" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.log_location {#opt-perSystem.process-compose._name_.settings.log_location}



File to write the logs to\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "./pc.log" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.ordered_shutdown {#opt-perSystem.process-compose._name_.settings.ordered_shutdown}



Causes processes to shut down in reverse dependency order\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.processes {#opt-perSystem.process-compose._name_.settings.processes}



A map of process names to their configuration\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.availability\.backoff_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.availability.backoff_seconds}



Restart will wait ` process.availability.backoff_seconds ` seconds between ` stop ` and ` start ` of the process\. If not configured the default value is 1s\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.availability\.exit_on_end {#opt-perSystem.process-compose._name_.settings.processes._name_.availability.exit_on_end}



Whether to gracefully stop all the processes upon the exit of the current process\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.availability\.exit_on_skipped {#opt-perSystem.process-compose._name_.settings.processes._name_.availability.exit_on_skipped}



Whether to gracefully stop all the processes upon the process being skipped\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.availability\.max_restarts {#opt-perSystem.process-compose._name_.settings.processes._name_.availability.max_restarts}



Max\. number of times to restart\.

Tip: It might be sometimes useful to ` exit_on_end ` with ` restart: on_failure ` and ` max_restarts ` in case you want the process to recover from failure and only cause termination on success\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 0 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.availability\.restart {#opt-perSystem.process-compose._name_.settings.processes._name_.availability.restart}



When to restart the process\.



*Type:*
null or one of “always”, “on_failure”, “exit_on_failure”, “no”



*Default:*
` null `



*Example:*
` "on_failure" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.command {#opt-perSystem.process-compose._name_.settings.processes._name_.command}



The command or script or package that runs this process

If a package is given, its executable is used as the command\. Otherwise,
the command string is wrapped in a ` pkgs.writeShellApplication ` which
uses ShellCheck and runs the command in bash\.



*Type:*
package or string

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.depends_on {#opt-perSystem.process-compose._name_.settings.processes._name_.depends_on}



Process dependency relationships



*Type:*
null or (attribute set of (submodule))



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.depends_on\.\<name>\.condition {#opt-perSystem.process-compose._name_.settings.processes._name_.depends_on._name_.condition}



The condition the parent process must be in before starting the current one\.



*Type:*
one of “process_completed”, “process_completed_successfully”, “process_healthy”, “process_log_ready”, “process_started”



*Example:*
` "process_healthy" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.description {#opt-perSystem.process-compose._name_.settings.processes._name_.description}



Set a description for the process in the UI\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "process does a thing" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.disable_ansi_colors {#opt-perSystem.process-compose._name_.settings.processes._name_.disable_ansi_colors}



Whether to disable colors in the logs\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.disabled {#opt-perSystem.process-compose._name_.settings.processes._name_.disabled}



Whether the process is disabled\. Useful when a process is required to be started only in a given scenario, like while running in CI\.

Even if disabled, the process is still listed in the TUI and the REST client, and can be started manually when needed\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.entrypoint {#opt-perSystem.process-compose._name_.settings.processes._name_.entrypoint}



Specifies the process command as a list of arguments\.
Overridden by the command option if it is present\.



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
[
  "ls"
  "-l"
  "/some/dir"
]
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.environment {#opt-perSystem.process-compose._name_.settings.processes._name_.environment}



Attrset of environment variables\.

List of strings is also allowed\.



*Type:*
null or (list of string) or attribute set of string



*Default:*
` null `



*Example:*

```
{
  ABC = "2221";
  PRINT_ERR = "111";
}
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.is_daemon {#opt-perSystem.process-compose._name_.settings.processes._name_.is_daemon}



 - For processes that start services / daemons in the background, please use the ` is_daemon ` flag set to ` true `\.
 - In case a process is daemon it will be considered running until stopped\.
 - Daemon processes can only be stopped with the ` $PROCESSNAME.shutdown.command ` as in the example above\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.is_disabled {#opt-perSystem.process-compose._name_.settings.processes._name_.is_disabled}



Allows turning off the disabled flag when dealing with merged configs via ` extend ` or multiple config file command arguments\.

is_disabled has priority over disabled, so in general:

 - use disabled in base or primary configurations
 - use is_disabled in override configurations\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.is_dotenv_disabled {#opt-perSystem.process-compose._name_.settings.processes._name_.is_dotenv_disabled}



If set to true, prevents process-compose from loading any \.env files in the working directory\.

Does not prevent other sources of env variables, such as the env section of the configuration\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.is_elevated {#opt-perSystem.process-compose._name_.settings.processes._name_.is_elevated}



Run the command with elevated permissions,
using sudo or runas\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.is_foreground {#opt-perSystem.process-compose._name_.settings.processes._name_.is_foreground}



Foreground processes are useful for cases when a full ` tty ` access is required (e\.g\. ` vim `, ` top `, ` gdb -tui `)

 - Foreground process have to be started manually (` F7 `)\. They can be started multiple times\.
 - They are available in TUI mode only\.
 - To return to TUI, exit the foreground process\.
 - In TUI mode, a local process will be started\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.is_tty {#opt-perSystem.process-compose._name_.settings.processes._name_.is_tty}



Simulate TTY mode for this process



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.launch_timeout_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.launch_timeout_seconds}



If a parent process with is_daemon takes longer than this to fork in to the background, process-compose will stop waiting for logs and start waiting for process termination\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe}



The settings used to check if the process is alive\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.exec {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.exec}



Execution settings\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.exec\.command {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.exec.command}



The command to execute in order to check the health of the process\.



*Type:*
string



*Example:*
` "ps -ef | grep -v grep | grep my-proccess" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.exec\.working_dir {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.exec.working_dir}



Directory in which to execute the exec probe command\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "./directory" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.failure_threshold {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.failure_threshold}



Number of times to fail before giving up on restarting the process\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 3 `



*Example:*
` 3 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.http_get {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.http_get}



URL to determine the health of the process\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.http_get\.headers {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.http_get.headers}



Additional headers to set on an HTTP probe



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  x-foo = "bar";
}
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.http_get\.host {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.http_get.host}



The host address which ` process-compose ` uses to probe the process\.



*Type:*
string



*Example:*
` "google.com" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.http_get\.path {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.http_get.path}



The path to the healtcheck endpoint\.



*Type:*
string



*Default:*
` "/" `



*Example:*
` "/" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.http_get\.port {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.http_get.port}



Which port to probe the process on\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Example:*
` "8080" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.http_get\.scheme {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.http_get.scheme}



The protocol used to probe the process listening on ` host `\.



*Type:*
string



*Default:*
` "http" `



*Example:*
` "http" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.http_get\.status_code {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.http_get.status_code}



Expected status code\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 200 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.initial_delay_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.initial_delay_seconds}



Wait for ` initial_delay_seconds ` before starting the probe/healthcheck\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 0 `



*Example:*
` 0 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.period_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.period_seconds}



Check the health every ` period_seconds `\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 10 `



*Example:*
` 10 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.success_threshold {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.success_threshold}



Number of successful checks before marking the process ` Ready `\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 1 `



*Example:*
` 1 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.liveness_probe\.timeout_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.liveness_probe.timeout_seconds}



How long to wait for a given probe request\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 3 `



*Example:*
` 3 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration}



The settings for process-specific logging\.



*Type:*
null or (submodule)



*Default:*
` { } `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.add_timestamp {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.add_timestamp}



If enabled, prepends a timestamp to log entries\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.disable_json {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.disable_json}



If enabled, output as plain text rather than json\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.fields_order {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.fields_order}



Order of logging fields\. The default is time, level, message



*Type:*
null or (list of (one of “time”, “level”, “message”))



*Default:*
` null `



*Example:*

```
[
  "time"
  "level"
  "message"
]
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.flush_each_line {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.flush_each_line}

If enabled, disables output buffering and flushes each line to the logfile immediately\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.no_color {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.no_color}



Enabling ` no_color ` prevents the use of ANSI colors in the logger\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.no_metadata {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.no_metadata}



If enabled, do not add process name and replica number to logs\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.rotation {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.rotation}



Settings related to process log rotation\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.rotation\.compress {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.rotation.compress}



If enabled, compress rolled logfiles with gzip\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.rotation\.max_age_days {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.rotation.max_age_days}



Maximum age in days to keep a rolled logfile\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 7 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.rotation\.max_backups {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.rotation.max_backups}



Maximum number of rolled logfiles to keep\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 3 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.rotation\.max_size_mb {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.rotation.max_size_mb}



Maximum size in MB of the logfile before it’s rolled\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 1 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_configuration\.timestamp_format {#opt-perSystem.process-compose._name_.settings.processes._name_.log_configuration.timestamp_format}



Timestamp format, per Go’s time\.Parse function\.
Requires ` add_timestamp ` be enabled to be effective\.

See https://pkg\.go\.dev/time\#pkg-constants for examples\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "2006-01-02T15:04:05.000Z" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/log-config\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/log-config.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.log_location {#opt-perSystem.process-compose._name_.settings.processes._name_.log_location}



Log location of the ` process-compose ` process\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "./pc.my-proccess.log" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.namespace {#opt-perSystem.process-compose._name_.settings.processes._name_.namespace}



Used to group processes together\.



*Type:*
string



*Default:*
` "default" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe}



The settings used to check if the process is ready to accept connections\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.exec {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.exec}



Execution settings\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.exec\.command {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.exec.command}



The command to execute in order to check the health of the process\.



*Type:*
string



*Example:*
` "ps -ef | grep -v grep | grep my-proccess" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.exec\.working_dir {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.exec.working_dir}



Directory in which to execute the exec probe command\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "./directory" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.failure_threshold {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.failure_threshold}



Number of times to fail before giving up on restarting the process\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 3 `



*Example:*
` 3 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.http_get {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.http_get}



URL to determine the health of the process\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.http_get\.headers {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.http_get.headers}



Additional headers to set on an HTTP probe



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  x-foo = "bar";
}
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.http_get\.host {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.http_get.host}



The host address which ` process-compose ` uses to probe the process\.



*Type:*
string



*Example:*
` "google.com" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.http_get\.path {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.http_get.path}



The path to the healtcheck endpoint\.



*Type:*
string



*Default:*
` "/" `



*Example:*
` "/" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.http_get\.port {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.http_get.port}



Which port to probe the process on\.



*Type:*
16 bit unsigned integer; between 0 and 65535 (both inclusive)



*Example:*
` "8080" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.http_get\.scheme {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.http_get.scheme}



The protocol used to probe the process listening on ` host `\.



*Type:*
string



*Default:*
` "http" `



*Example:*
` "http" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.http_get\.status_code {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.http_get.status_code}



Expected status code\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 200 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.initial_delay_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.initial_delay_seconds}



Wait for ` initial_delay_seconds ` before starting the probe/healthcheck\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 0 `



*Example:*
` 0 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.period_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.period_seconds}



Check the health every ` period_seconds `\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 10 `



*Example:*
` 10 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.success_threshold {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.success_threshold}



Number of successful checks before marking the process ` Ready `\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 1 `



*Example:*
` 1 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.readiness_probe\.timeout_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.readiness_probe.timeout_seconds}



How long to wait for a given probe request\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 3 `



*Example:*
` 3 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/probe\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/probe.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.ready_log_line {#opt-perSystem.process-compose._name_.settings.processes._name_.ready_log_line}



A string to search for in the output of the command that indicates
the process is ready\. String will be part of a regex ‘\.*{ready_log_line}\.*’\.
This should be used for long running processes that do not have a
readily accessible check for http or similar other checks\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "process is ready" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.replicas {#opt-perSystem.process-compose._name_.settings.processes._name_.replicas}



Run multiple replicas of a given process\.

Will set the PC_REPLICA_NUM var for expansion such that configs can run on unique ports or similar\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.shutdown\.command {#opt-perSystem.process-compose._name_.settings.processes._name_.shutdown.command}



The command to run while process-compose is trying to gracefully shutdown the current process\.

Note: The ` shutdown.command ` is executed with all the Environment Variables of the primary process



*Type:*
null or string



*Default:*
` null `



*Example:*
` "sleep 2 && pkill -f 'test_loop.bash my-proccess'" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.shutdown\.parent_only {#opt-perSystem.process-compose._name_.settings.processes._name_.shutdown.parent_only}



If ` shutdown.parent_only ` is enabled, the termination signal is only sent to the parent process, not the whole group\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.shutdown\.signal {#opt-perSystem.process-compose._name_.settings.processes._name_.shutdown.signal}



If ` shutdown.command ` is not defined, exit the process with this signal\. Defaults to ` 15 ` (SIGTERM)



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 15 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.shutdown\.timeout_seconds {#opt-perSystem.process-compose._name_.settings.processes._name_.shutdown.timeout_seconds}



Wait for ` timeout_seconds ` for its completion (if not defined wait for 10 seconds)\. Upon timeout, ` SIGKILL ` is sent to the process\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 10 `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.vars {#opt-perSystem.process-compose._name_.settings.processes._name_.vars}



Variables used by process-compose to expand Go Template configs on various values\.

Includes processes\.process\.command, working_dir, log_location, etc\.
See https://f1bonacc1\.github\.io/process-compose/configuration\#variables



*Type:*
null or (attribute set of anything)



*Default:*
` null `



*Example:*

```
{
  A_NUMBER = 8888;
  OK = "SUCCESS";
  THIS = "THAT";
}
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.processes\.\<name>\.working_dir {#opt-perSystem.process-compose._name_.settings.processes._name_.working_dir}



The directory to run the process in\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "/tmp" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings/process\.nix](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings/process.nix)



## perSystem\.process-compose\.\<name>\.settings\.shell\.shell_argument {#opt-perSystem.process-compose._name_.settings.shell.shell_argument}



Arguments to pass to the shell given by ` shell_command `\.



*Type:*
string



*Default:*
` "-c" `



*Example:*
` "-c" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.shell\.shell_command {#opt-perSystem.process-compose._name_.settings.shell.shell_command}



The shell to use to run the process ` command `s\.

For reproducibility across systems, by default this uses
` pkgs.bash `\.



*Type:*
string



*Default:*
` "lib.getExe pkgs.bash" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.vars {#opt-perSystem.process-compose._name_.settings.vars}



Variables used by process-compose to expand Go Template configs on various values\.

Includes processes\.process\.command, working_dir, log_location, etc\.
See https://f1bonacc1\.github\.io/process-compose/configuration\#variables



*Type:*
null or (attribute set of anything)



*Default:*
` null `



*Example:*

```
{
  A_NUMBER = 8888;
  OK = "SUCCESS";
  THIS = "THAT";
}
```

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)



## perSystem\.process-compose\.\<name>\.settings\.version {#opt-perSystem.process-compose._name_.settings.version}



Version of the process-compose configuration\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "0.5" `

*Declared by:*
 - [process-compose-flake/nix/process-compose/settings](https://github.com/Platonic-Systems/process-compose-flake/blob/main/nix/process-compose/settings)

