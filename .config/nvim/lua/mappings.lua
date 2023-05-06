vim.keymap.set('n', '<CR>', ':noh<CR><CR>')
vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>')

vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<BS>', '<c-^>')

vim.keymap.set('n', '<Leader>w', '<Esc>:w<CR>')
vim.keymap.set('n', '<Leader>q', '<Esc>:q<CR>')
vim.keymap.set('n', 'Q', '<Esc>:qa<CR>')

vim.keymap.set("n", "<Leader>n", ":set number! number?<CR>")

-- Replace word under cursor
vim.keymap.set('n', '<Leader>sr', ':%s/<C-r><C-w>//g<Left><Left>')

-- buffer and tabs
vim.keymap.set('n', '[b', ':bprevious<CR>')
vim.keymap.set('n', ']b', ':bnext<CR>')
vim.keymap.set('n', '[t', ':tabprevious<CR>')
vim.keymap.set('n', ']t', ':tabnext<CR>')

-- window movement
-- vim.keymap.set('n', '<c-j>', '<c-w>j')
-- vim.keymap.set('n', '<c-k>', '<c-w>k')
-- vim.keymap.set('n', '<c-l>', '<c-w>l')
-- vim.keymap.set('n', '<c-h>', '<c-w>h')

-- splits
vim.keymap.set('n', '<Leader>hh', ':leftabove vsplit<CR>')
vim.keymap.set('n', '<Leader>ll', ':rightbelow vsplit<CR>')
vim.keymap.set('n', '<Leader>kk', ':leftabove split<CR>')
vim.keymap.set('n', '<Leader>jj', ':rightbelow split<CR>')
vim.keymap.set('n', '<Leader>tt', ':tab split<CR>')

-- terminal
vim.keymap.set('n', '<Leader>h<Enter>', ':leftabove  vnew<CR>:terminal<CR>:startinsert<CR>')
vim.keymap.set('n', '<Leader>l<Enter>', ':rightbelow vnew<CR>:terminal<CR>:startinsert<CR>')
vim.keymap.set('n', '<Leader>k<Enter>', ':leftabove  new<CR>:terminal<CR>:startinsert<CR>')
vim.keymap.set('n', '<Leader>j<Enter>', ':rightbelow new<CR>:terminal<CR>:startinsert<CR>')
