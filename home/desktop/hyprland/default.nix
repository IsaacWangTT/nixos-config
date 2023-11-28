{ inputs, pkgs, system, ... }:

{
  imports = [
    ./config.nix
    ./hyprpaper.nix
  ];

  home.file = {
    ".config/hypr/scripts".source = ./scripts;
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
}
