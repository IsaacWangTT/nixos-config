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
    xfce.catfish

    # Software
    libreoffice-fresh
    telegram-desktop

    # Development
    scrcpy
  ];
}
