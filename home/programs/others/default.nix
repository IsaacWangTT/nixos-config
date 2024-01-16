{ pkgs, ... }:

{
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
    dialect
    fractal
    snapshot

    # Software
    bitwarden
    libreoffice-fresh
    telegram-desktop
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
