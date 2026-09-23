{
  description = "thatwhichisdev's personalized NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://zed.cachix.org"
      "https://nixos-apple-silicon.cachix.org"
      "https://nix-community.cachix.org/"
      "https://noctalia.cachix.org"
      "https://nixos-raspberrypi.cachix.org"
    ];

    extra-trusted-public-keys = [
      "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
      "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
    ];

    experimental-features = [
      "flakes"
      "nix-command"
    ];

    trusted-users = [
      "thatwhichisapple"
      "root"
      "@build"
      "@wheel"
      "@admin"
    ];

    show-trace = true;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    apple-silicon.url = "github:nix-community/nixos-apple-silicon";

    awww.url = "git+https://codeberg.org/LGFae/awww";

    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";

    globalprotect-openconnect.url = "github:yuezk/GlobalProtect-openconnect";

    helix.url = "github:helix-editor/helix";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:epireyn/niri-flake";

    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    ghost-shell.url = "github:thatwhichisdev/ghost-shell";
    ghost-shell.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix/release-26.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    fastpotify.url = "github:mixedCase/fastpotify?ref=fix/nix-package-build";

    tuigreet.url = "github:NotAShelf/tuigreet";
    tuigreet.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    konnect.url = "github:mixelpixx/Konnect/v0.12.1";
    konnect.inputs.nixpkgs.follows = "nixpkgs";

    berkeley-mono.url = "git+ssh://git@github.com/thatwhichisdev/berkeley-mono.git";

    nix-assets.url = "git+ssh://git@github.com/thatwhichisdev/nix-assets.git";

    zed.url = "github:zed-industries/zed/v1.16.2";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (self) outputs;

      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      treefmtEval = forAllSystems (
        system: inputs.treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} ./modules/treefmt.nix
      );
    in
    {
      formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);

      checks = forAllSystems (system: {
        formatting = treefmtEval.${system}.config.build.check self;
      });

      nixosConfigurations = {
        nano = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nano/configuration.nix
          ];
        };
        viva = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/viva/configuration.nix
          ];
        };
      };

    };
}
