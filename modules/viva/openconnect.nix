{ inputs, ... }:
{
  imports = [
    (
      { pkgs, ... }@args:
      # Upstream still reads the deprecated stdenv platform aliases. Keep this
      # compatibility adapter scoped to its module until it uses hostPlatform.
      inputs.globalprotect-openconnect.nixosModules.default (
        args
        // {
          pkgs = pkgs // {
            stdenv = pkgs.stdenv // {
              inherit (pkgs.stdenv.hostPlatform) isLinux isDarwin;
            };
          };
        }
      )
    )
  ];

  programs.globalprotect-openconnect.enable = true;
}
