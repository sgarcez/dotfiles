return {
	cmdline = {
		enabled = false, -- enables the Noice cmdline UI
		view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
		opts = {}, -- global options for the cmdline. See section on views
		format = {
			cmdline = { pattern = "^:", icon = ">", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
			filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
			lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
			help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
			input = {}, -- Used by input()
		},
	},
	messages = {
		enabled = false, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	popupmenu = {
		enabled = false,
	},
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		progress = {
			enabled = false,
		},
		hover = {
			enabled = true,
			silent = true, -- set to true to not show a message if hover is not available
			view = nil, -- when nil, use defaults from documentation
			opts = {}, -- merged with defaults from documentation
		},
		signature = {
			enabled = false,
			auto_open = {
				enabled = true,
				trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
				luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
				throttle = 50, -- Debounce lsp signature help request by 50ms
			},
			view = nil, -- when nil, use defaults from documentation
			opts = {}, -- merged with defaults from documentation
		},
		documentation = {
			view = "hover",
			opts = {
				lang = "markdown",
				replace = true,
				render = "plain",
				format = { "{message}" },
				win_options = { concealcursor = "n", conceallevel = 3 },
			},
		},
	},
	-- routes = {
	--     {
	--         filter = {
	--             event = "msg_show",
	--             any = {
	--                 { find = "%d+L, %d+B" },
	--                 { find = "; after #%d+" },
	--                 { find = "; before #%d+" },
	--                 { find = "fewer lines" },
	--             },
	--         },
	--         view = "mini",
	--     },
	--     {
	--         filter = {
	--             event = "msg_show",
	--             kind = "",
	--             find = "written",
	--         },
	--         opts = { skip = true },
	--     },
	-- },
	win_options = {
		winhighlight = {
			Normal = "NormalFloat",
			FloatBorder = "FloatBorder",
		},
	},
	presets = {
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
}
