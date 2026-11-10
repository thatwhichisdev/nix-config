{
  inputs,
  pkgs,
  ...
}:

let
  system = pkgs.stdenv.hostPlatform.system;

  # Konnect 0.12.1 expects bundled libraries, including AWS-LC.
  # Keep that behavior until its package supports the new system-library hook.
  konnect = inputs.konnect.packages.${system}.konnect.overrideAttrs {
    dontCargoUseSystemLibs = true;
  };

  konnectPlugin = pkgs.runCommand "konnect-kicad-plugin" { } ''
    mkdir -p "$out"

    cp -r ${inputs.konnect.outPath}/plugin/. "$out/"

    mkdir -p "$out/bin"
    ln -s ${konnect}/bin/konnect "$out/bin/konnect"
  '';

  pluginDir = ".local/share/kicad/10.0/scripting/plugins/" + "com_github_mixelpixx_konnect";
in
{
  environment.systemPackages = [
    pkgs.kicad
    konnect
  ];

  home-manager.users.thatwhichisapple = {
    xdg.configFile."konnect/konnect.toml".text = ''
      transport = "stdio"
      eager_toolsets = true
      kicad_cli = "${pkgs.kicad}/bin/kicad-cli"
      kicad_binary = "${pkgs.kicad}/bin/kicad"
      ipc_address = "ipc:///tmp/kicad/api.sock"
    '';

    home.file."${pluginDir}" = {
      source = konnectPlugin;
      recursive = true;
    };
  };
}
