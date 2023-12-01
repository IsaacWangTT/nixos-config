{ pkgs, vars, ... }:

{
  home.username = "${vars.user}";
  home.homeDirectory = "/home/${vars.user}";
  home.sessionVariables = {
    EDITOR = "${vars.editor}";
    TERMINAL = "${vars.terminal}";
  };

  xsession.numlock.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home.stateVersion = "24.05";
}
