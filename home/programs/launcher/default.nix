{ pkgs, inputs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  xdg.configFile."rofi".source = "${inputs.catppuccin-rofi}/basic/.config/rofi";

  home.file.".local/share/rofi/themes".source = "${inputs.catppuccin-rofi}/basic/.local/share/rofi/themes";
}
