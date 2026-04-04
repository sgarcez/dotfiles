return {
	-- Format on save
	format_on_save = function(bufnr)
		-- Disable for buffers where we handle formatting via LSP (gopls, terraformls)
		if vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat then
			return
		end
		return { timeout_ms = 1000, lsp_format = "fallback" }
	end,

	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		python = { "isort" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		lua = { "stylua" },
		markdown = { "markdownlint_cli2" },
	},
}
