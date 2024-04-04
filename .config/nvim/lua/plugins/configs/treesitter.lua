require'nvim-treesitter.configs'.setup({
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {
            "dockerfile",
        },
    },
    indent = { enable = false },
    autotag = { enable = true },
    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
        highlight_definitions = { enable = true },
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
            },
        },
    },
    textsubjects = {
        enable = true,
        lookahead = true,
        prev_selection = ",",
        keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["i;"] = "textsubjects-container-inner",
        },
    },
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
})
