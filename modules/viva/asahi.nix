{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  linux-asahi-fairydust-pkg =
    {
      stdenv,
      lib,
      fetchFromGitHub,
      buildLinux,
      ...
    }:
    buildLinux rec {
      inherit stdenv lib;

      pname = "linux-asahi-fairydust";
      version = "7.1.13";
      extraMeta.branch = "7.1";

      src = fetchFromGitHub {
        owner = "AsahiLinux";
        repo = "linux";
        rev = "ce9f2eba72c061a50b2d790450e90af3439d8c24";
        hash = "sha256-W3yMSUe6xa+M/X0k86kbCS4g3d7jJmO3WV9L/5rQRhI=";
      };

      kernelPatches = [
        {
          name = "Asahi config";
          patch = null;
          structuredExtraConfig = with lib.kernel; {
            ARM64_16K_PAGES = yes;
            ARM64_MEMORY_MODEL_CONTROL = yes;
            ARM64_ACTLR_STATE = yes;

            APPLE_WATCHDOG = yes;
            APPLE_M1_CPU_PMU = yes;
            APPLE_MAILBOX = yes;
            APPLE_RTKIT = yes;
            APPLE_RTKIT_HELPER = yes;
            APPLE_PMGR_MISC = yes;
            APPLE_PMGR_PWRSTATE = yes;

            RUST_APPLE_RTKIT = yes;
            RUST_FW_LOADER_ABSTRACTIONS = yes;

            HID_APPLE = module;
          };
          features.rust = true;
        }
      ]
      ++ config.boot.kernelPatches;
    };

  fairydustKernel = pkgs.callPackage linux-asahi-fairydust-pkg { };
in
{
  imports = [
    inputs.apple-silicon.nixosModules.apple-silicon-support
  ];

  nixpkgs.overlays = [
    (_final: prev: {
      uboot-asahi = prev.uboot-asahi.overrideAttrs (old: {
        # Nixpkgs adapts these flags for its newer DTC, but Asahi U-Boot
        # uses its bundled DTC, which still needs the original check name.
        postPatch = (old.postPatch or "") + ''
          for f in scripts/Makefile.lib dts/upstream/Makefile; do
            substituteInPlace "$f" \
              --replace-fail -Eno-node_name_not_empty -Wno-graph_child_address
          done
        '';
      });
    })
  ];

  boot.kernelPackages = lib.mkForce (pkgs.linuxPackagesFor fairydustKernel);
}
