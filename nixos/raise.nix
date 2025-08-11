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
    # ../modules/nixos/docker.nix
  ];

  environment.systemPackages = with pkgs; [
    nomachine-client
    slack
    # vault
  ];
}
