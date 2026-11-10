{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/bootvine.nix
    ../../modules/awww.nix
    ../../modules/btop.nix
    ../../modules/docker.nix
    ../../modules/fonts.nix
    ../../modules/ghostty.nix
    ../../modules/git.nix
    ../../modules/helix.nix
    ../../modules/home-manager.nix
    ../../modules/java.nix
    ../../modules/localisation.nix
    ../../modules/nano/nh.nix
    ../../modules/nano/packages.nix
    ../../modules/networking.nix
    ../../modules/niri.nix
    ../../modules/nix.nix
    ../../modules/nixpkgs.nix
    ../../modules/nushell.nix
    ../../modules/pipewire.nix
    ../../modules/rededitor.nix
    ../../modules/rust.nix
    ../../modules/security.nix
    ../../modules/starship.nix
    ../../modules/stylix.nix
    ../../modules/time.nix
    ../../modules/tuigreet.nix
    ../../modules/xserver.nix
    ../../modules/yazi.nix
    ../../modules/zen.nix
  ];

  networking.hostName = "nixos";

  users.users.nanobreaker = {
    isNormalUser = true;
    name = "nanobreaker";
    home = "/home/nanobreaker";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "input"
      "dialout"
      "docker"
      "tty"
      "render"
    ];
    shell = pkgs.nushell;
  };

  home-manager.users.nanobreaker.home = {
    homeDirectory = "/home/nanobreaker";
    stateVersion = "26.05";
  };

  system.stateVersion = "26.05";
}
