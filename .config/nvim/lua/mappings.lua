local utils = require('utils')

-- utils.keymap('n', '<CR>', ':noh<CR><CR>')
-- utils.keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>')

utils.keymap('t', '<leader><Esc>', '<C-\\><C-n>')

utils.keymap('n', '<BS>', '<c-^>')

utils.keymap('n', '<Leader>w', '<Esc>:w<CR>')
utils.keymap('n', '<Leader>q', '<Esc>:q<CR>')
utils.keymap('n', 'Q', '<Esc>:qa<CR>')

utils.keymap("n", "<Leader>n", ":set number! number?<CR>")

-- Replace word under cursor
utils.keymap('n', '<Leader>sr', ':%s/<C-r><C-w>//g<Left><Left>')

-- buffer and tabs
utils.keymap('n', '[b', ':bprevious<CR>')
utils.keymap('n', ']b', ':bnext<CR>')
utils.keymap('n', '[t', ':tabprevious<CR>')
utils.keymap('n', ']t', ':tabnext<CR>')

-- window movement
utils.keymap('n', '<c-j>', '<c-w>j')
utils.keymap('n', '<c-k>', '<c-w>k')
utils.keymap('n', '<c-l>', '<c-w>l')
utils.keymap('n', '<c-h>', '<c-w>h')

-- splits
utils.keymap('n', '<Leader>hh', ':leftabove vsplit<CR>')
utils.keymap('n', '<Leader>ll', ':rightbelow vsplit<CR>')
utils.keymap('n', '<Leader>kk', ':leftabove split<CR>')
utils.keymap('n', '<Leader>jj', ':rightbelow split<CR>')
utils.keymap('n', '<Leader>tt', ':tab split<CR>')

-- terminal
utils.keymap('n', '<Leader>h<Enter>', ':leftabove  vnew<CR>:terminal<CR>:startinsert<CR>')
utils.keymap('n', '<Leader>l<Enter>', ':rightbelow vnew<CR>:terminal<CR>:startinsert<CR>')
utils.keymap('n', '<Leader>k<Enter>', ':leftabove  new<CR>:terminal<CR>:startinsert<CR>')
utils.keymap('n', '<Leader>j<Enter>', ':rightbelow new<CR>:terminal<CR>:startinsert<CR>')


utils.keymap('n', '<Leader>a', ':NvimTreeFindFileToggle<CR>')
