_: {
  home-manager.sharedModules = [
    (
      { config, ... }:
      let
        homeDir = config.home.homeDirectory;
      in
      {
        programs.codex = {
          enable = true;
          mutableSettings = true;

          settings = {
            model = "gpt-6-astra";
            model_reasoning_effort = "medium";
            approvals_reviewer = "auto_review";

            projects = {
              "${homeDir}/development" = {
                trust_level = "trusted";
              };

              "${homeDir}/.config/nix-config" = {
                trust_level = "trusted";
              };
            };

            mcp_servers = {
              github = {
                url = "https://api.githubcopilot.com/mcp/";
              };

              fff = {
                command = "/run/current-system/sw/bin/fff-mcp";
              };
            };

            tui = {
              screen_reader_detection_done = true;
              theme = "ansi";
            };

            notice.hide_rate_limit_model_nudge = true;

            features = {
              memories = true;
              memory_tool = true;
            };
          };

          profiles = {
            meetme = {
              mcp_servers = {
                atlassian = {
                  url = "https://mcp.atlassian.com/v2/mcp";
                };
                dash0 = {
                  url = "https://api.eu-west-1.aws.dash0.com/mcp";
                };
              };
            };

            dev = {
              mcp_servers = {
                konnect = {
                  command = "/run/current-system/sw/bin/konnect";

                  args = [
                    "--config"
                    "${homeDir}/.config/konnect/konnect.toml"
                    "--client"
                    "codex"
                  ];

                  default_tools_approval_mode = "approve";
                };
              };
            };
          };
        };
      }
    )
  ];
}
