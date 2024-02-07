{ inputs, homeFlakePkgs, ... }:

{
  imports = [
    ./config.nix
    ./style.nix
  ];

  home.file.".config/waybar/themes" = {
    source = "${inputs.catppuccin-waybar}/themes";
    recursive = true;
  };

  programs.waybar = {
    enable = true;
    package = homeFlakePkgs.nixpkgs-wayland.waybar;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };
  };
}
