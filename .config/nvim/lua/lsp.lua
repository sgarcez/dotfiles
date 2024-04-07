local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    if client.name == "gopls" then
        local augroup = vim.api.nvim_create_augroup("LspOrganizeImports", {})
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" } }
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
                for cid, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                            vim.lsp.util.apply_workspace_edit(r.edit, enc)
                        end
                    end
                end
                vim.lsp.buf.format({ async = false })
            end,
        })
    else
        if client.supports_method("textDocument/formatting") then
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end
end

-- local capabilities = lspconfig.capabilities
-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            buildFlags = { "-tags=integration,dbintegration,vpn_integration" },
            gofumpt = false,
            ["local"] = "", -- sadly disable separate local import group.
            analyses = {
                ST1003 = false,
                fieldalignment = false,
                unusedparams = false,
                shadow = false,
            },
            codelenses = {
                gc_details = true,
                generate = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
        },
    },
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
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

lspconfig.helm_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["helm-ls"] = {
            yamlls = {
                path = "yaml-language-server",
            },
        },
    },
})

lspconfig.yamlls.setup({})

lspconfig.terraformls.setup({})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- diagnostics

local sign_define = vim.fn.sign_define
sign_define("DiagnosticSignError", { text = "", numhl = "RedSign" })
sign_define("DiagnosticSignWarn", { text = "", numhl = "YellowSign" })
sign_define("DiagnosticSignInfo", { text = "", numhl = "WhiteSign" })
sign_define("DiagnosticSignHint", { text = "", numhl = "BlueSign" })

vim.diagnostic.config({
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    virtual_lines = { only_current_line = true },
    virtual_text = {
        spacing = 4,
        source = "always",
        prefix = "∎",
    },
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
        scope = "cursor",
        wrap = true,
        max_width = 80,
    },
})

-- handlers

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
})

-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with({
    vim.lsp.handlers.signatureHelp,
    { border = "rounded" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with({
    vim.lsp.handlers.hover,
    { border = "rounded" },
})

return {
    capabilities = capabilities,
    on_attach = on_attach,
}
