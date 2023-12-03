{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asciiquarium
    cmatrix
    cbonsai
    lolcat
    sl

    telegram-desktop
  ];
}
