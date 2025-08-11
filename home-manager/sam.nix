{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ ];

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  xdg.userDirs.createDirectories = false;

  nixpkgs.overlays = [ inputs.nur.overlays.default ];

  programs.git = {
    enable = true;
    userName = "Sam Cribbs";
    userEmail = "samuel_cribbs@berkeley.edu";
  };

  programs.vscode = {
    enable = true;
    profiles.default = {
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
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
      };
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
      ];
    };
  };

  home.stateVersion = "23.05";
}
