local nvim_lsp = require('lspconfig')

vim.cmd('highlight! link LspCodeLens WarningMsg')
vim.cmd('highlight! link LspCodeLensText WarningMsg')
vim.cmd('highlight! link LspCodeLensTextSign LspCodeLensText')
vim.cmd('highlight! link LspCodeLensTextSeparator Boolean')

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- nvim_lsp.rust_analyzer.setup({
--     capabilities = capabilities,
--     settings = {
--         ["rust-analyzer"] = {
--             completion = {
--                 addCallArgumentSnippets = true,
--                 addCallParenthesis = true,
--             },
--             imports = {
--                 granularity = {
--                     group = "module",
--                 },
--                 prefix = "self",
--             },
--             cargo = {
--                 buildScripts = {
--                     enable = true,
--                 },
--             },
--             procMacro = {
--                 enable = true
--             },
--         }
--     }
-- })

require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
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
})

-- LSP Diagnostics Options Setup
-- local sign = function(opts)
--   vim.fn.sign_define(opts.name, {
--     texthl = opts.name,
--     text = opts.text,
--     numhl = ''
--   })
-- end

-- sign({name = 'DiagnosticSignError', text = ''})
-- sign({name = 'DiagnosticSignWarn', text = ''})
-- sign({name = 'DiagnosticSignHint', text = ''})
-- sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- vim.cmd([[
-- set signcolumn=yes
-- autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
-- ]])

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
