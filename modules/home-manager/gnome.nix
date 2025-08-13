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
          "AlphabeticalAppGrid@stuarthayhurst"
          "blur-my-shell@aunetx"
        ];
      };
    };
  };

  home.file.".config/monitors.xml" = {
    source = ../../dotfiles/gnome/monitors.xml;
  };
}
