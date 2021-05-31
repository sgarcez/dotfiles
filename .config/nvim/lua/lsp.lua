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
