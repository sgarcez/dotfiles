local nvim_lsp = require('lspconfig')

vim.cmd('highlight! link LspCodeLens WarningMsg')
vim.cmd('highlight! link LspCodeLensText WarningMsg')
vim.cmd('highlight! link LspCodeLensTextSign LspCodeLensText')
vim.cmd('highlight! link LspCodeLensTextSeparator Boolean')

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {
--         "documentation",
--         "detail",
--         "additionalTextEdits",
--     },
-- }

-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- -- currently using go.nvim setup instead of this
-- nvim_lsp.gopls.setup {
--     init_options = {
--         -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
--         usePlaceholders = true,
--         completeUnimported = true,
--         linkTarget = "pkg.go.dev",
--         completionDocumentation = true,
--         deepCompletion = true,
--         matcher = "fuzzy",
--         staticcheck = true,
--         hoverKind = "FullDocumentation",
--         gofumpt = true,
--         buildFlags = { "-tags=component,integration" },
--         codelenses = {
--             generate = true,
--             gc_details = true,
--         },
--     },
--     capabilities = capabilities,
-- }

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    -- capabilities = capabilities,
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
    virtual_text = false,
    signs = true,
    update_in_insert = false,
}
)

local utils = require('utils')
utils.keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = false })
utils.keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
utils.keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
utils.keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>')
utils.keymap('v', '<leader>lf', ':<C-u>call v:lua.vim.lsp.buf.range_formatting()<CR>')
utils.keymap('n', '<Leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.keymap('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.keymap('n', '<Leader>lce', '<cmd>lua vim.lsp.codelens.refresh()<CR>')
utils.keymap('n', '<Leader>lcr', '<cmd>lua vim.lsp.codelens.run()<CR>')

-- -- currently using Telescope instead of these
-- utils.keymap('n', '<Leader>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = false })
-- utils.keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- utils.keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- utils.keymap('n', '<leader>le', '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- utils.keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- utils.keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
-- utils.keymap('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
