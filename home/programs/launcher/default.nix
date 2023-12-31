{ pkgs, inputs, ... }:

{
  home.file.".local/share/rofi/themes".source = "${inputs.catppuccin-rofi}/basic/.local/share/rofi/themes";

  xdg.configFile."rofi".source = "${inputs.catppuccin-rofi}/basic/.config/rofi";

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  services.cliphist = {
    enable = true;
    systemdTarget = "hyprland-session.target";
  };
}
