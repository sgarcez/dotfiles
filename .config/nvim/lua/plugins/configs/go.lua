local capabilities = require("lsp").capabilities
local on_attach = require("lsp").on_attach

require("go").setup({
	goimport = "gopls", -- if set to 'gopls' will use golsp format
	gofmt = "gopls", -- if set to gopls will use golsp format
	max_line_len = 120,
	tag_transform = false,
	test_dir = "",
	comment_placeholder = "",
	dap_debug = true,
	dap_debug_keymap = true,
	icons = false,
	textobjects = false,
	-- disabling to avoid the octal normalisation
	lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = on_attach,-- true, -- use on_attach from go.nvim
	lsp_keymaps = false,
	lsp_codelens = true,
	lsp_document_formatting = true,
	diagnostic = {
		virtual_text = true,
	},
	-- https://github.com/ray-x/go.nvim/blob/8a0498ee48a26f928b1dc1c02fb3d84d648a1c63/lua/go/gopls.lua#L245
	-- lsp_cfg = false,
	lsp_cfg = {
		capabilities = capabilities,
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				buildFlags = { "-tags=integration,dbintegration" },
				["local"] = "", -- sadly disable separate local import group.
				analyses = {
					ST1003 = false,
					fieldalignment = false,
					unusedparams = false,
					shadow = false,
				},
			},
		},
	},
	lsp_inlay_hints = {
		enable = true,
		only_current_line = false,
	},
})

local group = vim.api.nvim_create_augroup("vimgo", { clear = false })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	pattern = { "*.go" },
	callback = function()
		require("go.format").goimport()
	end,
})
