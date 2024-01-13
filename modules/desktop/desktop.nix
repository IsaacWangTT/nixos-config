{ config, pkgs, nixosFlakePkgs, vars, ... }:

{
  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  programs.nm-applet = {
    enable = true;
    indicator = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  security.pam.services.swaylock = { }; # fix swaylock password
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ] ++
    (with nixosFlakePkgs.nixpkgs-wayland; [
      xdg-desktop-portal-wlr
    ]);
    config.common.default = "gtk";
  };

  environment = {
    systemPackages = with pkgs; [
      # System Tools
      libnotify
      polkit_gnome

      # Wayland
      wayland
      wayland-scanner
      wayland-utils
      egl-wayland
      wayland-protocols
      glfw-wayland
      xwayland
      pkgs.qt5.qtwayland
      pkgs.qt6.qtwayland

      # Xorg Tools
      xorg.xeyes
      xorg.xeyes
      xorg.xhost

      # Sound
      alsa-lib
      alsa-utils
      flac

      # Linux Tools
      linux-firmware
      linux-wifi-hotspot

      # Others
      lxappearance
      imagemagick
      ffmpeg
    ] ++
    (with nixosFlakePkgs.nixpkgs-wayland; [
      # Wayland
      wlr-randr

      # Wayland Tools
      wl-clipboard
      wev
      wf-recorder
    ]) ++
    (with pkgs.gnome; [
      nautilus
    ]);
    variables.NIXOS_OZONE_WL = "1";
  };

  programs = {
    kdeconnect = {
      enable = true;
      package = pkgs.valent;
    };
  };

  programs.light.enable = true; # brightness control

  services = {
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
  };

  services = {
    pipewire = {
      enable = true; # sound
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
  };

  services = {
    greetd = {
      enable = true; # desktop manager
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "${vars.user}";
        };
      };
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
