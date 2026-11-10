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
      version = "7.2.15";
      extraMeta.branch = "7.2";

      src = fetchFromGitHub {
        owner = "AsahiLinux";
        repo = "linux";
        # AsahiLinux/linux fairydust branch, verified 2026-11-09.
        rev = "432e09dca5d88e145eba6ff6080cd77aa5b8ccf8";
        hash = "sha256-oB40IG6UgwgklAO8J09KY8/FPzF5nklvKvZe8A2/2Pg=";
      };

      kernelPatches = [
        {
          name = "tools-arm64-u128";
          # The tools' private types header must match newer host UAPI headers.
          patch = pkgs.fetchurl {
            url = "https://github.com/torvalds/linux/commit/10a47fb67340bca274276faf855d7d460afd9a7a.patch";
            hash = "sha256-MLRaNOAprujNVxIzAKg6sd/kc8tsiNh60bPMzYkeBkg=";
          };
        }
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

  boot.kernelPackages = lib.mkForce (pkgs.linuxPackagesFor fairydustKernel);
}
