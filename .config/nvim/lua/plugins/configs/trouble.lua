require("trouble").setup {
    icons = false,
}

vim.keymap.set('n', '<Leader>lt', '<cmd>TroubleToggle<CR>')
