vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    desc = "return cursor to where it was last time closing the file",
    pattern = "*",
    command = 'silent! normal! g`"zv',
})
