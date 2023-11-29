{ config, ... }:

{
  programs.fish = {
    enable = true;
    # loginShellInit = 
    #   if config.wayland.windowManager.hyprland.enable then ''
    #     set TTY1 (tty)
    #     [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
    #   ''
    #   else '''';
    interactiveShellInit = ''set -g fish_greeting'';
  };
}
