local utils = require'utils'

utils.keymap("n", "<Esc><Esc>", ':nohlsearch<CR><Esc>')

utils.keymap("n", "<Leader>w", "<Esc>:w<CR>")
utils.keymap("n", "<Leader>q", "<Esc>:q<CR>")
utils.keymap("n", "Q", "<Esc>:q<CR>")

utils.keymap("n", "<Leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")

utils.keymap("n", "[b", ":bprevious<CR>")
utils.keymap("n", "]b", ":bnext<CR>")
utils.keymap("n", "[t", ":tabprevious<CR>")
utils.keymap("n", "]t", ":tabnext<CR>")
utils.keymap("n", "]c", ":GitGutterNextHunk<CR>")
utils.keymap("n", "[c", ":GitGutterPrevHunk<CR>")

utils.keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
utils.keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")

utils.keymap("n", "<c-j>", "<c-w>j")
utils.keymap("n", "<c-k>", "<c-w>k")
utils.keymap("n", "<c-l>", "<c-w>l")
utils.keymap("n", "<c-h>", "<c-w>h")

utils.keymap("n", "<Leader>hh", ":leftabove vsplit<CR>")
utils.keymap("n", "<Leader>ll", ":rightbelow vsplit<CR>")
utils.keymap("n", "<Leader>kk", ":leftabove split<CR>")
utils.keymap("n", "<Leader>jj", ":rightbelow split<CR>")
utils.keymap("n", "<Leader>tt", ":tab split<CR>")

utils.keymap("n", "<Leader>h<Enter>", ":leftabove  vnew<CR>:terminal<CR>:startinsert<CR>")
utils.keymap("n", "<Leader>l<Enter>", ":rightbelow vnew<CR>:terminal<CR>:startinsert<CR>")
utils.keymap("n", "<Leader>k<Enter>", ":leftabove  new<CR>:terminal<CR>:startinsert<CR>")
utils.keymap("n", "<Leader>j<Enter>", ":rightbelow new<CR>:terminal<CR>:startinsert<CR>")

vim.api.nvim_exec([[
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
au FileType go nmap <leader>t  <Plug>(go-test)
]], "")
