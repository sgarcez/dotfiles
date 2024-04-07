local telescope = require("telescope")
local actions = require("telescope.actions")
-- local trouble = require("trouble.sources.telescope")
local fb_actions = require("telescope").extensions.file_browser.actions

local opts = {
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		winblend = 0,
		layout_strategy = "vertical",
		layout_config = {
			height = 0.95,
			horizontal = {
				mirror = false,
			},
			vertical = {
				preview_height = 0.7,
				mirror = false,
			},
		},
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { ".git", "vendor" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"-g",
			"!*vendor",
		},
		mappings = {
			-- i = { ["<c-t>"] = trouble.open },
			i = {
				-- ["<c-t>"] = trouble.open_with_trouble,
				["<esc>"] = actions.close,
			},
			-- n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = false,
			dir_icon = "",
			mappings = {
				["i"] = {
					["<C-n>"] = fb_actions.create,
				},
				["n"] = {},
			},
		},
	},
}

telescope.setup(opts)
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("heading")
telescope.load_extension("noice")
telescope.load_extension("ui-select")
