local treesitter = require('nvim-treesitter.configs')

-- configure treesitter
treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
    },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
        "go",
        "rust",
        "python",
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "regex",
    },
    -- auto install above language parsers
    auto_install = true,
})

require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = false },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<cr>',
            node_incremental = '<tab>',
            scope_incremental = '<cr>',
            scope_decremental = '<s-cr>',
            node_decremental = '<s-tab>',
        },
    },
    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },
        highlight_definitions = { enable = true },
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
    textsubjects = {
        enable = true,
        lookahead = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
    endwise = { enable = true },
    matchup = { enable = true },
    ensure_installed = {
        "go",
        "rust",
        "python",
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "regex",
    },
}
