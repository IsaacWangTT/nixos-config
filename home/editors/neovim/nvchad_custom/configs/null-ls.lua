local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.black,
	formatting.cmake_format,
	formatting.fish_indent,
	formatting.prettierd,
	formatting.shfmt,
	formatting.stylua,
	formatting.markdownlint,
	formatting.nixpkgs_fmt,
	formatting.prettierd,
	formatting.yamlfmt,

	-- lint.cmake_lint,
	-- lint.deadnix,
	-- lint.fish,
	-- lint.markdownlint,
	-- lint.pylint,
	-- lint.yamllint,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_buf_create_user_command(bufnr, "LspFormatting", function()
				-- or vim.lsp.buf.formatting(bufnr) on 0.8
				vim.lsp.buf.format({ bufnr = bufnr })
			end, {})

			-- you can leave this out if your on_attach is unique to null-ls,
			-- but if you share it with multiple servers, you'll want to keep it
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				command = "undojoin | LspFormatting",
			})
		end
	end,
})
