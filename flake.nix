{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
  in
  {
    devShells.${system}.default = pkgs.mkShell rec {
      buildInputs = with pkgs; [
        nodejs
        libudev-zero
        pkg-config
        zlib
        gperf
        expat
        glib
        nss
        nspr
        xorg.libX11 # libX11.so.6
        xorg.libXcomposite # libXcomposite.so.1
        xorg.libXdamage # libXdamage.so.1
        xorg.libXext # libXext.so.6
        xorg.libXfixes # libXfixes.so.3
        xorg.libXrandr # libXrandr.so.2
        xorg.libXtst # libXtst.so.6
        mesa # libgbm.so.1
        libdrm # libdrm.so.2
        alsa-lib # libasound.so.2
        libxkbcommon # libxkbcommon.so.0
        pango # libpango-1.0.so.0
        dbus # libdbus-1.so.3
        at-spi2-atk # libatk-1.0.so.0
        xorg.libxcb # libxcb.so.1
        cairo # libcairo.so.2
        xorg.xdpyinfo
        cups
        ccache
      ];
      CPLUS_INCLUDE_PATH = "${pkgs.glib.dev}/include/glib-2.0"
              + ":${pkgs.glib.out}/lib/glib-2.0/include"
              + ":${pkgs.glib.dev}/include"
              + ":${pkgs.nss.dev}/include/nss"
              + ":${pkgs.nspr.dev}/include"
              + ":${pkgs.cairo.dev}/include/cairo"
              + ":${pkgs.freetype.dev}/include/freetype2"
              + ":${pkgs.freetype.dev}/include"
              + ":${pkgs.libdrm.dev}/include/libdrm"
              + ":${pkgs.libdrm.dev}/include"
              + ":${pkgs.at-spi2-atk.dev}/include/atk-1.0"
              + ":${pkgs.at-spi2-atk.dev}/include/at-spi-2.0"
              + ":${pkgs.at-spi2-atk.dev}/include/at-spi2-atk/2.0"
              + ":${pkgs.dbus.dev}/include/dbus-1.0"
              + ":${pkgs.dbus.lib}/lib/dbus-1.0/include"
      ;
      C_INCLUDE_PATH = CPLUS_INCLUDE_PATH;
      CCACHE_SLOPPINESS = "time_macros,include_file_mtime";
      CCACHE_BASEDIR = "/home/khaki/Projects";
    };
  };
}
