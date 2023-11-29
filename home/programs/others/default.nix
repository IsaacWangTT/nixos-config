{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ranger

    spotify
    qq
    telegram-desktop
    tidal-hifi

    # ranger plugins need
    highlight
  ];
}
