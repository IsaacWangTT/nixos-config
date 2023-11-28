{ pkgs, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    ranger

    # ranger plugins need
    highlight
  ];
}
