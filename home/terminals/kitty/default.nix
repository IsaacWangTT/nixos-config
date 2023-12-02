{ inputs, ... }:

{
  home.file.".config/kitty/themes".source = "${inputs.catppuccin-kitty}/themes";

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12;
    theme = "Catppuccin-Mocha";
    settings = {
      background_opacity = "0.85";
    };
    shellIntegration.enableFishIntegration = true;
  };
}
