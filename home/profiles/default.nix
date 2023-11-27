{ config, pkgs, vars, ... }:

{
  home.username = "${vars.user}";
  home.homeDirectory = "/home/${vars.user}";

  home.packages = with pkgs; [
    neofetch
    kitty
    librewolf
  ];

  home.stateVersion = "23.11";
}
