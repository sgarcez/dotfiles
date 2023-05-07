local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

require('go').setup({
    -- goimport = 'gopls', -- if set to 'gopls' will use golsp format
    gofmt = 'gopls', -- if set to gopls will use golsp format
    max_line_len = 120,
    tag_transform = false,
    test_dir = '',
    comment_placeholder = '',
    dap_debug = true,
    dap_debug_keymap = false,
    icons = true,
    textobjects = false,
    lsp_gofumpt = true,   -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = true, -- use on_attach from go.nvim
    lsp_keymaps = false,
    lsp_diag_virtual_text = true,
    lsp_codelens = true,
    lsp_cfg = {
        capabilities = cmp_nvim_lsp.default_capabilities(),
        settings = {
            gopls = {
                buildFlags = { "-tags=integration,dbintegration" },
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


local group = vim.api.nvim_create_augroup("vimgo", { clear = true })
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        group = group,
        pattern = { "*.go" },
        callback = function()
            require("go.format").goimport()
        end,
    }
)
vim.api.nvim_create_autocmd(
    "FileType",
    {
        group = group,
        pattern = { "go" },
        callback = function()
            vim.keymap.set("n", "<Leader>gc", ":GoCoverage -f<CR>")
            vim.keymap.set("n", "<Leader>gt", ":GoTest -f<CR>")
            vim.keymap.set("n", "<Leader>gb", ":GoBuild<CR>")
            vim.keymap.set("n", "<Leader>gl", ":GoLint<CR>")
        end,
    }
)
