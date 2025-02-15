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
		"golangci_lint_ls",
		"yamlls",
		"rust_analyzer",
	},
	-- auto-install configured servers (with lspconfig)
	-- automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	ensure_installed = {
		"markdownlint-cli2",
		"hadolint",
		"stylua",
		"shfmt",
		"shellcheck",
		"terraform-ls",
		"helm-ls",
		"yaml-language-server",
		"gomodifytags",
		"gofumpt",
		"impl",
		"checkmake",
		"gitlint",
		"gofumpt",
		"goimports",
		"gotestsum",
		"delve",
	},
	automatic_installation = true,
})
