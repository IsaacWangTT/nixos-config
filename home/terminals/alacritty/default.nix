{ inputs, ... }:

{
  home.file.".config/alacritty/themes" = {
    source = "${inputs.alacritty-theme}/themes";
    recursive = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "~/.config/alacritty/themes/catppuccin_mocha.toml"
      ];

      live_config_reload = true;

      window = {
        opacity = 0.85;
        dimensions = {
          columns = 120;
          lines = 60;
        };
        padding = {
          x = 10;
          y = 15;
        };
        dynamic_padding = false;
        startup_mode = "Maximized";
        decorations = "none";
      };

      font = {
        size = 12;
      };

      scrolling = {
        history = 2000;
        multiplier = 20;
      };
    };
  };
}
