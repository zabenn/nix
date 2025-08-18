{ config, pkgs, ... }:
{
  home.sessionVariables = {
    AWS_DEFAULT_PROFILE = "raise";
    AWS_DEFAULT_REGION = "us-east-1";
  };

  home.file.".aws/config".source = ../../dotfiles/aws/config;
}
