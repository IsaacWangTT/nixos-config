{ homeFlakePkgs, ... }:

{
  imports = [
    ./layout.nix
    ./style.nix
    ../../desktop/hyprland/scripts.nix
  ];

  home.file = {
    ".config/wlogout/icons".source = ./icons;
  };

  programs.wlogout = {
    enable = true;
    package = homeFlakePkgs.nixpkgs-wayland.wlogout;
  };
}
