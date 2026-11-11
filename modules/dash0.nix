{ inputs, ... }:
{
  home-manager.sharedModules = [
    inputs.dash0-cli.homeManagerModules.default
    {
      programs.dash0 = {
        enable = true;
        activeProfile = "default";

        profiles.default = {
          apiUrl = "https://api.eu-west-1.aws.dash0.com";
          otlpUrl = "https://ingress.eu-west-1.aws.dash0.com";
          dataset = "vsd-preproduction";
          # Authenticate once with `dash0 login`; rebuilds preserve OAuth tokens.
          auth = "oauth";
        };
      };
    }
  ];
}
