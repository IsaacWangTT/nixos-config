{ inputs, pkgs, ... }:

{
  home.file = {
    ".config/fish/themes".source = "${inputs.catppuccin-fish}/themes";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      n
      set -g fish_greeting ""
      set -g pure_enable_single_line_prompt true
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
          rev = "92965b98ba88874d808090794e0fde4d55e4d561";
          sha256 = "Qx6jCOb5z1gweMmx+xyFjBp+J3G88qjJ12knI0yUDyQ=";
        };
      }
    ];
  };
}
