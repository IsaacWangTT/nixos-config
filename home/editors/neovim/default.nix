{ inputs, pkgs, ... }:

{
  home.file = {
    ".config/nvim/init.lua".source = "${inputs.nvchad}/init.lua";
    ".config/nvim/lua/chadrc.lua".source = ./nvchad_custom/chadrc.lua;
    ".config/nvim/lua/mappings.lua".source = "${inputs.nvchad}/lua/mappings.lua";
    ".config/nvim/lua/options.lua".source = "${inputs.nvchad}/lua/options.lua";
    ".config/nvim/lua/plugins/plugins.lua".source = ./nvchad_custom/plugins.lua;
    ".config/nvim/lua/configs/conform.lua".source = "${inputs.nvchad}/lua/configs/conform.lua";
    ".config/nvim/lua/configs/lazy.lua".source = "${inputs.nvchad}/lua/configs/lazy.lua";

    ".config/nvim/lua/configs" = {
      source = ./nvchad_custom/configs;
      recursive = true;
    };
    ".config/nvim/lua/plugins" = {
      source = "${inputs.nvchad}/lua/plugins";
      recursive = true;
    };
    ".config/nvim/lua/custom" = {
      source = ./nvchad_custom;
      recursive = true;
    };
  };

  programs = {
    neovim = {
      enable = true;
      vimAlias = true;
    };
  };

  home.packages = with pkgs; [
    # bash
    nodePackages_latest.bash-language-server
    shfmt

    # c/c++
    cmake-format
    cmake-language-server

    # markdown
    marksman
    nodePackages_latest.markdownlint-cli

    # python
    black
    pylint
    python311Packages.python-lsp-server

    # nix
    deadnix
    nixd
    nixpkgs-fmt

    # lua
    lua-language-server
    stylua

    # html css javascript
    prettierd
    vscode-langservers-extracted

    # yaml
    yamlfmt
    yamllint
    yaml-language-server


    # Optional Requirements
    ripgrep
    tree-sitter
  ];
}
