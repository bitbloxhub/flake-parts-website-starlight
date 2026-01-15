---
title: nix-oci

---




**nix-oci** is a [flake-parts](https://github.com/hercules-ci/flake-parts) module designed to streamline the management of OCI (Open Container Initiative) repositories using the Nix package manager.
By leveraging [nix2container](https://github.com/nlewo/nix2container) as its backend, nix-oci facilitates the declarative creation and handling of container images, ensuring reproducibility and efficiency in containerized environments.


## Installation

See the [readme](https://github.com/dauliac/nix-oci).

## Options

## oci\.enableDevShell {#opt-oci.enableDevShell}



Whether to enable the flake development shell\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/default\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/default.nix)



## oci\.enabled {#opt-oci.enabled}



Whether to enable Enable the OCI module…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/default\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/default.nix)



## oci\.credentialsLeak {#opt-oci.credentialsLeak}

Options for credential leak detection in container images\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/credentials-leak\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/credentials-leak.nix)



## oci\.credentialsLeak\.configPath {#opt-oci.credentialsLeak.configPath}



Path where global credentials leak check configuration files will be stored\.



*Type:*
absolute path



*Default:*
` config.oci.rootPath + "/credentials-leak/" `

*Declared by:*
 - [nix-oci/nix/modules/credentials-leak\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/credentials-leak.nix)



## oci\.credentialsLeak\.trivy {#opt-oci.credentialsLeak.trivy}



Configuration for detecting credentials leaks using Trivy\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/credentials-leak\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/credentials-leak.nix)



## oci\.credentialsLeak\.trivy\.enabled {#opt-oci.credentialsLeak.trivy.enabled}



Whether to enable credentials leak detection with Trivy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/credentials-leak\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/credentials-leak.nix)



## oci\.cve {#opt-oci.cve}



