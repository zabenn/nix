{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.cursor;
in
{
  options.programs.cursor = {
    enable = lib.mkEnableOption "Enable Cursor";
    extensions = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
    };
    userSettings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
    keybindings = lib.mkOption {
      type = lib.types.listOf lib.types.attrs;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."Cursor/User/settings.json" = lib.mkIf (cfg.userSettings != { }) {
      text = builtins.toJSON cfg.userSettings;
    };
    xdg.configFile."Cursor/User/keybindings.json" = lib.mkIf (cfg.keybindings != [ ]) {
      text = builtins.toJSON cfg.keybindings;
    };
    home.activation.installCursorExtensions = lib.hm.dag.entryAfter [ "writeBoundary" ] (
      lib.concatStringsSep "\n" (
        [
          ''$DRY_RUN_CMD rm -rf "${config.home.homeDirectory}/.cursor/extensions"''
          ''$DRY_RUN_CMD mkdir -p "${config.home.homeDirectory}/.cursor/extensions"''
        ]
        ++ (lib.map (
          ext:
          let
            extId = ext.vscodeExtId or ext.extensionId or ext.pname or ext.name;
            extDir = "${ext}/share/vscode/extensions";
            actualExtName = builtins.readDir extDir;
            actualExtPath = "${extDir}/${builtins.head (builtins.attrNames actualExtName)}";
          in
          ''$DRY_RUN_CMD ln -sf "${actualExtPath}" "${config.home.homeDirectory}/.cursor/extensions/${builtins.head (builtins.attrNames actualExtName)}"''
        ) cfg.extensions)
      )
    );
  };
}
