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
    via

    # Software
    libreoffice-fresh
    telegram-desktop

    # Development
    scrcpy
  ];
}
