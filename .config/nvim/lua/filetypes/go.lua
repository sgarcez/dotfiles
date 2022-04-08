local M = {}
local utils = require'utils'

vim.cmd [[augroup vimrc_go]]
  vim.cmd [[autocmd!]]
  vim.cmd [[autocmd FileType go lua require("filetypes.go").setup()]]
  vim.cmd [[autocmd BufWritePre *.go :silent! lua require("filetypes.go").vim.lsp.buf.formatting()]]
  vim.cmd [[autocmd BufWritePre *.go :silent! lua require("filetypes.go").org_imports(2000)]]
vim.cmd [[augroup END]]

function M.setup()
   -- 'fatih/vim-go'
  vim.cmd([[
      let g:go_gopls_enabled = 0
      let g:go_def_mapping_enabled = 0
      let g:go_doc_keywordprg_enabled = 0
      let g:go_textobj_enabled = 0
      let g:go_fmt_autosave = 0
      let g:gho_metalinter_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'staticcheck', 'typecheck', 'unused', 'varcheck']
      let g:go_metalinter_autosave = 0
      let g:go_metalinter_deadline = '5s'
      let g:go_metalinter_command = "golangci-lint"
      let g:go_list_type = 'locationlist'
      let g:go_jump_to_error = 0
  ]])

  vim.bo.expandtab = false
  vim.bo.tabstop = 4
  vim.bo.softtabstop = 4
  vim.bo.shiftwidth = 4
  utils.buf_keymap(0, 'n', '<leader>gt', '<cmd>GoTest<CR>', { noremap = false })
  utils.buf_keymap(0, 'n', '<leader>gb', '<cmd>GoBuild<CR>', { noremap = false })
end

function M.org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

return M
