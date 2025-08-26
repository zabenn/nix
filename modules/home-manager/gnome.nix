{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  dconf = {
    enable = true;
    settings = {
      "com/ftpix/transparentbar" = {
        dark-full-screen = false;
        transparency = 0;
      };
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://" + toString ../../dotfiles/gnome/wallpaper.png;
      };
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        clock-format = "12h";
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
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
          pkgs.gnomeExtensions.just-perfection.extensionUuid
          pkgs.gnomeExtensions.paperwm.extensionUuid
          pkgs.gnomeExtensions.transparent-top-bar-adjustable-transparency.extensionUuid
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
        default-focus-mode = 0;
        gesture-workspace-fingers = 0;
        horizontal-margin = 30;
        maximize-width-percent = 0.95;
        overview-min-windows-per-row = 4;
        selection-border-size = 0;
        show-focus-mode-icon = false;
        show-open-position-icon = false;
        show-window-position-bar = false;
        show-workspace-indicator = false;
        vertical-margin = 0;
        vertical-margin-bottom = 30;
        window-gap = 30;
        winprops = [
          ''{"wm_class":"*","preferredWidth":"35%"}''
          ''{"wm_class":"Code","preferredWidth":"65%"}''
          ''{"wm_class":"discord","preferredWidth":"50%"}''
          ''{"wm_class":"firefox","preferredWidth":"65%"}''
          ''{"wm_class":"Godot","preferredWidth":"100%"}''
        ];
      };
    };
  };
}
