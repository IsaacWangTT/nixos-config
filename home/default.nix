{ vars, ... }:

{
  home = {
    username = "${vars.user}";
    homeDirectory = "/home/${vars.user}";
    language.base = "en_US.UTF-8";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
