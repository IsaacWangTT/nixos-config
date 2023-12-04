{ vars, ... }:

{
  imports = [
    ../../shell
    ../../desktop/hyprland
    ../../editors
    ../../programs
    ../../terminals
  ];

  home.sessionVariables = {
    BROWSER = "${vars.browser}";
    TERMINAL = "${vars.terminal}";
    EDITOR = "${vars.editor}";
  };

  xsession.numlock.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
