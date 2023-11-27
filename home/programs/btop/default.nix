{ inputs, ... }:

{
  home.file.".config/btop/themes".source = "${inputs.catppuccin-btop}/themes";
  
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
      theme_background = false;
    };
  };
}
