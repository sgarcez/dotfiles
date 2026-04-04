-- organizeImports runs synchronously on BufWritePre via LSP code action,
-- before conform's format pass. Registered here to keep format-on-save
-- logic in one place.
-- 1. organizeImports autocmd fires first (registered with pattern = "*.go", runs synchronously via buf_request_sync)
-- 2. conform's format_on_save fires next (conform registers its own BufWritePre with priority), calls vim.lsp.buf.format()
-- via lsp_format = "first" → gopls formats the now-import-organised buffer
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function(ev)
		local client = vim.lsp.get_clients({ bufnr = ev.buf, name = "gopls" })[1]
		if not client then return end
		local enc = client.offset_encoding or "utf-16"
		local win = vim.api.nvim_get_current_win()
		local params = vim.lsp.util.make_range_params(win, enc)
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(ev.buf, "textDocument/codeAction", params, 1000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then vim.lsp.util.apply_workspace_edit(r.edit, enc) end
			end
		end
	end,
})

return {
	format_on_save = function(bufnr)
		if vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat then return end
		return { timeout_ms = 1000, lsp_format = "fallback" }
	end,

	formatters_by_ft = {
		-- Go and Terraform: no external formatter, fall back to gopls/terraformls
		go = { lsp_format = "first" },
		terraform = { lsp_format = "first" },
		["terraform-vars"] = { lsp_format = "first" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		python = { "isort" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		lua = { "stylua" },
		markdown = { "markdownlint_cli2" },
	},
}
