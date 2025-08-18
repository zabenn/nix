{
  config,
  pkgs,
  ...
}:
{
  programs.bash = {
    enable = true;
    historyControl = [
      "erasedups"
      "ignoreboth"
    ];
  };

  home.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/nix#$hostname";
  };
}
