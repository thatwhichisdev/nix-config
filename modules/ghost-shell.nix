{ inputs, ... }:
let
  hex = value: (builtins.fromTOML "value = ${value}").value;
in
{
  home-manager.sharedModules = [
    inputs.ghost-shell.homeManagerModules.default

    {
      programs.ghost-shell = {
        enable = true;

        settings = {
          general = {
            font_family = "Berkeley Mono";
            font_size = 13;
          };

          bar = {
            "eDP-1" = {
              output = "eDP-1";
              height = 27.0;
              exclusive_zone = 27.0;
              blur = true;
            };

            "DP-1" = {
              output = "DP-1";
              height = 27.0;
              exclusive_zone = 27.0;
              primary = true;
              blur = true;
            };
          };

          launcher = {
            blur = true;
            background_opacity = 0.8;
          };

          finder = {
            blur = true;
            background_opacity = 0.8;
          };

          clock = {
            format = "%a %b %-d %H:%M";
          };

          wallpaper = {
            path = "${inputs.nix-assets.assets.wallpapers.motion.waneella-clouds}";
          };

          theme = {
            mode = "dark";

            dark = {
              base00 = hex "0x0a0c10";
              base01 = hex "0x212830";
              base02 = hex "0x7a828e";
              base03 = hex "0x9ea7b3";
              base04 = hex "0xbdc4cc";
              base05 = hex "0xf0f3f6";
              base06 = hex "0xffffff";
              base07 = hex "0xffffff";
              base08 = hex "0xffb757";
              base09 = hex "0x91cbff";
              base0A = hex "0xe09b13";
              base0B = hex "0xaddcff";
              base0C = hex "0x72f088";
              base0D = hex "0xdbb7ff";
              base0E = hex "0xff9492";
              base0F = hex "0xffb1af";
            };

            light = {
              base00 = hex "0xffffff";
              base01 = hex "0xe7ecf0";
              base02 = hex "0xacb6c0";
              base03 = hex "0x88929d";
              base04 = hex "0x66707b";
              base05 = hex "0x343b43";
              base06 = hex "0x20252c";
              base07 = hex "0x0e1116";
              base08 = hex "0x702c00";
              base09 = hex "0x023b95";
              base0A = hex "0x956400";
              base0B = hex "0x032563";
              base0C = hex "0x024c1a";
              base0D = hex "0x622cbc";
              base0E = hex "0xa0111f";
              base0F = hex "0x6e011a";
            };
          };
        };

        systemd.enable = true;
      };
    }
  ];
}
