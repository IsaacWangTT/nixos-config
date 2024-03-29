local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "fish",
        "html",
        "json",
        "jsonc",
        "lua",
        "python",
        "make",
        "markdown",
        "nix",
        "yaml",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimtools/none-ls.nvim",
      config = function()
        require("configs.null-ls")
      end,
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  {
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {
      extra_groups = {
        "NvimTreeNormal",
        "NvimTreeNormalNC",
        "NvimTreeWinSeparator",
      },
    },
  },
}

return plugins
