{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
  ];

  programs.eza = {
    enable = true;
    git = true;
    icons = true;
  };

  programs.fzf = {
    enable = true;
  };
}
