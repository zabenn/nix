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
      "org/gnome/desktop/app-folders".folder-children = [ ];
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://" + toString ../../dotfiles/gnome/wallpaper.png;
      };
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        clock-format = "12h";
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
        enable-hot-corners = false;
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
          ''{"wm_class":"blender","preferredWidth":"65%"}''
          ''{"wm_class":"Cursor","preferredWidth":"65%"}''
          ''{"wm_class":"designer.exe","preferredWidth":"65%"}''
          ''{"wm_class":"discord","preferredWidth":"65%"}''
          ''{"wm_class":"firefox","preferredWidth":"65%"}''
          ''{"wm_class":"Godot","preferredWidth":"100%"}''
          ''{"wm_class":"Nxplayer.bin","preferredWidth":"65%"}''
          ''{"wm_class":"rviz2","preferredWidth":"65%"}''
        ];
      };
    };
  };

  xdg.desktopEntries = {
    "nixos-manual" = {
      name = "";
      noDisplay = true;
    };
    "nvidia-settings" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Calculator" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Connections" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.clocks" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Decibels" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Epiphany" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Evince" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Geary" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Logs" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Loupe" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Maps" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.seahorse.Application" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Snapshot" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.TextEditor" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Totem" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Tour" = {
      name = "";
      noDisplay = true;
    };
    "org.gnome.Weather" = {
      name = "";
      noDisplay = true;
    };
    "simple-scan" = {
      name = "";
      noDisplay = true;
    };
    "xterm" = {
      name = "";
      noDisplay = true;
    };
    "yelp" = {
      name = "";
      noDisplay = true;
    };
  };
}
