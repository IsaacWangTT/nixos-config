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
    telegram-desktop

    # Development
    scrcpy
  ];
}
