{ pkgs, ... }:

{
  xdg.desktopEntries = {
    obsidian = {
      categories = [ "Office" ];
      comment = "Knowledge base";
      exec = "obsidian %u --enable-wayland-ime";
      icon = "obsidian";
      mimeType = [ "x-scheme-handler/obsidian" ];
      name = "Obsidian";
      type = "Application";
    };
  };
  home.packages = with pkgs; [
    # ASCII
    asciiquarium
    cmatrix
    cbonsai
    lolcat
    sl

    # System
    clamav
    clamtk
    mesa-demos
    xfce.catfish
    gnome-solanum
    baobab
    fractal
    snapshot

    # Software
    bitwarden
    libreoffice-fresh
    motrix
    obsidian

    (telegram-desktop.overrideAttrs
      (_: rec {

        pname = "64Gram";
        version = "1.1.15";

        src = fetchFromGitHub {
          owner = "TDesktop-x64";
          repo = "tdesktop";
          rev = "v${version}";

          fetchSubmodules = true;
          hash = "sha256-3HLRv8RTyyfnjMF7w+euSOj6SbxlxOuczap5Nlizsvg=";
        };
      })
    )
    qq

    # Development
    scrcpy
  ] ++
  (with pkgs.gnome; [
    file-roller
    eog
    dconf-editor

    gnome-calculator
    gnome-clocks
    gnome-sound-recorder
    gnome-system-monitor
    gnome-weather
  ]);
}
