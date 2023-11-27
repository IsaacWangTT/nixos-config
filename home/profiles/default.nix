{ config, pkgs, vars, ... }:

{
  home.username = "${vars.user}";
  home.homeDirectory = "/home/${vars.user}";
  home.sessionVariables = {
    EDITOR = "${vars.editor}";
    TERMINAL = "${vars.terminal}";
  };

  home.packages = with pkgs; [
    neofetch
    kitty
    librewolf
  ];

  home.stateVersion = "23.11";
}
