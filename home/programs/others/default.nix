{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # system
    ranger

    # message
    telegram-desktop

    # software
    flatpak

    # ranger plugins need
    highlight
  ];
}
