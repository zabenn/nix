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
      outputs.overlays.affinity-packages
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
        # eddiedover.gdscript-formatter-linter
        geequlim.godot-tools
        jnoortheen.nix-ide
        ms-azuretools.vscode-docker
        ms-python.python
        ms-vscode-remote.remote-containers
        ms-vscode-remote.remote-ssh
        piousdeer.adwaita-theme
      ];
      userSettings = {
        "chat.editing.confirmEditRequestRemoval" = false;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.renderLineHighlight" = "none";
        "explorer.confirmDelete" = false;
        "files.insertFinalNewline" = true;
        "git.allowForcePush" = true;
        "git.autofetch" = true;
        "git.confirmForcePush" = false;
        "git.enableSmartCommit" = true;
        "godotTools.editor.revealTerminal" = false;
        "godotTools.lsp.autoReconnect.attempts" = 1;
        "remote.autoForwardPortsSource" = "hybrid";
        "remote.SSH.configFile" = "${config.home.homeDirectory}/metalman2/.devops/ssh/config";
        "scm.defaultViewMode" = "tree";
        "window.autoDetectColorScheme" = true;
        "window.commandCenter" = true;
        "window.titleBarStyle" = "custom";
        "workbench.iconTheme" = null;
        "workbench.preferredDarkColorTheme" = "Default Dark Modern";
        "workbench.preferredLightColorTheme" = "Default Light Modern";
        "workbench.productIconTheme" = "adwaita";
        "workbench.tree.indent" = 12;
        "workbench.welcomePage.walkthroughs.openOnInstall" = false;
      };
    };
  };

  home.stateVersion = "23.05";
}
