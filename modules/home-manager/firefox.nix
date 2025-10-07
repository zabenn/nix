{ config, pkgs, ... }:
let
  firefoxGnomeTheme = pkgs.fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "firefox-gnome-theme";
    rev = "v142";
    sha256 = "sha256-kyxuK5Fras7QYiJmUomqdq8NlgWV66hmNvxcJnGCpUE=";
  };
in
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      settings = {
        "browser.download.dir" = "${config.home.homeDirectory}";
        "browser.download.useDownloadDir" = true;
        "browser.formfill.enable" = false;
        "browser.newtab.url" = "https://www.google.com";
        "browser.startup.page" = 3;
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "pref.privacy.disable_button.view_passwords" = true;
        "signon.rememberSignons" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uidensity" = 0;
        "svg.context-properties.content.enabled" = true;
        "browser.theme.dark-private-windows" = false;
      };
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ublock-origin
      ];
      userChrome = builtins.readFile (firefoxGnomeTheme + "/userChrome.css");
      userContent = builtins.readFile (firefoxGnomeTheme + "/userContent.css");
    };
  };
}
