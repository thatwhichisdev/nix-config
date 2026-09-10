{ inputs, ... }:
{
  imports = [
    inputs.globalprotect-openconnect.nixosModules.default
  ];

  programs.globalprotect-openconnect.enable = true;
}
