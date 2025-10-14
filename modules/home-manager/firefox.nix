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
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.startup.page" = 3;
        "browser.theme.dark-private-windows" = false;
        "browser.uidensity" = 0;
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "media.eme.enabled" = true;
        "pref.privacy.disable_button.view_passwords" = true;
        "signon.rememberSignons" = false;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
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
