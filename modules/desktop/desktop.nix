{ config, pkgs, ... }:

{
  programs = {
    dconf.enable = true;
  };

  programs.nm-applet = {
    enable = true;
    indicator = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
    config.common.default = "*";
  };

  environment.systemPackages = with pkgs; [
    libnotify
    wl-clipboard
    wlr-randr
    wayland
    wayland-scanner
    wayland-utils
    egl-wayland
    wayland-protocols
    pkgs.xorg.xeyes
    glfw-wayland
    xwayland
    pkgs.qt5.qtwayland
    pkgs.qt6.qtwayland
    polkit_gnome
    wev
    wf-recorder
    alsa-lib
    alsa-utils
    flac
    pulsemixer
    linux-firmware
    sshpass
    lxappearance-gtk2
    imagemagick
    grim
    slurp
    linux-wifi-hotspot
    btrfs-assistant
  ];

  programs = {
    light.enable = true;
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services = {
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
