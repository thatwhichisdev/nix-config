{
  pkgs,
  ...
}:
let
  inherit (pkgs) tuigreet;
in
{
  environment.systemPackages = [
    tuigreet
  ];

  services.greetd = {
    enable = true;

    settings = {
      terminal = {
        vt = 1;
      };

      default_session = {
        user = "greeter";
        command = "${tuigreet}/bin/tuigreet --cmd niri-session";
      };
    };
  };

}
