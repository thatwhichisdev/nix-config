{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware.nix
    ../../modules/btop.nix
    ../../modules/docker.nix
    ../../modules/fastfetch.nix
    ../../modules/fonts.nix
    ../../modules/ghost-shell.nix
    ../../modules/ghostty.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/home-manager.nix
    ../../modules/java.nix
    ../../modules/kanshi.nix
    ../../modules/kicad.nix
    ../../modules/localisation.nix
    ../../modules/networking.nix
    ../../modules/niri.nix
    ../../modules/nix.nix
    ../../modules/nixpkgs.nix
    ../../modules/nushell.nix
    ../../modules/pipewire.nix
    ../../modules/probe-rs-tools.nix
    ../../modules/rust.nix
    ../../modules/security.nix
    ../../modules/ssh-agent.nix
    ../../modules/starship.nix
    ../../modules/stylix.nix
    ../../modules/swap.nix
    ../../modules/time.nix
    ../../modules/tuigreet.nix
    ../../modules/viva/asahi.nix
    ../../modules/viva/nh.nix
    ../../modules/viva/openconnect.nix
    ../../modules/viva/packages.nix
    ../../modules/xdg.nix
    ../../modules/xserver.nix
    ../../modules/yazi.nix
    ../../modules/zed.nix
    ../../modules/zen.nix
  ];

  networking.hostName = "thatwhichisapple";

  users.users.thatwhichisapple = {
    isNormalUser = true;
    name = "thatwhichisapple";
    home = "/home/thatwhichisapple";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "input"
      "dialout"
      "tty"
      "render"
      "docker"
      "kvm"
    ];
    shell = pkgs.nushell;
  };

  home-manager.users.thatwhichisapple = {
    home = {
      homeDirectory = "/home/thatwhichisapple";
      stateVersion = "26.05";
    };
  };

  system.stateVersion = "26.05";
}
