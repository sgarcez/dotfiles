local rt = require("rust-tools")

local opts = {
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
}

rt.setup(opts)
