{ config, pkgs, ... }:
{
  services.ssh-agent.enable = false;

  home.file.".ssh/zabenn.pub" = {
    source = ../../dotfiles/ssh/zabenn.pub;
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        identityFile = "${config.home.homeDirectory}/.ssh/zabenn.pub";
        identityAgent = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
