local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

mason.setup({
	ui = {
		border = "rounded",
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"gopls",
		"lua_ls",
	},
	-- auto-install configured servers (with lspconfig)
	-- automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	ensure_installed = {
		"stylua", -- lua formatter
		"shfmt", -- shell formatter
		"shellcheck", -- shell linter
		-- "markdownlint", -- markdown linter
        "terraform-ls", -- terraform formatter
	},
	automatic_installation = true,
})
