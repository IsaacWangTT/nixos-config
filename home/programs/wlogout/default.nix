{
  imports = [
    ./layout.nix
    ./style.nix
  ];

  home.file = {
    ".config/wlogout/icons".source = ./icons;
  };

  programs.wlogout = {
    enable = true;
  };
}
