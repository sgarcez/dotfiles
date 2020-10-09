local nvim_lsp = require'nvim_lsp'
local util = require 'nvim_lsp/util'

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
        matcher = "fuzzy",
        staticcheck = true,
        hoverKind = "SynopsisDocumentation",
        gofumpt = true,
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

nvim_lsp.rust_analyzer.setup{
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            completion = {
                addCallArgumentSnippets = false,
                addCallParenthesis = false,
            }
        }
    }
}

nvim_lsp.pyls.setup{}

nvim_lsp.intelephense.setup{}

-- Synchronously organise (Go) imports.
function go_organize_imports_sync(timeout_ms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, 't', true } }
  local params = vim.lsp.util.make_range_params()
  params.context = context

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result then return end
  result = result[1].result
  if not result then return end
  edit = result[1].edit
  vim.lsp.util.apply_workspace_edit(edit)
end
