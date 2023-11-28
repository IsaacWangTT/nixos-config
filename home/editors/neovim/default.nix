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

    # python
    black
    pylint
    python311Packages.python-lsp-server

    # nix
    nixpkgs-fmt
    rnix-lsp

    # lua
    lua-language-server
    stylua

    # Optional Requirements
    ripgrep
  ];
}
