{ inputs, ... }:

{
  home.file.".config/obs-studio/themes" = {
    source = "${inputs.catppuccin-obs}/themes";
    recursive = true;
  };

  programs.obs-studio = {
    enable = true;
  };
}
