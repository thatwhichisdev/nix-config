{
  pkgs,
  ...
}:
{

  environment.shells = [
    pkgs.nushell
  ];

  home-manager.sharedModules = [
    {
      programs.nushell = {
        enable = true;
        loadSessionVariables = false;

        environmentVariables = {
          EDITOR = "hx";
          VISUAL = "hx";
          BROWSER = "zen";
        };

        configFile.text = ''
          $env.config.show_banner = false
          $env.config.buffer_editor = 'hx'
          $env.config.table.mode = 'none'

          alias ll = ls -la
          alias fg = job unfreeze
        '';

        envFile.text = ''
          use std/util "path add"
          path add '~/.npm-global/bin'
        '';
      };
    }
  ];
}
