local nvim_lsp = require'lspconfig'
local utils = require'utils'

nvim_lsp.pyls.setup{}

nvim_lsp.gopls.setup{
    init_options = {
        -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
        usePlaceholders = true,
        completeUnimported = true,
        linkTarget = "pkg.go.dev",
        completionDocumentation = true,
        deepCompletion = true,
        matcher = "fuzzy",
        staticcheck = true,
        hoverKind = "FullDocumentation",
        gofumpt = true,
        buildFlags = {"-tags=component,integration"},
    },
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }
}

nvim_lsp.rust_analyzer.setup{
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            completion = {
                addCallArgumentSnippets = false,
                addCallParenthesis = false,
            }
        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

utils.keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = false })
utils.keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = false })
utils.keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = false })
utils.keymap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = false })
utils.keymap("n", "<leader>lh",  "<cmd>lua vim.lsp.buf.hover()<CR>")
utils.keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = false })
utils.keymap('v', '<leader>lf', ':<C-u>call v:lua.vim.lsp.buf.range_formatting()<CR>', { noremap = false })
utils.keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', { noremap = false })
utils.keymap('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', { noremap = false })
utils.keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = false })
