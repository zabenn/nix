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
    ./configuration.nix
    ../modules/nixos/docker.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      sam = import ../home-manager/raise.nix;
    };
    backupFileExtension = "backup";
  };

  environment.systemPackages = with pkgs; [
    nomachine-client
    notion-app-enhanced
    slack
    vault
  ];
}
