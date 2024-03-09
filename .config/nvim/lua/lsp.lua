local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(_, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
end

-- local capabilities = lspconfig.capabilities
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- using go.nvim
-- lspconfig.gopls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	cmd = { "gopls" },
-- 	filetypes = { "go", "gomod", "gowork", "gotmpl" },
-- 	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
-- 	settings = {
-- 		gopls = {
-- 			hints = {
-- 				assignVariableTypes = false,
-- 				compositeLiteralFields = false,
-- 				compositeLiteralTypes = false,
-- 				constantValues = false,
-- 				functionTypeParameters = true,
-- 				parameterNames = false,
-- 				rangeVariableTypes = false,
-- 			},
-- 			completeUnimported = true,
-- 			usePlaceholders = true,
-- 			buildFlags = { "-tags=integration,dbintegration" },
-- 			["local"] = "", -- sadly disable separate local import group.
-- 			analyses = {
-- 				ST1003 = false,
-- 				fieldalignment = false,
-- 				unusedparams = false,
-- 				shadow = false,
-- 			},
-- 		},
-- 	},
-- })

-- lspconfig["rust-analyzer"].setup({
-- 	capabilities = capabilities,
-- 	cargo = {
-- 		allFeatures = true,
-- 	},
-- 	checkOnSave = {
-- 		command = "clippy",
-- 		extraArgs = { "--no-deps" },
-- 	},
-- })

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- terraform
lspconfig.terraformls.setup({})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- diagnostics

local sign_define = vim.fn.sign_define
sign_define("DiagnosticSignError", { text = "", numhl = "RedSign" })
sign_define("DiagnosticSignWarn", { text = "", numhl = "YellowSign" })
sign_define("DiagnosticSignInfo", { text = "", numhl = "WhiteSign" })
sign_define("DiagnosticSignHint", { text = "", numhl = "BlueSign" })

vim.diagnostic.config({
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	virtual_lines = { only_current_line = true },
	virtual_text = {
		spacing = 4,
		source = "always",
		prefix = "∎",
	},
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		scope = "cursor",
		wrap = true,
		max_width = 80,
	},
})

-- handlers

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	update_in_insert = false,
	underline = true,
})

-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with({
	vim.lsp.handlers.signatureHelp,
	{ border = "rounded" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with({
	vim.lsp.handlers.hover,
	{ border = "rounded" },
})

-- null-ls setup

local null_ls = require("null-ls")
local null_fmt = null_ls.builtins.formatting
local null_diag = null_ls.builtins.diagnostics
-- local null_act = null_ls.builtins.code_actions

null_ls.setup({
	update_in_insert = true,
	sources = {
		null_diag.shellcheck,
		null_diag.markdownlint,
		null_fmt.clang_format,
		null_fmt.isort,
		null_fmt.shfmt,
		null_fmt.stylua,
		null_diag.hadolint,
	},
})

return {
	capabilities = capabilities,
	on_attach = on_attach,
}
