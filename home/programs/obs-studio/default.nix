{ pkgs, inputs, ... }:

{
  home.file.".config/obs-studio/themes".source = "${inputs.catppuccin-obs}/themes";

  programs.obs-studio = {
    enable = true;
  };
}
