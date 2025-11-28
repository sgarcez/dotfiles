return {

	-- moving
	{
		"folke/which-key.nvim",
		opts = {
			show_help = false,
			show_keys = false,
		},
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 600
		end,
	},
	{
		-- uses virtual text and gutter signs to show available motions
		"tris203/precognition.nvim",
		opts = {
			startVisible = false,
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = require("plugins.configs.flash").opts,
		keys = require("plugins.configs.flash").keys,
	},
	{
		-- auto enable and disable search highlighting
		"romainl/vim-cool",
		event = "VeryLazy",
	},

	-- navigation
	-- { "christoomey/vim-tmux-navigator" },
	{
		"mrjones2014/smart-splits.nvim",
		opts = {
			at_edge = "stop",
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			{
				"-",
				mode = { "n" },
				function() return vim.cmd("Oil") end,
			},
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function() require("plugins.configs.treesitter") end,
	},

	-- split/join args
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
			max_join_length = 200,
		},
		keys = {
			{
				"<leader>m",
				mode = { "n" },
				function() return require("treesj").toggle() end,
			},
		},
	},

	-- snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets", lazy = false },

	-- completions
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"giuxtaposition/blink-cmp-copilot",
		},
		opts = require("plugins.configs.blink-cmp").opts,
		opts_extend = { "sources.default" },
	},
	{
		"nvimtools/none-ls.nvim",
		config = function() require("plugins.configs.none-ls") end,
		dependencies = {
			"gbprod/none-ls-shellcheck.nvim",
		},
	},

	-- LSP / Diagnostics
	{
		"neovim/nvim-lspconfig",
		event = "VimEnter",
		config = function() require("plugins.configs.lsp") end,
	},
	{
		"mason-org/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function() require("plugins.configs.mason") end,
	},
	{
		"b0o/schemastore.nvim",
	},
	{
		-- lsp progress notifications
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			notification = {
				window = {
					border = "rounded",
					winblend = 0,
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = require("plugins.configs.trouble").opts,
		keys = require("plugins.configs.trouble").keys,
	},

	-- languages
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
		config = function() vim.g.rustaceanvim = require("plugins.configs.rustaceanvim") end,
	},
	{
		"towolf/vim-helm",
		ft = "helm",
	},

	-- Task runner
	{
		"stevearc/overseer.nvim",
		opts = {},
	},

	-- Test runners
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "fredrikaverpil/neotest-golang", version = "*" },
		},
		config = require("plugins.configs.neotest").config,
		keys = require("plugins.configs.neotest").keys,
	},

	{
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
		opts = require("plugins.configs.coverage").opts,
		keys = require("plugins.configs.coverage").keys,
	},

	-- UI
	{
		-- hover UI for cmdline, popupmenu, lsp hover
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = require("plugins.configs.noice"),
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = require("plugins.configs.snacks").opts,
		keys = require("plugins.configs.snacks").keys,
		init = require("plugins.configs.snacks").init,
	},
    -- libs for folke projects
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},
	{
		"folke/zen-mode.nvim",
		keys = {
			{ "<leader>z", "<cmd>ZenMode<CR>" },
		},
	},
	{
		"b0o/incline.nvim",
		config = function() require("incline").setup() end,
		event = "VeryLazy",
	},

	-- debugger
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"jbyuki/one-small-step-for-vimkind",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
		},
		cmd = { "BreakpointToggle", "Debug", "DapREPL" },
		config = function() require("plugins.configs.dap") end,
		keys = require("plugins.configs.dap_keymaps"),
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		config = function() require("Comment").setup() end,
	},

	-- registers
	{ "junegunn/vim-peekaboo" },
	{
		"nvim-lualine/lualine.nvim",
		opts = require("plugins.configs.lualine"),
	},

	-- git
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		opts = require("plugins.configs.gitsigns"),
	},
	{ "rhysd/conflict-marker.vim" },
	{
		"sindrets/diffview.nvim",
		command = "DiffviewOpen",
	},

	-- misc
	-- colour highlighter
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			"lua",
		},
	},

	-- LLMs
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = require("plugins.configs.copilot"),
	},
	{
		"olimorris/codecompanion.nvim",
		version = "v17.33.0",
		opts = require("plugins.configs.codecompanion"),
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
