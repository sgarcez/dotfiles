local M = {}

M.setup = function()
    require 'nvim-treesitter.configs'.setup {
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
            },
            lsp_interop = {
                enable = true,
            },
            move = {
                enable = true,
                set_jumps = true,
            },
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gnn',
                node_incremental = ".",
                scope_incremental = "grc",
                node_decremental = ",",
            }
        },
        ensure_installed = { "go", "python", "lua", "rust", "json" },
        autoinstall = true,
    }

    require 'nvim-treesitter.configs'.setup {
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
    }
end

return M
