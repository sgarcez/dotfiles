local capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                commitCharactersSupport = true,
                deprecatedSupport = true,
                documentationFormat = { "markdown", "plaintext" },
                preselectSupport = true,
                insertReplaceSupport = true,
                labelDetailsSupport = true,
                snippetSupport = true,
                resolveSupport = {
                    properties = {
                        "documentation",
                        "details",
                        "additionalTextEdits",
                    },
                },
            },
            contextSupport = true,
            dynamicRegistration = true,
        },
    },
}

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'go'.setup({
    goimport = 'gopls', -- if set to 'gopls' will use golsp format
    gofmt = 'gopls', -- if set to gopls will use golsp format
    max_line_len = 120,
    tag_transform = false,
    test_dir = '',
    comment_placeholder = '',
    dap_debug = true,
    dap_debug_keymap = false,
    icons = false,
    textobjects = false,
    lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = true, -- use on_attach from go.nvim
    lsp_keymaps = false,
    lsp_diag_virtual_text = false,
    lsp_codelens = true,
    lsp_cfg = {
        capabilities = capabilities,
        settings = {
            gopls = {
                buildFlags = { "-tags=component,integration" },
                ['local'] = "", -- sadly disable separate local import group.
                analyses = {
                    ST1003 = false,
                    fieldalignment = false,
                    unusedparams = false,
                    shadow = false,
                },
            },
        },
    },
})

vim.cmd [[augroup vimrc_go]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd BufWritePre *.go :silent! lua require('go.format').goimport()]]
vim.cmd [[augroup END]]

local utils = require('utils')
utils.keymap("n", "<Leader>gc", ":GoCoverage -f<CR>")
utils.keymap("n", "<Leader>gt", ":GoTest -f<CR>")
utils.keymap("n", "<Leader>gl", ":GoLint<CR>")
