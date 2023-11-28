{ inputs, pkgs, system, ... }:

{
  imports = [
    ./config.nix
    ./hyprpaper.nix
  ];

  home.file = {
    ".config/hypr/themes".source = "${inputs.catppuccin-hyprland}/themes";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };

  home.packages = with pkgs; [
    pamixer
    inputs.hyprpaper.packages.${system}.hyprpaper
    swaylock-effects
    swayidle
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];

  home = {
    sessionVariables = {
      QT_SCALE_FACTOR = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      CLUTTER_BACKEND = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
