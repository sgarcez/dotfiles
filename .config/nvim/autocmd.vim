augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

" Go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)

autocmd BufWritePre *.go lua go_organize_imports_sync(1000)
