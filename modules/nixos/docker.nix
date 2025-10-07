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

  systemd = {
    services."docker-cleanup" = {
      script = ''
        ${pkgs.docker}/bin/docker system prune -f --filter "until=$((30*24))h"
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        After = [ "docker.service" ];
        Requires = [ "docker.service" ];
      };
    };
    timers."docker-cleanup" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
        Unit = "docker-cleanup.service";
      };
    };
  };
}
