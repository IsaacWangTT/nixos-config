local configs = require("nvchad.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = {
  "bashls",
  "cssls",
  "cmake",
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  "marksman",
  "nixd",
  "pylsp",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
