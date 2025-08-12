{ pkgs, ... }:
{
  services.ssh-agent.enable = false;
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        identityAgent = "~/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
