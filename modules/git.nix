{
  pkgs,
  ...
}:
{
  environment.systemPackages = [ pkgs.gitui ];

  home-manager.sharedModules = [
    {
      home.sessionVariables = {
        GOPRIVATE = "github.com/lovoo/*";
      };

      programs.git = {
        enable = true;
        settings = {
          user.name = "thatwhichisdev";
          user.email = "eager@thatwhichis.dev";

          core.editor = "hx";
          init.defaultBranch = "master";

          url."git@github.com:" = {
            insteadOf = "https://github.com/";
          };
        };
      };
    }
  ];
}
