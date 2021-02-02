autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.go lua go_organize_imports_sync(1000)

autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd CursorMoved <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
