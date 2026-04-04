local servers = {
	gopls = {
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
				buildFlags = { "-tags=integration,dbintegration,vpn_integration,meter_integration,e2e" },
				gofumpt = false,
				-- ["local"] = "", -- sadly disable separate local import group.
				analyses = {
					ST1003 = false,
					fieldalignment = false,
					unusedparams = false,
					shadow = false,
				},
				codelenses = {
					gc_details = false,
					generate = true,
					regenerate_cgo = true,
					run_govulncheck = true,
					test = true,
					tidy = true,
					upgrade_dependency = true,
					vendor = true,
				},
				-- codelenses = {
				-- 	gc_details = true,
				-- 	generate = true,
				-- 	test = true,
				-- 	tidy = true,
				-- 	upgrade_dependency = true,
				-- 	vendor = true,
				-- },
				-- diagnostic = {
				-- 	annotations = {
				-- 		bounds = true,
				-- 		inline = true,
				-- 		escape = true,
				-- 		["nil"] = true,
				-- 	},
				-- },
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

	zls = {
		cmd = { "zls" },
		filetypes = { "zig", "zir" },
		-- root_dir = lspconfig.util.root_pattern("build.zig", ".git") or vim.loop.cwd,
		-- single_file_support = true,
	},

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
		settings = {
			yaml = {
				schemaStore = {
					-- Disable built-in schemaStore support to use schemastore plugin
					enable = false,
					-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
					url = "",
				},
				schemas = require("schemastore").yaml.schemas(),
			},
		},
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
	settings.capabilities = require("blink.cmp").get_lsp_capabilities(settings.capabilities)
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
