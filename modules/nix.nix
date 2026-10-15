{ config, ... }:
{
  nix.settings = {
    warn-dirty = false;

    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [
      "thatwhichisapple"
      "root"
      "@build"
      "@wheel"
      "@admin"
    ];
  };

  nix.gc = {
    automatic = !config.programs.nh.clean.enable;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
