local nvim_lsp = require('lspconfig')
local utils = require('utils')
local completion = require('completion')

require('lspfuzzy').setup{}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
    capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
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

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
