{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      make-shells.default = {
        packages = [
          pkgs.nodejs_24
          pkgs.pnpm_10
        ];

        shellHook = ''
          export PATH=$PATH:node_modules/.bin/
        '';
      };
    };
}
