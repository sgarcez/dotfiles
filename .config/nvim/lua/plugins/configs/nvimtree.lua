require("nvim-tree").setup({
    hijack_netrw = false,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        highlight_git = false,
        icons = {
            show = {
                file = false,
                folder = true,
                folder_arrow = true,
                git = false,
            },
        },
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set('n', '<Leader>a', ':NvimTreeFindFileToggle<CR>')
