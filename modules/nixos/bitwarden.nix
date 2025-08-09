{ pkgs, ... }: {
  programs.ssh.startAgent = false;
  programs.ssh.extraConfig = ''
    Host *
      IdentityAgent ~/.bitwarden-ssh-agent.sock
  '';
}
