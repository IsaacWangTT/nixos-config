{ pkgs, ... }:

{
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      qq = {
        executable = "${pkgs.qq}/bin/qq";
        desktop = "${pkgs.qq}/share/applications/qq.desktop";
        profile = "${pkgs.firejail}/etc/firejail/linuxqq.profile";
        extraArgs = [ "--dbus-user.talk=org.kde.StatusNotifierWatcher" ];
      };
    };
  };
}
