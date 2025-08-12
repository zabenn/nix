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
    ./home.nix
    ../modules/home-manager/metalman.nix
  ];
}
