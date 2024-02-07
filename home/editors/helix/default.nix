{ inputs, ... }:

{
  home.file.".config/helix/themes" = {
    source = "${inputs.catppuccin-helix}/themes/default";
    recursive = true;
  };
  programs.helix = {
    enable = true;
    languages = { };
    settings = {
      theme = "catppuccin_mocha";

      ui.background = { };

      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
      };

      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      editor.indent-guides = {
        render = true;
      };
    };
  };
}
