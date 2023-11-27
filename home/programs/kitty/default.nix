{ inputs, vars, ... }:

{
  home.sessionVariables.TERMINAL = "${vars.terminal}";

  home.file.".config/kitty/themes".source = "${inputs.catppuccin-kitty}/themes";

  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font";
    theme = "Catppuccin-Mocha";
  };
}
