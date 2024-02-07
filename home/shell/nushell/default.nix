{
  programs.nushell = {
    enable = true;
    shellAliases = {
      l = "eza -ahl";
      la = "eza -a";
      ll = "eza -l";
      tree = "eza --tree";
      n = "fastfetch";
      top = "btop";
      lg = "lazygit";
      jo = "joshuto";
    };
  };
}
