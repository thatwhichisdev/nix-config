{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.rededitor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
