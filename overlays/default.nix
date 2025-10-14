{ inputs, ... }:
{
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    gnome-keyring = prev.gnome-keyring.overrideAttrs (oldAttrs: {
      mesonFlags = (builtins.filter (flag: flag != "-Dssh-agent=true") oldAttrs.mesonFlags) ++ [
        "-Dssh-agent=false"
      ];
    });
    gnomeExtensions = prev.gnomeExtensions // {
      paperwm-fork = prev.gnomeExtensions.paperwm.overrideAttrs (oldAttrs: {
        version = "custom";
        src = prev.fetchFromGitHub {
          owner = "zabenn";
          repo = "PaperWM";
          rev = "release";
          sha256 = "sha256-ZPKf43nK0o7ZMPok8H5m/D6H181uArM9YG47YqUmPpM=";
        };
        meta = oldAttrs.meta // {
          homepage = "https://github.com/zabenn/PaperWM";
        };
      });
    };
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  affinity-packages = final: _prev: {
    affinity = inputs.affinity.packages.${final.system};
  };
}
