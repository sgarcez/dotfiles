return {

	-- moving
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 600
		end,
	},
	{
		"folke/flash.nvim",
		opts = {
			modes = {
				char = {
					keys = { "f", "F", "t", "T" },
				},
				search = {
					enabled = false,
				},
			},
		},
		enabled = true,
		event = "VeryLazy",
		keys = {
			{
				"m",
				mode = { "o", "x" },
				function()
					return require("flash.plugins.treesitter").jump()
				end,
			},
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					return require("flash").jump()
				end,
			},
			{
				"gl",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = { mode = "search" },
						highlight = { label = { after = { 0, 0 } } },
						pattern = "^",
					})
				end,
			},
		},
	},
	{
		-- auto enable and disable search highlighting
		"romainl/vim-cool",
		event = "VeryLazy",
	},

	-- navigation
	{ "christoomey/vim-tmux-navigator" },
	{ "tpope/vim-vinegar" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"crispgm/telescope-heading.nvim",
		},
		config = function()
			require("plugins.configs.telescope")
		end,
		cmd = "Telescope",
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
		build = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- split/join args
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({ --[[ your config ]]
				use_default_keymaps = false,
				max_join_length = 200,
			})
			vim.keymap.set("n", "<leader>m", require("treesj").toggle)
		end,
	},

	-- snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets", lazy = false },

	-- completions
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"saadparwaiz1/cmp_luasnip",
			"doxnit/cmp-luasnip-choice",
		},
		config = function()
			require("plugins.configs.cmp")
		end,
		event = "InsertEnter",
	},
	-- { "jose-elias-alvarez/null-ls.nvim" },
	{ "nvimtools/none-ls.nvim" },

	-- LSP / Diagnostics
	{ "neovim/nvim-lsp" },
	{ "neovim/nvim-lspconfig" },
	{ "folke/lsp-colors.nvim" },
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("plugins.configs.mason")
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
	-- {
	-- 	"kosayoda/nvim-lightbulb",
	-- 	config = function()
	-- 		require("nvim-lightbulb").setup({
	-- 			autocmd = { enabled = true },
	-- 			sign = {
	-- 				enabled = true,
	-- 				text = "♢",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"folke/trouble.nvim",
		config = function()
			require("plugins.configs.trouble")
		end,
	},

	-- debugger
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	init = function()
	-- 		require("core.utils").load_mappings("dap")
	-- 	end,
	-- },
	-- {
	-- 	"leoluz/nvim-dap-go",
	-- 	ft = "go",
	-- 	dependencies = "mfussenegger/nvim-dap",
	-- 	config = function(_, opts)
	-- 		require("dap-go").setup(opts)
	-- require("core.utils").load_mappings("dap_go")
	-- 	end,
	-- },

	-- langs
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins.configs.go")
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
	},
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("plugins.configs.rusttools")
		end,

		opts = {
			tools = {
				inlay_hints = {
					show_parameter_hints = false,
					-- only_current_line = true,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
			},
			server = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
					},
				},
			},
		},
	},

	-- UI
	{
		-- hover UI for messages, cmdline and the popupmenu
		"folke/noice.nvim",

		-- opts = {
		-- 	views = { mini = { lang = "markdown" } },
		-- 	lsp = {
		-- 		override = {
		-- 			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
		-- 			["vim.lsp.util.stylize_markdown"] = true,
		-- 			["cmp.entry.get_documentation"] = true,
		-- 		},
		-- 	},
		-- 	presets = {
		-- 		bottom_search = true,
		-- 		command_palette = true,
		-- 		long_message_to_split = true,
		-- 		inc_rename = true,
		-- 		lsp_doc_border = true,
		-- 	},
		-- },
		-- dependencies = { "MunifTanjim/nui.nvim" },

		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
							{ find = "fewer lines" },
						},
					},
					view = "mini",
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu togetherw
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			-- unicode icons
			cmdline = {
				format = {
					-- cmdline = { icon = ">" },
					search_down = { icon = "⌄" },
					search_up = { icon = "⌃" },
					-- filter = { icon = "$" },
					-- lua = { icon = "☾" },
					-- help = { icon = "?" },
				},
			},
			-- format = {
			-- 	level = {
			-- 		icons = {
			-- 			error = "✖",
			-- 			warn = "▼",
			-- 			info = "●",
			-- 		},
			-- 	},
			-- },
			-- popupmenu = {
			-- 	kind_icons = false,
			-- },
			-- inc_rename = {
			-- 	cmdline = {
			-- 		format = {
			-- 			IncRename = { icon = "⟳" },
			-- 		},
			-- 	},
			-- },
		},
	},

	{
		"folke/zen-mode.nvim",
		opts = {},
		config = function()
			vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>")
		end,
	},
	{
		"rcarriga/nvim-notify",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.configs.nvimtree")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = "jbyuki/one-small-step-for-vimkind",
		cmd = { "BreakpointToggle", "Debug", "DapREPL" },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = "nvim-dap",
		opts = {},
	},
	{
		-- better quickfix with previews
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	-- winbar
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		config = function()
			require("incline").setup()
		end,
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- registers
	{ "junegunn/vim-peekaboo" },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
	},

	-- git
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<Leader>ii", ":LazyGit<CR>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},
	{ "rhysd/conflict-marker.vim" },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<S-Tab>",
					-- accept_line = "<M-l>",
					-- accept_word = "<M-k>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				-- yaml = false,
				-- markdown = false,
				-- help = false,
				-- gitcommit = false,
				-- gitrebase = false,
				-- hgcommit = false,
				-- svn = false,
				-- cvs = false,
				-- ["."] = false,
				go = true,
				["*"] = false,
			},
		},
	},
}
