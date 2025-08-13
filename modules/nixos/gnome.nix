{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.tzupdate.enable = true;

  environment.etc."gdm/monitors.xml".source = ../../dotfiles/monitors
  + "/${config.networking.hostName}.xml";

  environment.systemPackages = with pkgs; [
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.paperwm
  ];
}
