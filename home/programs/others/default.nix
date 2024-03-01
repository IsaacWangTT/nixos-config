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
    (obsidian.override {
      electron = pkgs.electron_25.overrideAttrs (_: {
        preFixup = "patchelf --add-needed ${pkgs.libglvnd}/lib/libEGL.so.1 $out/bin/electron"; # NixOS/nixpkgs#272912
        meta.knownVulnerabilities = [ ]; # NixOS/nixpkgs#273611
      });
    })

    (telegram-desktop.overrideAttrs
      (_: rec {

        pname = "64Gram";
        version = "1.1.14";

        src = fetchFromGitHub {
          owner = "TDesktop-x64";
          repo = "tdesktop";
          rev = "v${version}";

          fetchSubmodules = true;
          hash = "sha256-+Cx4qh/zHyBYRBxeZLZATU2U/r8xF24R8AXnfFwl+Oo=";
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
