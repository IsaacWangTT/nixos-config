{ inputs, pkgs, ... }:

{
  home.file.".config/fish/themes" = {
    source = "${inputs.catppuccin-fish}/themes";
    recursive = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
    shellAliases = {
      l = "eza -ahl";
      la = "eza -a";
      ll = "eza -l";
      ls = "eza";
      tree = "eza --tree";
      n = "fastfetch";
      top = "btop";
      lg = "lazygit";
      jo = "joshuto";
    };
    functions = {
      f = ''
        FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git' FZF_DEFAULT_OPTS="--color=spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" fzf
      '';
    };
    plugins = [
      {
        name = "plugin-bak";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-bak";
          rev = "93ce665e1e0ae405a4bbee102f782646e03cdfb6";
          hash = "sha256-5BeSsy2JFkaKfXOtscJZVoaSK4FO8H6MXuV43uKd4TI=";
        };
      }
      {
        name = "plugin-bang-bang";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-bang-bang";
          rev = "ec991b80ba7d4dda7a962167b036efc5c2d79419";
          hash = "sha256-oPPCtFN2DPuM//c48SXb4TrFRjJtccg0YPXcAo0Lxq0=";
        };
      }
    ];
  };
}
