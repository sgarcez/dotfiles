local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
vim.keymap.set('v', '<leader>lf', ':<C-u>call v:lua.vim.lsp.buf.range_formatting()<CR>', opts)
vim.keymap.set('n', '<Leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set('n', '<Leader>lce', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
vim.keymap.set('n', '<Leader>lcr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure html server
lspconfig["html"].setup({
    capabilities = capabilities,
})

lspconfig["rust-analyzer"].setup({
    capabilities = capabilities,
    cargo = {
        allFeatures = true
    },
    checkOnSave = {
        command = 'clippy',
        extraArgs = { '--no-deps' },
    },
})

-- configure lua server
lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    settings = {
        -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with({
    vim.lsp.handlers.signatureHelp, { border = 'rounded' }
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with({
    vim.lsp.handlers.hover, { border = 'rounded' }
})

vim.diagnostic.config({
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    virtual_lines = { only_current_line = true },
    virtual_text = {
        spacing = 4,
        source = 'always',
        prefix = '∎',
    },
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
        scope = 'cursor',
        wrap = true,
        max_width = 80,
    },
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
