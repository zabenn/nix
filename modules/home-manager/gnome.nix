{ lib, pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        color-scheme = "prefer-dark";
        clock-format = "12h";
        clock-show-weekday = true;
      };
      "org/gnome/desktop/wm/preferences".num-workspaces = 1;
      "org/gnome/mutter" = {
        experimental-features = [
          "scale-monitor-framebuffer"
          "xwayland-native-scaling"
        ];
        dynamic-workspaces = false;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.alphabetical-app-grid.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.paperwm.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/paperwm" = {
        default-focus-mode = 2;
        show-workspace-indicator = false;
        show-focus-mode-icon = false;
        show-open-position-icon = false;
        selection-border-size = 0;
        selection-border-radius-top = 12;
        selection-border-radius-bottom = 12;
        selection-border-siz = 0;
        window-gap = 30;
        horizontal-margin = 30;
        vertical-margin = 30;
        vertical-margin-bottom = 30;
        cycle-height-steps = [
          0.5
          1.0
        ];
        cycle-width-steps = [
          0.35
          0.5
          0.65
        ];
        winprops = [
          ''{"wm_class":"*","preferredWidth":"100%"}''
          ''{"wm_class":"org.gnome.Console","preferredWidth":"50%"}''
          ''{"wm_class":"org.gnome.Settings","preferredWidth":"50%"}''
          ''{"wm_class":"Bitwarden","preferredWidth":"50%"}''
        ];
      };
    };
  };

  home.file.".config/monitors.xml" = {
    source = ../../dotfiles/gnome/monitors.xml;
  };
}
