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
      outputs.overlays.affinity-packages
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

  services.automatic-timezoned.enable = true;

  services.geoclue2.geoProviderUrl = "https://api.beacondb.net/v1/geolocate";

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "intel";
    server = {
      port = 6742;
    };
  };

  services.speechd = {
    enable = true;
  };

  environment.etc."speech-dispatcherc/clients/hypnos.conf".source =
    ../dotfiles/steam/hypnospace_outlaw/hypnos.conf;
  environment.etc."speech-dispatcher/speechd.conf".source =
    ../dotfiles/steam/hypnospace_outlaw/speechd.conf;

  environment.systemPackages = with pkgs; [
    affinity.designer
    affinity.photo
    blender
    bitwarden
    discord
    firefox
    git
    gnome-network-displays
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
  ];

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

  system.stateVersion = "23.05";
}
