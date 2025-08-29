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
      sam.imports = [
        ../home-manager/home.nix
      ];
    };
  };

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "intel";
    server = {
      port = 6742;
    };
  };

  environment.systemPackages =
    (with pkgs; [
      blender
      bitwarden
      discord
      firefox
      git
      godot
      inter
      nixfmt-rfc-style
      openrgb
      python3
      spotify
      steam
      tinty
      uv
      vscode
    ])
    ++ (with inputs.affinity.packages.x86_64-linux; [
      designer
      photo
    ]);

  system.stateVersion = "23.05";
}
