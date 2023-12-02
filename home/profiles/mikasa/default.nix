{
  imports = [
    ../../shell
    ../../desktop/hyprland
    ../../editors
    ../../programs
    ../../terminals
  ];

  xsession.numlock.enable = true;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
