{ inputs, pkgs, homeFlakePkgs, ... }:

{
  imports = [
    ./config.nix
    ./hyprpaper.nix
    ./scripts.nix
  ];

  home.file.".config/hypr/themes" = {
    source = "${inputs.catppuccin-hyprland}/themes";
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };

  home.packages = with pkgs; [
    grimblast
    hyprpicker
    hyprpaper
    playerctl
    pamixer
  ] ++
  (with homeFlakePkgs.nixpkgs-wayland;[
    swaylock-effects
    swayidle
    slurp
    grim
    wlsunset
  ]);

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  home = {
    sessionVariables = {
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    };
  };
}
