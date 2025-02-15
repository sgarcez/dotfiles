return {
	opts = {
		commands = true, -- create commands
		auto_reload = true, -- reload on file change
	},
	keys = {
		{
			"<leader>tcl",
			mode = { "n" },
			function() return require("coverage").load() end,
			desc = "Load coverage",
		},
		{
			"<leader>tct",
			mode = { "n" },
			function() return require("coverage").toggle() end,
			desc = "Toggle coverage",
		},
		{
			"<leader>tcs",
			mode = { "n" },
			function() return require("coverage").summary() end,
			desc = "Show coverage summary",
		},
	},
}
