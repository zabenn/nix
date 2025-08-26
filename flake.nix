{
  description = "Sam's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions/00e11463876a04a77fb97ba50c015ab9e5bee90d";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nur,
      vscode-extensions,
      ...
    }:
    let
      inherit (self) outputs;
    in
    {
      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeModules = import ./modules/home-manager;

      nixosConfigurations = {
        p14s = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            { networking.hostName = "p14s"; }
            ./hardware/p14s.nix
            ./nixos/raise.nix
          ];
        };
        zbox = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            { networking.hostName = "zbox"; }
            ./hardware/zbox.nix
            ./nixos/raise.nix
          ];
        };
      };
    };
}
