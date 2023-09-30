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
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- LSP / Diagnostics
	{ "neovim/nvim-lsp" },
	{ "neovim/nvim-lspconfig" },
	{ "folke/lsp-colors.nvim" },
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jayp0521/mason-null-ls.nvim",
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
	-- { "kosayoda/nvim-lightbulb" },
	{
		"folke/trouble.nvim",
		config = function()
			require("plugins.configs.trouble")
		end,
	},

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
		opts = {
			views = { mini = { lang = "markdown" } },
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
		},
		dependencies = { "MunifTanjim/nui.nvim" },
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
		"lewis6991/gitsigns.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},
	{ "rhysd/conflict-marker.vim" },

	{ "github/copilot.vim" },
}
