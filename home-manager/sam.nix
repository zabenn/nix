{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [ ];

  home.username = "sam";
  home.homeDirectory = "/home/sam";

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  xdg.userDirs.createDirectories = false;

  programs.git = {
    enable = true;
    userName = "Sam Cribbs";
    userEmail = "samuel_cribbs@berkeley.edu";
  };

  home.stateVersion = "23.05";
}
