local utils = require('utils')
local telescope = require 'telescope'
local trouble = require("trouble.providers.telescope")
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
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
            "-g", "!*vendor",
        },
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = false,
            dir_icon = "",
            mappings = {
                ["i"] = {
                    ["<C-n>"] = fb_actions.create
                },
                ["n"] = {
                },
            },
        },
    },
}

_ = telescope.load_extension "file_browser"
_ = telescope.load_extension "fzf"

utils.keymap("n", "<Leader><Leader>", ":Telescope find_files<CR>")
utils.keymap("n", "<Leader>e", ":Telescope grep_string<CR>")
utils.keymap("n", "<Leader>b", ":Telescope buffers<CR>")
utils.keymap("n", "<Leader>r", ":Telescope live_grep<CR>")
utils.keymap("n", "<Leader>f", ":Telescope file_browser path=%:p:h<CR>")
utils.keymap("n", "<Leader>ld", ":Telescope lsp_definitions<CR>")
utils.keymap("n", "<Leader>lr", ":Telescope lsp_references<CR>")
utils.keymap("n", "<Leader>li", ":Telescope lsp_incoming_calls<CR>")
utils.keymap("n", "<Leader>lo", ":Telescope lsp_outgoing_calls<CR>")
utils.keymap("n", "<Leader>lm", ":Telescope lsp_implementations<CR>")
utils.keymap("n", "<Leader>ls", ":Telescope lsp_document_symbols<CR>")
utils.keymap("n", "<Leader>d", ":Telescope diagnostics bufnr=0 <CR>")
