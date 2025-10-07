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
    ../modules/home-manager
  ];

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      inputs.vscode-extensions.overlays.default
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  xdg.userDirs.createDirectories = false;

  programs.git = {
    enable = true;
    userName = "Sam Cribbs";
    userEmail = "samuel_cribbs@berkeley.edu";
    lfs.enable = true;
    extraConfig = {
      push = {
        autoSetupRemote = true;
      };
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        ms-azuretools.vscode-docker
        ms-python.python
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
      ];
      userSettings = {
        "editor.formatOnSave" = true;
        "explorer.confirmDelete" = false;
        "files.insertFinalNewline" = true;
        "git.allowForcePush" = true;
        "git.autofetch" = true;
        "git.confirmForcePush" = false;
        "git.enableSmartCommit" = true;
        "remote.autoForwardPortsSource" = "hybrid";
        "remote.SSH.configFile" = "${config.home.homeDirectory}/metalman2/.devops/ssh/config";
      };
    };
  };

  home.stateVersion = "23.05";
}
