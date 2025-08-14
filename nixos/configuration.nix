{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../modules/nixos
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        flake-registry = "";
        nix-path = config.nix.nixPath;
      };
      channel.enable = false;

      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  services.logind = {
    lidSwitchExternalPower = "ignore";
    lidSwitchDocked = "ignore";
  };

  users.users = {
    sam = {
      isNormalUser = true;
      home = "/home/sam";
      description = "Sam Cribbs";
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [
        "networkmanager"
        "wheel"
        "users"
      ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      sam = import ../home-manager/home.nix;
    };
  };

  environment.systemPackages = with pkgs; [
    blender
    bitwarden
    discord
    firefox
    git
    godot
    inter
    nixfmt-rfc-style
    vscode
  ];

  system.stateVersion = "23.05";
}
