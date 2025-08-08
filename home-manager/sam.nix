{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [ ];
  
  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Sam Cribbs";
    userEmail = "samuel_cribbs@berkeley.edu";
  };

  xdg.userDirs.createDirectories = false;

  home.stateVersion = "23.05";
}
