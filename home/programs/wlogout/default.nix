{
  imports = [
    ./layout.nix
    ./style.nix
    ../../desktop/hyprland/scripts/myswaylock.nix
  ];

  home.file = {
    ".config/wlogout/icons".source = ./icons;
  };

  programs.wlogout = {
    enable = true;
  };
}
