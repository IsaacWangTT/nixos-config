{ inputs, ... }:

{
  home.file.".config/cava/config".source = "${inputs.catppuccin-cava}/mocha.cava";

  programs.cava = {
    enable = true;
  };
}
