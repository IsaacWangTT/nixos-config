{ inputs, pkgs, ... }:

{
  xdg.configFile = {
    "nvim/init.lua".source = "${inputs.nvchad}/init.lua";
    "nvim/lua/core".source = "${inputs.nvchad}/lua/core";
    "nvim/lua/plugins".source = "${inputs.nvchad}/lua/plugins";
    "nvim/lua/custom".source = ./nvchad_custom;
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
    cmake
    cmake-language-server
    gcc
    gdb

    # markdown
    marksman
    nodePackages_latest.markdownlint-cli

    # python
    black
    pylint
    python311Packages.python-lsp-server

    # nix
    deadnix
    nixpkgs-fmt
    rnix-lsp

    # lua
    lua-language-server
    stylua

    # html css javascript
    prettierd
    vscode-langservers-extracted

    # Optional Requirements
    ripgrep
    tree-sitter
  ];
}
