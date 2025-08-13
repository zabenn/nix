{ lib, pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        clock-format = "12h";
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
      };
      "org/gnome/mutter" = {
        experimental-features = [
          "scale-monitor-framebuffer"
          "xwayland-native-scaling"
        ];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.alphabetical-app-grid.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.just-perfection.extensionUuid
          pkgs.gnomeExtensions.paperwm.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/just-perfection" = {
        activities-button = false;
        dash = false;
        search = false;
        workspace = false;
        workspace-peek = false;
        workspace-popup = false;
      };
      "org/gnome/shell/extensions/paperwm" = {
        cycle-height-steps = [
          0.5
          1.0
        ];
        cycle-width-steps = [
          0.35
          0.5
          0.65
        ];
        default-focus-mode = 2;
        horizontal-margin = 30;
        selection-border-radius-bottom = 12;
        selection-border-radius-top = 12;
        selection-border-size = 0;
        selection-border-sizz = 0;
        show-focus-mode-icon = false;
        show-open-position-icon = false;
        show-workspace-indicator = false;
        vertical-margin = 30;
        vertical-margin-bottom = 30;
        window-gap = 30;
        winprops = [
          ''{"wm_class":"*","preferredWidth":"2500px"}''
          ''{"wm_class":"org.gnome.Console","preferredWidth":"50%"}''
          ''{"wm_class":"org.gnome.Settings","preferredWidth":"50%"}''
          ''{"wm_class":"Bitwarden","preferredWidth":"50%"}''
        ];
      };
    };
  };
}
