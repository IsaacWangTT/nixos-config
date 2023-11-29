{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # system
    ranger

    # message
    qq
    telegram-desktop

    # software
    flatpak

    # ranger plugins need
    highlight
  ];
}
