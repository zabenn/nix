{ pkgs, ... }:
{
  home.file.".config/godot/editor_settings-4.4.tres".source =
    ../../dotfiles/godot/editor_settings-4.4.tres;
  home.file.".local/share/godot/themes/minimal_theme.tres".source = pkgs.fetchurl {
    url = "https://github.com/passivestar/godot-minimal-theme/releases/download/2.3.3/minimal_theme.tres";
    sha256 = "sha256-dfv0LGY05pwrwSH8zwMZXEzyShWgL09di3AbLzr99EA=";
  };
}
