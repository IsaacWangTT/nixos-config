{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # system
    ranger

    # message
    telegram-desktop

    # ranger plugins need
    highlight
  ];
}
