{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asciiquarium
    cmatrix
    cbonsai
    lolcat
    ranger
    sl

    telegram-desktop

    # ranger plugins need
    highlight
  ];
}
