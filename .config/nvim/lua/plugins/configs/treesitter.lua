local treesitter = require('nvim-treesitter.configs')

-- require 'nvim-treesitter.configs'.setup {
--     textobjects = {
--         select = {
--             enable = true,
--             lookahead = true,
--         },
--         lsp_interop = {
--             enable = true,
--         },
--         move = {
--             enable = true,
--             set_jumps = true,
--         },
--     },
--     highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--     },
--     indent = {
--         enable = true
--     },
--     incremental_selection = {
--         enable = true,
--         keymaps = {
--             init_selection = 'gnn',
--             node_incremental = ".",
--             scope_incremental = "grc",
--             node_decremental = ",",
--         }
--     },
--     ensure_installed = { "go", "python", "lua", "rust", "json" },
--     autoinstall = true,
-- }

-- require 'nvim-treesitter.configs'.setup {
--     textobjects = {
--         move = {
--             enable = true,
--             set_jumps = true,     -- whether to set jumps in the jumplist
--             goto_next_start = {
--                 ["]m"] = "@function.outer",
--                 ["]]"] = "@class.outer",
--             },
--             goto_next_end = {
--                 ["]M"] = "@function.outer",
--                 ["]["] = "@class.outer",
--             },
--             goto_previous_start = {
--                 ["[m"] = "@function.outer",
--                 ["[["] = "@class.outer",
--             },
--             goto_previous_end = {
--                 ["[M"] = "@function.outer",
--                 ["[]"] = "@class.outer",
--             },
--         },
--     },
-- }

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
