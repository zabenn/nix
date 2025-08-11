{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ nvidia-container-toolkit ];

  users.extraGroups.docker.members = [ "sam" ];

  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    daemon.settings = {
      features = {
        cdi = true;
      };
    };
  };
}
