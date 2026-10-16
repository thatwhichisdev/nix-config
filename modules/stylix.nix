{
  pkgs,
  inputs,
  ...
}:
let
  darkScheme = {
    base00 = "#0a0c10"; # mOnPrimary, mOnSecondary, mOnError, mSurface, mOnHover, mOnTeratiry
    base01 = "#23252a"; # mSurfaceVariant
    base02 = "#2672f3"; # not used
    base03 = "#5c6166"; # mOutline
    base04 = "#f0f6fc"; # mOnSurfaceVariant
    base05 = "#f0f6fc"; # mOnSurface
    base06 = "#f0f6fc"; # not used
    base07 = "#f0f6fc"; # not used
    base08 = "#ff9492"; # mError
    base09 = "#ffb757"; # not used
    base0A = "#ffb757"; # not used
    base0B = "#addcff"; # not used
    base0C = "#ffb757"; # mTertiary, mHover
    base0D = "#f0f6fc"; # mPrimary
    base0E = "#ffb757"; # mSecondary
    base0F = "#3D2F00"; # not used
  };
in
{
  programs.dconf.enable = true;

  home-manager.sharedModules = [
    ({ ... }: {
      imports = [ inputs.stylix.homeModules.stylix ];

      home.pointerCursor.enable = true;

      stylix = {
        enable = true;
        autoEnable = true;
        overlays.enable = false;

        polarity = "dark";

        base16Scheme = darkScheme;

        cursor = {
          name = "apple-cursor";
          package = pkgs.apple-cursor;
          size = 7;
        };

        fonts = {
          serif.name = "Berkeley Mono";
          sansSerif.name = "Berkeley Mono";
          monospace.name = "Berkeley Mono";

          sizes = {
            terminal = 18;
          };

          emoji = {
            name = "Symbols Nerd Font";
            package = pkgs.nerd-fonts.symbols-only;
          };
        };
      };
    })
  ];

}
