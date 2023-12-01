{ config, inputs, pkgs, ... }:

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
      n = "neofetch";
      top = "btop";
    };
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "pure-fish";
          repo = "pure";
          rev = "340304faa80371f6720037393e695a43c1aff83d";
          sha256 = "7rW2CViaGuZXJuluwnuAZC5rS37W828nayamhVcn9Kk=";
        };
      }
    ];
  };
}
