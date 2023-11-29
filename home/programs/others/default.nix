{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ranger

    spotify
    qq
    telegram-desktop

    # ranger plugins need
    highlight
  ];
}
