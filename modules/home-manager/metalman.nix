{ config, pkgs, ... }:
{
  home.sessionVariables = {
    VAULT_ADDR = "https://onsite-cluster-public-vault-1f1ef36e.c13c227f.z1.hashicorp.cloud:8200";
    VAULT_NAMESPACE = "admin";
    GITHUB_USERNAME = "samraise";
    GITHUB_PRIVATE_KEY = "${config.home.homeDirectory}";
    GITHUB_PUBLIC_KEY = "${config.home.homeDirectory}/.ssh/github_key.pub";
    GITHUB_CERTIFICATE = "${config.home.homeDirectory}/.ssh/github_certificate.pub";
    METALMAN_DIR = "${config.home.homeDirectory}/metalman2";
  };

  home.file.".ssh/github_key.pub" = {
    source = ../../dotfiles/ssh/github_key.pub;
  };

  programs.ssh.includes = [ "\${METALMAN_DIR}/.devops/ssh/config" ];
}
