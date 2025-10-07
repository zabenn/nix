{ pkgs, ... }:
let
  godotMinimalTheme = pkgs.fetchFromGitHub {
    owner = "passivestar";
    repo = "godot-minimal-theme";
    rev = "2.3.3";
    sha256 = "sha256-cdWeuM/VjhC0XyUr5vCfrgepbG9+QPIhZC7RoGQXcds=";
  };
in
{
  home.file.".local/share/godot/themes/minimal_theme.tres".source =
    "${godotMinimalTheme}/minimal_theme.tres";

  home.file.".config/godot/editor_settings-4.4.tres".source =
    ../../dotfiles/godot/editor_settings-4.4.tres;
}
