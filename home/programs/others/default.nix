{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmatrix
    ranger
    sl

    telegram-desktop

    # ranger plugins need
    highlight
  ];
}
