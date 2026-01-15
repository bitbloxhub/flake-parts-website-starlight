{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    make-shell = {
      url = "github:nicknovitski/make-shell";
      inputs.flake-compat.follows = "";
    };
  };

  imports = [
    inputs.make-shell.flakeModules.default
  ];

  perSystem =
    {
      pkgs,
      inputs',
      ...
    }:
    {
      make-shells.default = {
        name = "flake-parts-website-starlight";

        packages = [
          pkgs.nixfmt
          pkgs.deadnix
          pkgs.statix
          inputs'.flint.packages.default
          pkgs.just
          pkgs.tilt
          pkgs.nushell
        ];

        shellHook = ''
          export TILT_PORT=48306
        '';
      };
      
      packages.flake-parts-readme = pkgs.stdenv.mkDerivation {
        name = "flake-parts-readme";
        installPhase = ''
          cp ${inputs.flake-parts + "/README.md"} $out
        '';
        dontUnpack = true;
      };

      packages.flake-parts-website-src = pkgs.stdenv.mkDerivation {
        name = "flake-parts-readme";
        installPhase = ''
          mkdir -p $out
          cp -r ${inputs.flake-parts-website + "/site/src/*"} $out
        '';
        dontUnpack = true;
      };
    };
}
