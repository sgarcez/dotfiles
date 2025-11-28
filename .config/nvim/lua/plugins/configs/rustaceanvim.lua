return {
	server = {
		default_settings = {
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
	dap = {
		adapter = {
			type = "executable",
			command = "codelldb",
			name = "rt_lldb",
		},
	},
}
