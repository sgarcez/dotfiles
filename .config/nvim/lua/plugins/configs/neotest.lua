return {
	config = function()
		local opts = {
			adapters = {
				-- require("neotest-go"),
				-- vs
				require("neotest-golang")({
					runner = "gotestsum",
					go_test_args = {
						"-v",
						"-race",
						"-count=1",
						"-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
					},
				}),
			},
			diagnostic = {
				enabled = true,
			},
			status = {
				virtual_text = false,
				signs = true,
			},
			quickfix = {
				open = function() require("trouble").open({ mode = "quickfix", focus = false }) end,
			},

			-- improve performance
			discovery = {
				-- Drastically improve performance in ginormous projects by
				-- only AST-parsing the currently opened buffer.
				enabled = false,
				-- Number of workers to parse files concurrently.
				-- A value of 0 automatically assigns number based on CPU.
				-- Set to 1 if experiencing lag.
				concurrent = 1,
			},
			running = {
				-- Run tests concurrently when an adapter provides multiple commands to run.
				concurrent = true,
			},
			summary = {
				-- Enable/disable animation of icons.
				animated = false,
			},
		}
		require("neotest").setup(opts)
	end,
	keys = {
		{
			"<leader>tr",
			mode = { "n" },
			function() return require("neotest").run.run() end,
			desc = "Run tests",
		},
		{
			"<leader>tf",
			mode = { "n" },
			function() return require("neotest").run.run(vim.fn.expand("%")) end,
			desc = "Run tests in file",
		},
		{
			"<leader>td",
			mode = { "n" },
			function() return require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end,
			desc = "Run tests in file with dap",
		},
		{
			"<leader>ta",
			mode = { "n" },
			function() return require("neotest").run.attach() end,
			desc = "Attach to test runner",
		},
		{
			"<leader>to",
			mode = { "n" },
			function() return require("neotest").output_panel.toggle() end,
			desc = "Toggle output panel",
		},
	},
}
