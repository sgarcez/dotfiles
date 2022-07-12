local nvim_lsp = require('lspconfig')

require('lspfuzzy').setup {}

vim.cmd('highlight! link LspCodeLens WarningMsg')
vim.cmd('highlight! link LspCodeLensText WarningMsg')
vim.cmd('highlight! link LspCodeLensTextSign LspCodeLensText')
vim.cmd('highlight! link LspCodeLensTextSeparator Boolean')

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.gopls.setup {
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
        buildFlags = { "-tags=component,integration" },
        codelenses = {
            generate = true,
            gc_details = true,
        },
    },
    capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup {
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

require 'lspconfig'.sumneko_lua.setup {
    cmd = { "lua-language-server", "-E", "/usr/lib/lua-language-server/main.lua" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                -- Setup lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
            }
        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
    }
)

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
