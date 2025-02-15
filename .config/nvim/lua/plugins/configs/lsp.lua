local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.api.nvim_create_augroup("autoformat_on_save", { clear = true })

local on_attach_autofmt = function(client, bufnr)
	-- if client.supports_method("textDocument/formatting") then
	--     vim.api.nvim_clear_autocmds({ group = "autoformat_on_save", buffer = bufnr })
	--     vim.api.nvim_create_autocmd("BufWritePre", {
	--         group = "autoformat_on_save",
	--         buffer = bufnr,
	--         callback = function()
	--             vim.lsp.buf.format()
	--         end,
	--     })
	-- end

	if client.supports_method("textDocument/codeAction") then
		vim.api.nvim_clear_autocmds({ group = "autoformat_on_save", buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "autoformat_on_save",
			-- pattern = "*.go",
			buffer = bufnr,
			callback = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
				for cid, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end
				vim.lsp.buf.format({ async = false })
			end,
		})
	end
end

lspconfig.yamlls.setup({
	capabilities = capabilities,
	schemaStore = {
		-- You must disable built-in schemaStore support if you want to use
		-- this plugin and its advanced options like `ignore`.
		enable = false,
		-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
		url = "",
	},
	schemas = require("schemastore").yaml.schemas(),
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lspconfig.helm_ls.setup({
	capabilities = capabilities,
	settings = {
		["helm-ls"] = {
			yamlls = {
				path = "yaml-language-server",
			},
		},
	},
})

lspconfig.terraformls.setup({})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function() vim.lsp.buf.format() end,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			format = {
				enable = false,
			},
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

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach_autofmt,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			completeUnimported = true,
			usePlaceholders = true,
			buildFlags = { "-tags=integration,dbintegration,vpn_integration" },
			gofumpt = false,
			["local"] = "", -- sadly disable separate local import group.
			analyses = {
				ST1003 = false,
				fieldalignment = false,
				unusedparams = false,
				shadow = false,
			},
			codelenses = {
				gc_details = true,
				generate = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
		},
	},
	on_attach = function(client, bufnr)
		on_attach_autofmt(client, bufnr)
		-- inlay hints
		-- if client.server_capabilities.inlayHintProvider then
		-- vim.lsp.inlay_hint.enable(true)
		-- end
		-- code lens
		-- vim.lsp.codelens.refresh()
		-- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
		-- 	buffer = bufnr,
		-- 	callback = vim.lsp.codelens.refresh,
		-- })
	end,
})

lspconfig.golangci_lint_ls.setup({
	capabilities = capabilities,
	cmd = { "golangci-lint-langserver", "-debug" },
	init_options = {
		command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" },
	},
	filetypes = { "go" },
})

lspconfig.pylsp.setup({
	capabilities = capabilities,
	-- on_attach = on_attach_autofmt,
})

-- diagnostics

vim.diagnostic.config({
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	virtual_lines = { only_current_line = true },
	virtual_text = false,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		scope = "cursor",
		wrap = true,
		max_width = 120,
	},
})
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, {})
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, {})
