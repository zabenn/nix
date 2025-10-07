{ inputs, ... }:
{
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    gnome-keyring = prev.gnome-keyring.overrideAttrs (oldAttrs: {
      mesonFlags = (builtins.filter (flag: flag != "-Dssh-agent=true") oldAttrs.mesonFlags) ++ [
        "-Dssh-agent=false"
      ];
    });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
