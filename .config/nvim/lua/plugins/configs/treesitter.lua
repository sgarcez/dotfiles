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
        ensure_installed = { "go", "python", "lua", "rust" }
    }
end

return M
