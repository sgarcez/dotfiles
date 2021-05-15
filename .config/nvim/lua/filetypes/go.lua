local go = {}
local utils = require'utils'

vim.cmd [[augroup vimrc_go]]
  vim.cmd [[autocmd!]]
  vim.cmd [[autocmd FileType go lua sg.go.setup()]]
  vim.cmd [[autocmd BufWritePre *.go lua sg.go.format()]]
vim.cmd [[augroup END]]

function go.setup()
  vim.bo.expandtab = false
  vim.bo.tabstop = 4
  vim.bo.softtabstop = 4
  vim.bo.shiftwidth = 4
  utils.buf_keymap(0, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = false })
end

function go.format()
  vim.lsp.buf.formatting_sync()
  local params = vim.lsp.util.make_range_params()
  params.context  = { source = { organizeImports = true } }
  local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
  if not result then return end
  result = result[1].result
  if not result then return end
  vim.lsp.util.apply_workspace_edit(result[1].edit)
end

_G.sg.go = go
