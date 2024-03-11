{ inputs, pkgs, ... }:

{
  home.file = {
    ".config/nvim" = {
      source = inputs.nvchad;
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
    # nixd
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
