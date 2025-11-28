return {
	strategies = {
		chat = {
			adapter = "anthropic",
		},
		inline = {
			adapter = "anthropic",
		},
	},
	adapters = {
		http = {
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = "ANTHROPIC_API_KEY",
					},
					schema = {
						model = {
							default = "claude-sonnet-4-20250514",
						},
					},
				})
			end,
		},
	},
}