Configuration for Common Vulnerabilities and Exposures (CVE) scanning in container images\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.configPath {#opt-oci.cve.configPath}



Path where CVE scanner configuration files will be stored\.



*Type:*
absolute path



*Default:*
` cfg.oci.rootPath `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.grype {#opt-oci.cve.grype}



Configuration for CVE scanning using Grype\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.grype\.enabled {#opt-oci.cve.grype.enabled}



Whether to enable CVE scanning with Grype\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.grype\.config {#opt-oci.cve.grype.config}



Configuration for Grype scanner settings\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.grype\.config\.enabled {#opt-oci.cve.grype.config.enabled}



Whether to enable Grype configuration file generation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.grype\.config\.rootPath {#opt-oci.cve.grype.config.rootPath}



Path where Grype configuration files will be stored\.



*Type:*
absolute path



*Default:*
` config.oci.cve.configPath + "/grype/" `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.trivy {#opt-oci.cve.trivy}



Configuration for CVE scanning using Trivy\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.trivy\.enabled {#opt-oci.cve.trivy.enabled}



Whether to enable CVE scanning with Trivy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.trivy\.ignore {#opt-oci.cve.trivy.ignore}



Configuration for CVE exclusions in Trivy scans\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.trivy\.ignore\.extra {#opt-oci.cve.trivy.ignore.extra}



Additional CVE identifiers to ignore globally in Trivy scans\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.trivy\.ignore\.fileEnabled {#opt-oci.cve.trivy.ignore.fileEnabled}



Whether to enable Trivy CVE ignore file generation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.cve\.trivy\.ignore\.rootPath {#opt-oci.cve.trivy.ignore.rootPath}



Path where Trivy CVE ignore files will be stored\.



*Type:*
absolute path



*Default:*
` cfg.oci.cve.configPath `

*Declared by:*
 - [nix-oci/nix/modules/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/cve.nix)



## oci\.devShellPackage {#opt-oci.devShellPackage}



The package to use for the development shell\.



*Type:*
package

*Declared by:*
 - [nix-oci/nix/modules/default\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/default.nix)



## oci\.fromImageManifestRootPath {#opt-oci.fromImageManifestRootPath}



The root path to store the pulled OCI image manifest JSON lockfiles\.



*Type:*
absolute path



*Default:*
` config.oci.rootPath + "/pulledManifestsLocks/" `

*Declared by:*
 - [nix-oci/nix/modules/default\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/default.nix)



## oci\.lib\.filterEnabledOutputsSet {#opt-oci.lib.filterEnabledOutputsSet}



A function to filter outputs\.



*Type:*
unspecified value



*Default:*
` <function, args: {config, subConfig}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/outputs\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/outputs.nix)



## oci\.lib\.mkAppCVEGrype {#opt-oci.lib.mkAppCVEGrype}



To build grype app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/cve.nix)



## oci\.lib\.mkAppCVETrivy {#opt-oci.lib.mkAppCVETrivy}



To build trivy app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/cve.nix)



## oci\.lib\.mkAppContainerStructureTest {#opt-oci.lib.mkAppContainerStructureTest}



A function to create a check that runs container-structure-test on a built image using podman\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/container-structure-test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/container-structure-test.nix)



## oci\.lib\.mkAppCredentialsLeakTrivy {#opt-oci.lib.mkAppCredentialsLeakTrivy}



To build trivy app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/credentials-leak\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/credentials-leak.nix)



## oci\.lib\.mkAppDgoss {#opt-oci.lib.mkAppDgoss}



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/dgoss\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/dgoss.nix)



## oci\.lib\.mkAppSBOMSyft {#opt-oci.lib.mkAppSBOMSyft}



To build syft app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/sbom.nix)



## oci\.lib\.mkCheckDive {#opt-oci.lib.mkCheckDive}



A function to create a check that runs dive on a built image



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {oci, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/dive\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/dive.nix)



## oci\.lib\.mkDebugOCI {#opt-oci.lib.mkDebugOCI}



A function to build debug container\.



*Type:*
function that evaluates to a(n) package



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkDockerArchive {#opt-oci.lib.mkDockerArchive}



A function to transform nix2container build into docker archive



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {oci, pkgs, skopeo}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkNixConfig {#opt-oci.lib.mkNixConfig}



A function to build nix configuration file for containers



*Type:*
unspecified value



*Default:*
` pkgs: pkgs.writeText "etc/nix/nix.conf" "..." `

*Declared by:*
 - [nix-oci/nix/modules/lib/system\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/system.nix)



## oci\.lib\.mkNixOCI {#opt-oci.lib.mkNixOCI}



A function to build nix container



*Type:*
function that evaluates to a(n) package



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkNixOCILayer {#opt-oci.lib.mkNixOCILayer}



A function to build nix container



*Type:*
package



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkNixOrSimpleOCI {#opt-oci.lib.mkNixOrSimpleOCI}



A function to that build nix or simple container depending config\.



*Type:*
function that evaluates to a(n) package



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkNixShadowSetup {#opt-oci.lib.mkNixShadowSetup}



A function to build passwd, shadow, group, and gshadow files for containers that run nested Nix



*Type:*
unspecified value



*Default:*
` pkgs: [ (writeText "etc/passwd" "...") (writeText "etc/group" "...") ... ] `

*Declared by:*
 - [nix-oci/nix/modules/lib/system\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/system.nix)



## oci\.lib\.mkNonRootShadowSetup {#opt-oci.lib.mkNonRootShadowSetup}



A function to build passwd, shadow, group, and gshadow files for containers run as non-root user



*Type:*
unspecified value



*Default:*
` { user, pkgs, uid ? 4000, gid ? uid }: [ (writeTextDir "etc/passwd" "...") ... ] `

*Declared by:*
 - [nix-oci/nix/modules/lib/system\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/system.nix)



## oci\.lib\.mkOCI {#opt-oci.lib.mkOCI}



A function to build container



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {config, containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIEntrypoint {#opt-oci.lib.mkOCIEntrypoint}



A function to get entrypoint of container



*Type:*
function that evaluates to a(n) list of string



*Default:*
` <function, args: {package}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIName {#opt-oci.lib.mkOCIName}



A function to get name of container



*Type:*
function that evaluates to a(n) string



*Default:*
` <function, args: {fromImage, package}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIPulledManifestLock {#opt-oci.lib.mkOCIPulledManifestLock}



A function to build OCI manifest to pull



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {config, containerId, perSystemConfig}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIPulledManifestLockPath {#opt-oci.lib.mkOCIPulledManifestLockPath}



A function to build OCI manifest to pull



*Type:*
function that evaluates to a(n) absolute path



*Default:*
` <function, args: {config, containerId, perSystemConfig}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIPulledManifestLockRelativePath {#opt-oci.lib.mkOCIPulledManifestLockRelativePath}



Generate local relive path to download OCI



*Type:*
function that evaluates to a(n) string



*Default:*
` <function, args: {config, containerId, perSystemConfig, self}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIPulledManifestLockRelativeRootPath {#opt-oci.lib.mkOCIPulledManifestLockRelativeRootPath}



A function to get relative path lock manifest of to pull OCI



*Type:*
function that evaluates to a(n) string



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIPulledManifestLockUpdateScript {#opt-oci.lib.mkOCIPulledManifestLockUpdateScript}



A function to build script to update pulled OCI manifests locks



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {config, perSystemConfig, pkgs, self}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCITag {#opt-oci.lib.mkOCITag}



A function to get tag of container



*Type:*
function that evaluates to a(n) string



*Default:*
` <function, args: {fromImage, package}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkOCIUser {#opt-oci.lib.mkOCIUser}



A function to get user of container



*Type:*
function that evaluates to a(n) string



*Default:*
` <function, args: {isRoot, name}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkPodmanOCI {#opt-oci.lib.mkPodmanOCI}



Function to build a container image with Podman and a non-root daemon\.



*Type:*
unspecified value



*Default:*
` <function, args: {dependencies?, nix2container, package, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkPodmanOCIRunScript {#opt-oci.lib.mkPodmanOCIRunScript}



Function to build a script into a podman container image



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {dependencies?, nix2container, package, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.mkPodmanPolicy {#opt-oci.lib.mkPodmanPolicy}



A function to build podman security policy configuration



*Type:*
unspecified value



*Default:*
` pkgs: pkgs.writeTextDir "etc/containers/policy.json" "..." `

*Declared by:*
 - [nix-oci/nix/modules/lib/system\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/system.nix)



## oci\.lib\.mkPublishOCIScript {#opt-oci.lib.mkPublishOCIScript}



A function to build publishing script for CI that pushes container images to registry



*Type:*
unspecified value



*Default:*
` { container, pkgs }: pkgs.writeScriptBin "publish-docker-image" "..." `

*Declared by:*
 - [nix-oci/nix/modules/lib/system\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/system.nix)



## oci\.lib\.mkRoot {#opt-oci.lib.mkRoot}



A function to build container root filesystem with package, user setup, and dependencies



*Type:*
function that evaluates to a(n) package



*Default:*

```
{ pkgs, tag, user, package ? null, dependencies ? [ ] }:
pkgs.buildEnv {
  name = "root";
  version = tag;
  paths = (optional (package != null) package) ++ shadowSetup ++ dependencies;
  pathsToLink = [ "/bin" "/lib" "/etc" ];
}

```

*Declared by:*
 - [nix-oci/nix/modules/lib/system\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/system.nix)



## oci\.lib\.mkRootShadowSetup {#opt-oci.lib.mkRootShadowSetup}



A function to build passwd, shadow, group, and gshadow files for containers run as root user



*Type:*
unspecified value



*Default:*
` { pkgs }: [ (writeTextDir "etc/passwd" "...") (writeTextDir "etc/shadow" "...") ... ] `

*Declared by:*
 - [nix-oci/nix/modules/lib/system\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/system.nix)



## oci\.lib\.mkScriptCVEGrype {#opt-oci.lib.mkScriptCVEGrype}



To build grype app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/cve.nix)



## oci\.lib\.mkScriptCVETrivy {#opt-oci.lib.mkScriptCVETrivy}



To build trivy app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function, args: {config, containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/cve\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/cve.nix)



## oci\.lib\.mkScriptContainerStructureTest {#opt-oci.lib.mkScriptContainerStructureTest}



A function to create a check that runs container-structure-test on a built image using podman\.



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/container-structure-test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/container-structure-test.nix)



## oci\.lib\.mkScriptCredentialsLeakTrivy {#opt-oci.lib.mkScriptCredentialsLeakTrivy}



To build trivy app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/credentials-leak\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/credentials-leak.nix)



## oci\.lib\.mkScriptDgoss {#opt-oci.lib.mkScriptDgoss}



A function to create a check that runs dgoss on a built image using podman\.



*Type:*
function that evaluates to a(n) package



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/dgoss\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/dgoss.nix)



## oci\.lib\.mkScriptSBOMSyft {#opt-oci.lib.mkScriptSBOMSyft}



To build syft app to check for CVEs on OCI\.



*Type:*
function that evaluates to a(n) (attribute set)



*Default:*
` <function, args: {containerId, perSystemConfig, pkgs}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/sbom.nix)



## oci\.lib\.mkSimpleOCI {#opt-oci.lib.mkSimpleOCI}



A function to build simple container



*Type:*
function that evaluates to a(n) package



*Default:*
` <function> `

*Declared by:*
 - [nix-oci/nix/modules/lib/oci\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/oci.nix)



## oci\.lib\.prefixOutputs {#opt-oci.lib.prefixOutputs}



A prefix to add to the output file\.



*Type:*
unspecified value



*Default:*
` <function, args: {prefix, set}> `

*Declared by:*
 - [nix-oci/nix/modules/lib/outputs\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/lib/outputs.nix)



## oci\.registry {#opt-oci.registry}



The OCI registry to use for pushing and pulling images\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix-oci/nix/modules/default\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/default.nix)



## oci\.rootPath {#opt-oci.rootPath}



The root path to store the Nix OCI resources\.



*Type:*
absolute path



*Default:*
` self + "/oci/" `

*Declared by:*
 - [nix-oci/nix/modules/default\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/default.nix)



## oci\.sbom {#opt-oci.sbom}



Configuration for Software Bill of Materials (SBOM) generation in container images\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/sbom.nix)



## oci\.sbom\.path {#opt-oci.sbom.path}



Path where SBOM files will be stored\.



*Type:*
absolute path



*Default:*
` cfg.oci.rootPath `

*Declared by:*
 - [nix-oci/nix/modules/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/sbom.nix)



## oci\.sbom\.syft {#opt-oci.sbom.syft}



Configuration for SBOM generation using Syft\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/sbom.nix)



## oci\.sbom\.syft\.enabled {#opt-oci.sbom.syft.enabled}



Whether to enable SBOM generation with Syft\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/sbom.nix)



## oci\.sbom\.syft\.config {#opt-oci.sbom.syft.config}



Configuration settings for Syft SBOM generation\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/sbom.nix)



## oci\.sbom\.syft\.config\.enabled {#opt-oci.sbom.syft.config.enabled}



Whether to enable Syft configuration file generation\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/sbom.nix)



## oci\.sbom\.syft\.config\.rootPath {#opt-oci.sbom.syft.config.rootPath}



Path where Syft configuration files will be stored\.



*Type:*
absolute path



*Default:*
` cfg.oci.sbom.path `

*Declared by:*
 - [nix-oci/nix/modules/sbom\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/sbom.nix)



## oci\.test {#opt-oci.test}



Global configuration for container testing tools\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/test.nix)



## oci\.test\.containerStructureTest {#opt-oci.test.containerStructureTest}



Configuration for container-structure-test validation tool\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/test.nix)



## oci\.test\.containerStructureTest\.enabled {#opt-oci.test.containerStructureTest.enabled}



Whether to enable container-structure-test globally for all containers\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/test.nix)



## oci\.test\.dgoss {#opt-oci.test.dgoss}



Configuration for dgoss (Docker + goss) testing framework\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/test.nix)



## oci\.test\.dgoss\.enabled {#opt-oci.test.dgoss.enabled}



Whether to enable dgoss testing globally for all containers\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/test.nix)



## oci\.test\.dive {#opt-oci.test.dive}



Configuration for Dive container image analysis tool\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/test.nix)



## oci\.test\.dive\.enabled {#opt-oci.test.dive.enabled}



Whether to enable Dive analysis globally for all containers\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/test\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/test.nix)



## perSystem\.oci\.packages {#opt-perSystem.oci.packages}



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.containerStructureTest {#opt-perSystem.oci.packages.containerStructureTest}



The package to use for container-structure-test\.



*Type:*
package



*Default:*
` pkgs.container-structure-test `



*Example:*
` pkgs.container-structure-test `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.dgoss {#opt-perSystem.oci.packages.dgoss}



The package to use for dgoss\.



*Type:*
package



*Default:*
` pkgs.dgoss `



*Example:*
` pkgs.dgoss `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.dive {#opt-perSystem.oci.packages.dive}



The package to use for dive\.



*Type:*
package



*Default:*
` pkgs.dive `



*Example:*
` pkgs.dive `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.grype {#opt-perSystem.oci.packages.grype}



The package to use for grype\.



*Type:*
package



*Default:*
` pkgs.grype `



*Example:*
` pkgs.grype `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.nix2container {#opt-perSystem.oci.packages.nix2container}



The nix2container package\.



*Type:*
attribute set



*Default:*
` inputs.nix2container.packages.${system}.nix2container `



*Example:*
` inputs.nix2container.packages.${system}.nix2container `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.podman {#opt-perSystem.oci.packages.podman}



The package to use for podman\.



*Type:*
package



*Default:*
` pkgs.podman `



*Example:*
` pkgs.podman `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.skaffold {#opt-perSystem.oci.packages.skaffold}



The package to use for skaffold\.



*Type:*
package



*Default:*
` pkgs.skaffold `



*Example:*
` pkgs.skaffold `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.skopeo {#opt-perSystem.oci.packages.skopeo}



The package to use for skopeo\.



*Type:*
package



*Default:*
` inputs.nix2container.packages.${system}.skopeo-nix2container `



*Example:*
` inputs.nix2container.packages.${system}.skopeo-nix2container `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.syft {#opt-perSystem.oci.packages.syft}



The package to use for syft\.



*Type:*
package



*Default:*
` pkgs.syft `



*Example:*
` pkgs.syft `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.packages\.trivy {#opt-perSystem.oci.packages.trivy}



The package to use for trivy\.



*Type:*
package



*Default:*
` pkgs.trivy `



*Example:*
` pkgs.trivy `

*Declared by:*
 - [nix-oci/nix/modules/per-system/packages\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/packages.nix)



## perSystem\.oci\.containers {#opt-perSystem.oci.containers}



Definitions for all containers managed by this flake\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
            my-app = {
              package = pkgs.hello;
              dependencies = [ pkgs.bash ];
              fromImage = {
                imageName = "library/alpine";
                imageTag = "3.21.2";
              };
              isRoot = false;
            };
          }
```

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.package {#opt-perSystem.oci.containers._name_.package}



The main package for the container



*Type:*
null or package



*Default:*
` null `



*Example:*
` pkgs.hello `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.credentialsLeak {#opt-perSystem.oci.containers._name_.credentialsLeak}



\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.credentialsLeak\.trivy {#opt-perSystem.oci.containers._name_.credentialsLeak.trivy}



The package to use for the cve check\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.credentialsLeak\.trivy\.enabled {#opt-perSystem.oci.containers._name_.credentialsLeak.trivy.enabled}



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve {#opt-perSystem.oci.containers._name_.cve}



Whether to check for CVEs\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.grype {#opt-perSystem.oci.containers._name_.cve.grype}



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.grype\.enabled {#opt-perSystem.oci.containers._name_.cve.grype.enabled}



Whether to run grype\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.grype\.config {#opt-perSystem.oci.containers._name_.cve.grype.config}



The path to the grype config\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.grype\.config\.enabled {#opt-perSystem.oci.containers._name_.cve.grype.config.enabled}



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.grype\.config\.path {#opt-perSystem.oci.containers._name_.cve.grype.config.path}



*Type:*
absolute path



*Default:*
` config.oci.rootPath + name + "/cve/grype.yaml" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.rootPath {#opt-perSystem.oci.containers._name_.cve.rootPath}



*Type:*
absolute path



*Default:*
` config.oci.rootPath + name + "/cve/" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.trivy {#opt-perSystem.oci.containers._name_.cve.trivy}



The package to use for the cve check\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.trivy\.enabled {#opt-perSystem.oci.containers._name_.cve.trivy.enabled}



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.trivy\.ignore {#opt-perSystem.oci.containers._name_.cve.trivy.ignore}



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.trivy\.ignore\.extra {#opt-perSystem.oci.containers._name_.cve.trivy.ignore.extra}



Extra CVE to ignore\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.trivy\.ignore\.fileEnabled {#opt-perSystem.oci.containers._name_.cve.trivy.ignore.fileEnabled}



Whether to enable \.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.cve\.trivy\.ignore\.path {#opt-perSystem.oci.containers._name_.cve.trivy.ignore.path}



*Type:*
null or absolute path



*Default:*
` config.oci.rootPath + name + "/cve/trivy.ignore" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.debug {#opt-perSystem.oci.containers._name_.debug}



Configuration for debug builds with additional debugging tools and packages\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.debug\.enabled {#opt-perSystem.oci.containers._name_.debug.enabled}



Whether to enable debug build with additional debugging tools\.



*Type:*
boolean



*Default:*
` perSystemConfig.oci.debug.enabled `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.debug\.packages {#opt-perSystem.oci.containers._name_.debug.packages}



List of additional packages to include in debug builds\.



*Type:*
list of package



*Default:*
` perSystemConfig.oci.debug.packages `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.debug\.entrypoint {#opt-perSystem.oci.containers._name_.debug.entrypoint}



Debug entrypoint wrapper configuration\.



*Type:*
submodule

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.debug\.entrypoint\.enabled {#opt-perSystem.oci.containers._name_.debug.entrypoint.enabled}



Whether to enable debug entrypoint wrapper\.



*Type:*
boolean



*Default:*
` perSystemConfig.oci.debug.entrypoint.enabled `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.debug\.entrypoint\.wrapper {#opt-perSystem.oci.containers._name_.debug.entrypoint.wrapper}



Package containing the debug entrypoint wrapper\.



*Type:*
package



*Default:*
` perSystemConfig.oci.debug.entrypoint.wrapper `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.dependencies {#opt-perSystem.oci.containers._name_.dependencies}

Additional dependencies packages to include in the container\.



*Type:*
list of package



*Default:*
` [ ] `



*Example:*
` [ pkgs.bash pkgs.coreutils ] `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.entrypoint {#opt-perSystem.oci.containers._name_.entrypoint}



The entrypoint command and arguments for the container\. Will be automatically generated from the package if not specified\.



*Type:*
list of string



*Default:*
` cfg.oci.lib.mkOCIEntrypoint { inherit package; } `



*Example:*

```
[
  "/bin/sh"
  "-c"
  "echo hello"
]
```

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.fromImage {#opt-perSystem.oci.containers._name_.fromImage}



The base image to use as the foundation for this container\. If null, will create a minimal scratch-based container\.



*Type:*
null or (submodule)



*Default:*
` null `



*Example:*

```
{
  arch = "amd64";
  imageName = "library/alpine";
  imageTag = "1.2.3";
  os = "linux";
}
```

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.fromImage\.arch {#opt-perSystem.oci.containers._name_.fromImage.arch}



The architecture of the image\.



*Type:*
one of “amd64”, “arm64”



*Default:*

```
if system == "x86_64-linux" then
  "amd64"
else if system == "aarch64-linux" then
  "arm64"
else
  throw "Unsupported system: ${system} as default arch, please set the arch option."

```



*Example:*
` "amd64" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.fromImage\.imageName {#opt-perSystem.oci.containers._name_.fromImage.imageName}



The name of the base image\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "library/alpine" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.fromImage\.imageTag {#opt-perSystem.oci.containers._name_.fromImage.imageTag}



The tag/version of the image\.



*Type:*
string



*Example:*
` "3.21.2" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.fromImage\.os {#opt-perSystem.oci.containers._name_.fromImage.os}



The operating system for the image\.



*Type:*
value “linux” (singular enum)



*Default:*
` "linux" `



*Example:*
` "linux" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.installNix {#opt-perSystem.oci.containers._name_.installNix}



Whether to install nix in the container\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.isRoot {#opt-perSystem.oci.containers._name_.isRoot}



Whether the container is a root container\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.name {#opt-perSystem.oci.containers._name_.name}



Name of the container\. If null, the name will be automatically generated from the package or base image\.



*Type:*
null or string



*Default:*
` cfg.oci.lib.mkOCIName { inherit package fromImage; } `



*Example:*
` "my-app" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.push {#opt-perSystem.oci.containers._name_.push}



Whether to push the container to the OCI registry\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.registry {#opt-perSystem.oci.containers._name_.registry}



Container registry prefix (e\.g\., “ghcr\.io/my-org” or “my-registry\.io/project”)\.
If set, the full container name will be “registry/name”\.
If null or empty string, no registry prefix will be added\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "ghcr.io/my-org" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.rootPath {#opt-perSystem.oci.containers._name_.rootPath}



The root path for the container\.



*Type:*
absolute path



*Default:*
` config.oci.rootPath + name + "/" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.sbom {#opt-perSystem.oci.containers._name_.sbom}



\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.sbom\.rootPath {#opt-perSystem.oci.containers._name_.sbom.rootPath}



The root path for the sbom\.



*Type:*
absolute path



*Default:*
` config.oci.rootPath + name + "/sbom/" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.sbom\.syft {#opt-perSystem.oci.containers._name_.sbom.syft}



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.sbom\.syft\.enabled {#opt-perSystem.oci.containers._name_.sbom.syft.enabled}



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.sbom\.syft\.config {#opt-perSystem.oci.containers._name_.sbom.syft.config}



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.sbom\.syft\.config\.enabled {#opt-perSystem.oci.containers._name_.sbom.syft.config.enabled}



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.sbom\.syft\.config\.path {#opt-perSystem.oci.containers._name_.sbom.syft.config.path}



*Type:*
absolute path



*Default:*
` config.oci.rootPath + name + "/sbom/syft.yaml" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.tag {#opt-perSystem.oci.containers._name_.tag}



Tag of the container\.



*Type:*
null or string



*Default:*
` config.oci.lib.mkOCITag { inherit package fromImage; } `



*Example:*
` "1.0.0" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test {#opt-perSystem.oci.containers._name_.test}



\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.containerStructureTest {#opt-perSystem.oci.containers._name_.test.containerStructureTest}



Configuration for container-structure-test to validate container structure and metadata\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.containerStructureTest\.enabled {#opt-perSystem.oci.containers._name_.test.containerStructureTest.enabled}



Whether to enable container-structure-test for validating container structure and metadata\.



*Type:*
boolean



*Default:*
` cfg.oci.test.containerStructureTest.enabled `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.containerStructureTest\.configs {#opt-perSystem.oci.containers._name_.test.containerStructureTest.configs}



List of container-structure-test configuration files to run\.



*Type:*
list of absolute path



*Default:*
` [ (cfg.oci.rootPath + name + "/test/container-structure-test.yaml") ] `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.dgoss {#opt-perSystem.oci.containers._name_.test.dgoss}



Configuration for dgoss (Docker + goss) testing framework\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.dgoss\.enabled {#opt-perSystem.oci.containers._name_.test.dgoss.enabled}



Whether to enable dgoss testing for the container\.



*Type:*
boolean



*Default:*
` cfg.oci.test.dgoss.enabled `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.dgoss\.optionsPath {#opt-perSystem.oci.containers._name_.test.dgoss.optionsPath}



Path to the dgoss configuration file\.



*Type:*
absolute path



*Default:*
` config.oci.rootPath + name + "/test/dgoss.yaml" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.dive {#opt-perSystem.oci.containers._name_.test.dive}



Configuration for Dive analysis of container image layers and efficiency\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.dive\.enabled {#opt-perSystem.oci.containers._name_.test.dive.enabled}



Whether to enable Dive analysis for container image layers and efficiency\.



*Type:*
boolean



*Default:*
` cfg.oci.test.dive.enabled `



*Example:*
` true `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.test\.rootPath {#opt-perSystem.oci.containers._name_.test.rootPath}



The root path for the test\.



*Type:*
absolute path



*Default:*
` config.oci.rootPath + name + "/test/" `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.containers\.\<name>\.user {#opt-perSystem.oci.containers._name_.user}



The user to run the container as\. If null, will be automatically determined based on isRoot setting\.



*Type:*
null or string



*Default:*
` cfg.oci.lib.mkOCIUser { inherit name isRoot; } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/containers\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/containers.nix)



## perSystem\.oci\.debug {#opt-perSystem.oci.debug}



Add debug build in output\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix-oci/nix/modules/per-system/debug\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/debug.nix)



## perSystem\.oci\.debug\.enabled {#opt-perSystem.oci.debug.enabled}



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/debug\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/debug.nix)



## perSystem\.oci\.debug\.packages {#opt-perSystem.oci.debug.packages}



*Type:*
list of package



*Default:*

```
with pkgs; [
  coreutils
  bash
  curl
]

```

*Declared by:*
 - [nix-oci/nix/modules/per-system/debug\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/debug.nix)



## perSystem\.oci\.debug\.entrypoint {#opt-perSystem.oci.debug.entrypoint}



Debug entrypoint wrapper configuration\.



*Type:*
submodule

*Declared by:*
 - [nix-oci/nix/modules/per-system/debug\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/debug.nix)



## perSystem\.oci\.debug\.entrypoint\.enabled {#opt-perSystem.oci.debug.entrypoint.enabled}



Whether to enable debug entrypoint wrapper\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix-oci/nix/modules/per-system/debug\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/debug.nix)



## perSystem\.oci\.debug\.entrypoint\.wrapper {#opt-perSystem.oci.debug.entrypoint.wrapper}



Default behavior run sleep infinity fallback if entrypoint fail\.



*Type:*
package



*Default:*
` pkgs.writeScriptBin "entrypoint" ./debug-entrypoint.sh `

*Declared by:*
 - [nix-oci/nix/modules/per-system/debug\.nix](https://github.com/dauliac/nix-oci/blob/master/nix/modules/per-system/debug.nix)

