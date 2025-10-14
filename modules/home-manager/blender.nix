{ pkgs, lib, ... }:
let
  cadSketcher = pkgs.fetchFromGitHub {
    owner = "hlorus";
    repo = "CAD_Sketcher";
    rev = "main";
    sha256 = "sha256-4RbFwr8Bjqss2twjLMHFrnFdLved4Znve8E1N2SlsA0=";
  };
  gameRigTools = pkgs.fetchFromGitHub {
    owner = "BlenderBoi";
    repo = "GameRigTools";
    rev = "v4.2.3";
    sha256 = "sha256-i/ggiDp6yfEMEXnptrjgbsqKdTeGoDIkfLh/TmIalNA=";
  };
  loopTools = pkgs.fetchgit {
    url = "https://projects.blender.org/extensions/mesh_looptools.git";
    rev = "refs/heads/main";
    sha256 = "sha256-wYYOL4nuSY81I0cBp0nbWndGqZhyrI5uMIXkWm3dMRg=";
  };
in
{
  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/extensions/user_default/cad_sketcher".source =
    cadSketcher;
  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/extensions/user_default/gamerigtools".source =
    gameRigTools;
  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/extensions/user_default/looptools".source =
    "${loopTools}/source";

  xdg.configFile."blender/${pkgs.lib.versions.majorMinor pkgs.blender.version}/config/userpref.blend".source =
    ../../dotfiles/blender/userpref.blend;
}
