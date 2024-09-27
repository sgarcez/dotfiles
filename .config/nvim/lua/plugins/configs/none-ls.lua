local null_ls = require("null-ls")

null_ls.setup({
    on_attach = require("lsp").on_attach,
    update_in_insert = true,
    sources = {
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.markdownlint_cli2.with({
            args = { "$FILENAME" },
        }),
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.gofumpt,
        -- null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.golines,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.completion.luasnip,
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
    },
})
