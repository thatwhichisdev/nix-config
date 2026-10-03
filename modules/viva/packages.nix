{ pkgs, inputs, ... }:
let
  fastpotify =
    inputs.fastpotify.packages.${pkgs.stdenv.hostPlatform.system}.fastpotify.overrideAttrs
      (old: {
        cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
          inherit (old) pname version src;
          hash = "sha256-e/uJwqYszz7ASo5elWcTIX6Smb0xJgQZA5fgHuwvzaE=";
        };
      });
in
{
  environment.systemPackages = with pkgs; [
    ffmpeg
    gimp3
    imagemagick
    impala
    mpv
    nautilus
    nixd
    nodejs
    deno
    obsidian
    p7zip
    pavucontrol
    pciutils
    ripgrep
    steel
    systemctl-tui
    systemfd
    teams-for-linux
    telegram-desktop
    tree
    usbutils
    uutils-coreutils-noprefix
    wl-color-picker
    legcord
    python3
    gnumake
    gcc
    docker-compose
    libusb1
    ragenix
    postman
    fastpotify
    codex
    element-desktop
  ];
}
