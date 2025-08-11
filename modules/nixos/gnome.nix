{ pkgs, ... }:
{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.gnome.excludePackages = (
    with pkgs;
    [
      epiphany
      gnome-tour
      nixos-help
    ]
  );
}
