return {
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "normal",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				lsp = {
					name = "lsp",
					enabled = true,
					module = "blink.cmp.sources.lsp",
					score_offset = 99,
				},

				copilot = {
					name = "copilot",
					enabled = true,
					module = "blink-cmp-copilot",
					async = true,
					score_offset = 100,
				},
				buffer = {
					name = "Buffer",
					enabled = true,
					max_items = 3,
					module = "blink.cmp.sources.buffer",
					score_offset = 15,
				},
			},
		},
		completion = {
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
			-- Displays a preview of the selected item on the current line
			ghost_text = {
				enabled = false,
			},
		},
	},
}
