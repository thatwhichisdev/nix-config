{
  inputs,
  ...
}:
{
  imports = [
    inputs.steam-asahi.nixosModules.default
  ];

  # Steam's ARM64 steamui.so and vgui2_s.so still link libgtk-x11-2.0.so.0.
  # Remove this exception when Valve migrates the client away from GTK2.
  nixpkgs.config.problems.handlers."gtk+".broken = "warn";

  programs.steam-asahi = {
    enable = true;
    users = [ "thatwhichisapple" ];
  };
}
