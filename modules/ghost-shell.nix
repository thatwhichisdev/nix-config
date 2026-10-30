{ inputs, ... }:
{
  home-manager.sharedModules = [
    inputs.ghost-shell.homeManagerModules.default

    {
      programs.ghost-shell = {
        enable = true;

        settings = {
          general = {
            theme = "Papirus-Dark";
            font_family = "Berkeley Mono";
            font_size = 13;
          };

          bar = {
            "eDP-1" = {
              output = "eDP-1";
              height = 32.0;
              exclusive_zone = 32.0;
              appearance = "transparent";
            };

            "DP-1" = {
              primary = true;
              output = "DP-1";
              height = 32.0;
              exclusive_zone = 32.0;
              appearance = "transparent";
            };
          };

          launcher = {
            blur = false;
            background_opacity = 1.0;
          };

          finder = {
            blur = false;
            background_opacity = 1.0;
          };

          clock = {
            format = "%a %b %-d %H:%M";
          };

          wallpaper = {
            path = "${inputs.nix-assets.assets.wallpapers.motion.waneella-fiery}";
          };

          theme = {
            mode = "dark";

            dark = {
              base00 = "#0a0c10";
              base01 = "#212830";
              base02 = "#7a828e";
              base03 = "#9ea7b3";
              base04 = "#bdc4cc";
              base05 = "#f0f3f6";
              base06 = "#ffffff";
              base07 = "#ffffff";
              base08 = "#ffb757";
              base09 = "#91cbff";
              base0A = "#e09b13";
              base0B = "#addcff";
              base0C = "#72f088";
              base0D = "#dbb7ff";
              base0E = "#ff9492";
              base0F = "#ffb1af";
            };

            light = {
              base00 = "#ffffff";
              base01 = "#e7ecf0";
              base02 = "#acb6c0";
              base03 = "#88929d";
              base04 = "#66707b";
              base05 = "#343b43";
              base06 = "#20252c";
              base07 = "#0e1116";
              base08 = "#702c00";
              base09 = "#023b95";
              base0A = "#956400";
              base0B = "#032563";
              base0C = "#024c1a";
              base0D = "#622cbc";
              base0E = "#a0111f";
              base0F = "#6e011a";
            };
          };
        };

        systemd.enable = true;
      };
    }
  ];
}
