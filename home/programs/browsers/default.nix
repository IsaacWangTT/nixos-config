{ pkgs, ... }:

{
  home.packages = with pkgs;[
    tor-browser
  ];

  imports = [
    ./chromium.nix
    ./firefox.nix
  ];
}
