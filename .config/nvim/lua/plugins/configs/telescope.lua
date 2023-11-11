local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
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
			-- i = { ["<c-t>"] = trouble.open_with_trouble },
			i = {
				["<c-t>"] = trouble.open_with_trouble,
				["<esc>"] = actions.close,
			},
			n = { ["<c-t>"] = trouble.open_with_trouble },
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
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("heading")
telescope.load_extension("noice")
telescope.load_extension("ui-select")

vim.keymap.set("n", "<Leader><Leader>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>b", ":Telescope buffers<CR>")
-- vim.keymap.set("n", "<Leader>z", ":Telescope file_browser path=%:p:h<CR>")
vim.keymap.set("n", "<Leader>f", ":Telescope grep_string<CR>")
vim.keymap.set("n", "<Leader>r", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<Leader>ld", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<Leader>lr", ":Telescope lsp_references<CR>")
vim.keymap.set("n", "<Leader>li", ":Telescope lsp_incoming_calls<CR>")
vim.keymap.set("n", "<Leader>lo", ":Telescope lsp_outgoing_calls<CR>")
vim.keymap.set("n", "<Leader>lm", ":Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<Leader>ls", ":Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<Leader>d", ":Telescope diagnostics bufnr=0 <CR>")
vim.keymap.set("n", "<Leader>gs", ":Telescope git_status <CR>")
