{ pkgs, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    ranger

    highlight
  ];
}
