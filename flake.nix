{
  description = "Data Surf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: let
    sys = "x86_64";
    system = "${sys}-linux";

    pname = "Surf";
    version = "0.8.3";

    src = pkgs.fetchurl {
      url = "https://github.com/deta/surf/releases/download/v${version}/${pname}-${version}-${sys}.AppImage";
    };

    appImageContents = appimageTools.extract {
      inherit pname version src;
    };

    pkgs = inputs.nixpkgs.legacyPackages.${system};
    inherit (pkgs) appimageTools;
  in {
    packages."${system}" = {
      default = inputs.self.packages.${system}.surf;

      flow = appimageTools.wrapType2 {
        inherit version src;

        pname = "surf";

        extraInstallCommands = ''
          install -m 444 -D ${./flow-browser.desktop} $out/share/applications/${pname}.desktop
          install -m 444 -D ${appImageContents}/usr/share/icons/hicolor/512x512/apps/${pname}.png \
            $out/share/icons/hicolor/512x512/apps/${pname}.png
        '';
      };
    };
  };
}
