local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local registry = require("mason-registry")

mason.setup({
	ui = {
		border = "rounded",
	},
	ensure_installed = {
		"stylua",
		"shfmt",
		"shellcheck",
		"golangci-lint",
		"markdownlint-cli2",
		"hadolint",
		"gomodifytags",
		"gofumpt",
		"impl",
		"checkmake",
		"gitlint",
		"goimports",
		"gotestsum",
		"delve",
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"gopls",
		"zls",
		-- "lua_ls",
		"golangci_lint_ls",
		-- "yamlls",
		-- "terraformls",
		-- "helm_ls",
		-- "jsonls",
	},
	-- auto-install configured servers (with lspconfig)
	-- automatic_installation = true, -- not the same as ensure_installed
})
