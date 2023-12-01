{ inputs, ... }:

{
  imports = [
    ./config.nix
    ./style.nix
  ];

  home.file = {
    ".config/waybar/themes".source = "${inputs.catppuccin-waybar}/themes";
  };

  programs.waybar = {
    enable = true;
  };
}
