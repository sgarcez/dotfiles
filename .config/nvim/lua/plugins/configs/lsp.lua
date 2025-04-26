vim.api.nvim_create_augroup("autoformat_on_save", { clear = true })
local on_attach_autofmt = function(client, bufnr)
	if client.supports_method("textDocument/codeAction") then
		vim.api.nvim_clear_autocmds({ group = "autoformat_on_save", buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "autoformat_on_save",
			-- pattern = "*.go",
			buffer = bufnr,
			callback = function()
				local win = vim.api.nvim_get_current_win()
				local enc = client.offset_encoding or "utf-16"
				local params = vim.lsp.util.make_range_params(win, enc)
				params.context = { only = { "source.organizeImports" } }
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
				for _, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then vim.lsp.util.apply_workspace_edit(r.edit, enc) end
					end
				end
				vim.lsp.buf.format({ async = false })
			end,
		})
	end
end

local servers = {
	gopls = {
		on_attach = on_attach_autofmt,
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
				gofumpt = true,
				-- ["local"] = "", -- sadly disable separate local import group.
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
	},

	golangci_lint_ls = {
		cmd = { "golangci-lint-langserver", "-debug" },
		init_options = {
			command = { "golangci-lint", "run", "--output.json.path", "stdout", "--show-stats=false", "--issues-exit-code=1" },
		},
		filetypes = { "go" },
	},

	rust_analyzer = {},
	lua_ls = {
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
	},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},

	yamlls = {
		schemaStore = {
			-- Disable built-in schemaStore support to use schemastore plugin
			enable = false,
			-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
			url = "",
		},
		schemas = require("schemastore").yaml.schemas(),
	},

	helm_ls = {
		settings = {
			["helm-ls"] = {
				yamlls = {
					path = "yaml-language-server",
				},
			},
		},
	},

	terraformls = {},
}

for server, settings in pairs(servers) do
	vim.lsp.config(server, settings)
	vim.lsp.enable(server)
end

vim.diagnostic.config({
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	-- virtual_lines = { only_current_line = true },
	virtual_text = true,
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
