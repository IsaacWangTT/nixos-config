{ inputs, pkgs, ... }:

{
  home.file = {
    ".config/fish/themes".source = "${inputs.catppuccin-fish}/themes";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      set -g pure_symbol_prompt " ❯"
      set -g pure_symbol_ssh_prefix " "
    '';
    shellAliases = {
      l = "ls -ahl";
      la = "exa -a --icons";
      ll = "exa -l --icons";
      ls = "exa";
      n = "fastfetch";
      top = "btop";
    };
    functions = {
      f = ''
        FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git' FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8" fzf
      '';
    };
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "pure-fish";
          repo = "pure";
          rev = "92965b98ba88874d808090794e0fde4d55e4d561";
          sha256 = "Qx6jCOb5z1gweMmx+xyFjBp+J3G88qjJ12knI0yUDyQ=";
        };
      }
    ];
  };
}
