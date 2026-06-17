{pkgs, lib, stdenv, fetchurl}:
stdenv.mkDerivation {
  pname = "Hiddify";
  version = "4.1.1";
  src = fetchurl {
    url = "https://github.com/hiddify/hiddify-app/releases/download/v4.1.1/Hiddify-Debian-x64.deb";
    hash = "sha256:e622abd15f7d4410c5655f3fdcd0fa9300944666fa40ac22761f06f93020f10e";
  };
  nativeBuildInputs = with pkgs; [
    zstd
    autoPatchelfHook
  ];
  buildInputs = with pkgs; [
    curl
    gtk3
    glib
    pango
    libepoxy
    pyfa
    cairo
    libayatana-appindicator
    harfbuzz
    at-spi2-atk
    gdk-pixbuf
    libayatana-indicator
    ayatana-ido
    libdbusmenu-gtk3
  ];
  unpackPhase = ''
  ar x $src
  tar -xf data.tar.zst
  '';
  installPhase = ''
  mkdir -p $out/share/hiddify
  cp -r usr/share/* $out/share
  chmod 644 $out/share/applications/hiddify.desktop
  sed -i -e 's/^Version=.*$/Version=1.0/' $out/share/applications/hiddify.desktop
  mkdir -p $out/bin
  ln -s $out/share/hiddify/hiddify $out/bin/hiddify
  ln -s $out/share/hiddify/HiddifyCli $out/bin/HiddifyCli
  '';
}
