{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmatrix
    ranger
    sl

    spotify
    qq
    telegram-desktop
    tidal-hifi

    # ranger plugins need
    highlight
  ];
}
