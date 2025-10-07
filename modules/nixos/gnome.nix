{
  config,
  pkgs,
  lib,
  ...
}:
{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  environment.etc."gdm/monitors.xml".source = ../../dotfiles/monitors
  + "/${config.networking.hostName}.xml";

  environment.systemPackages = with pkgs; [
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.just-perfection
    gnomeExtensions.paperwm
    gnomeExtensions.transparent-top-bar-adjustable-transparency
  ];
}
