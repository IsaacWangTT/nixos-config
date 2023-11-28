{ pkgs, vars, ... }:

{
  home.username = "${vars.user}";
  home.homeDirectory = "/home/${vars.user}";
  home.sessionVariables = {
    EDITOR = "${vars.editor}";
  };

  home.stateVersion = "23.11";
}
