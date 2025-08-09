{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [ ];

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
  
  nixpkgs.config.allowUnfree = true;

  xdg.userDirs.createDirectories = false;

  programs.git = {
    enable = true;
    userName = "Sam Cribbs";
    userEmail = "samuel_cribbs@berkeley.edu";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      ms-python.python
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "explorer.confirmDelete" = false;
      "git.autofetch" = true;
    };
  };

  home.stateVersion = "23.05";
}
