local nvim_lsp = require'nvim_lsp'

vim.api.nvim_command [[autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()]]
vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.util.show_line_diagnostics()]]

local custom_on_attach = function()
    require'diagnostic'.on_attach()
    require'completion'.on_attach({
        sorter = 'alphabet',
        matcher = {'exact', 'fuzzy'}
    })
end

nvim_lsp.gopls.setup{
    on_attach = custom_on_attach,
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        linkTarget = "pkg.go.dev",
        completionDocumentation = true,
        deepCompletion = true,
        fuzzyMatching = true,
        staticcheck = true,
        hoverKind = "SynopsisDocumentation",
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

nvim_lsp.rust_analyzer.setup{}

nvim_lsp.pyls.setup{
    cmd = { "/home/sgarcez/pyls-venv/bin/pyls" }
}

require'nvim_lsp'.intelephense.setup{}

-- -- organize imports sync
-- function go_org_imports(options, timeout_ms)
--   local context = { source = { organizeImports = true } }
--   vim.validate { context = { context, 't', true } }
--   local params = vim.lsp.util.make_range_params()
--   params.context = context

--   local results = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
--   print(vim.inspect(result))
--   if not result then return end
--   vim.lsp.util.apply_text_edits(result[1].result)

--   -- local params = vim.lsp.util.make_formatting_params(options)
--   -- local result = vim.lsp.buf_request_sync(0, "textDocument/formatting", params, timeout_ms)
--   -- if not result then return end
--   -- result = result[1].result
--   -- vim.lsp.util.apply_text_edits(result)
-- end

-- vim.api.nvim_command("au BufWritePre *.go lua go_org_imports({}, 1000)")
