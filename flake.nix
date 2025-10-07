{
  description = "Sam's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    affinity.url = "github:mrshmllow/affinity-nix";
    affinity.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      affinity,
      nur,
      vscode-extensions,
      ...
    }:
    let
      inherit (self) outputs;
      mkSystem =
        hostname: config:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            { networking.hostName = hostname; }
            ./hardware/${hostname}.nix
            ./nixos/${config}.nix
          ];
        };
    in
    {
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeModules = import ./modules/home-manager;

      nixosConfigurations = {
        p14s = mkSystem "p14s" "raise";
        xps = mkSystem "xps" "raise";
        zbox = mkSystem "zbox" "raise";
      };
    };
}
