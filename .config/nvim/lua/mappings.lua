local utils = require('utils')

utils.keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>')

utils.keymap('n', '<Leader>w', '<Esc>:w<CR>')
utils.keymap('n', '<Leader>q', '<Esc>:q<CR>')
utils.keymap('n', 'Q', '<Esc>:q<CR>')

utils.keymap('n', '<Leader>sr', ':%s/<C-r><C-w>//g<Left><Left>')

utils.keymap("n", "<Leader>n", ":set number! number?<CR>")

utils.keymap('n', '[b', ':bprevious<CR>')
utils.keymap('n', ']b', ':bnext<CR>')
utils.keymap('n', '[t', ':tabprevious<CR>')
utils.keymap('n', ']t', ':tabnext<CR>')

utils.keymap('n', '<c-j>', '<c-w>j')
utils.keymap('n', '<c-k>', '<c-w>k')
utils.keymap('n', '<c-l>', '<c-w>l')
utils.keymap('n', '<c-h>', '<c-w>h')

utils.keymap('n', '<Leader>hh', ':leftabove vsplit<CR>')
utils.keymap('n', '<Leader>ll', ':rightbelow vsplit<CR>')
utils.keymap('n', '<Leader>kk', ':leftabove split<CR>')
utils.keymap('n', '<Leader>jj', ':rightbelow split<CR>')
utils.keymap('n', '<Leader>tt', ':tab split<CR>')

utils.keymap('n', '<BS>', '<c-^>')

utils.keymap('n', '<Leader>h<Enter>', ':leftabove  vnew<CR>:terminal<CR>:startinsert<CR>')
utils.keymap('n', '<Leader>l<Enter>', ':rightbelow vnew<CR>:terminal<CR>:startinsert<CR>')
utils.keymap('n', '<Leader>k<Enter>', ':leftabove  new<CR>:terminal<CR>:startinsert<CR>')
utils.keymap('n', '<Leader>j<Enter>', ':rightbelow new<CR>:terminal<CR>:startinsert<CR>')

utils.keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
utils.keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
utils.keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = false })
utils.keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.declaration()<CR>')
utils.keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.keymap('n', '<leader>lh',  '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.keymap('v', '<leader>lf', ':<C-u>call v:lua.vim.lsp.buf.range_formatting()<CR>')
utils.keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
utils.keymap('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
utils.keymap('n', '<Leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.keymap('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- completion
utils.keymap('i', '<C-l>', 'v:lua.sg.completion.tab_completion()', { expr = true, noremap = false })
utils.keymap('s', '<C-l>', 'vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<TAB>"', { expr = true, noremap = false })
utils.keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })
utils.keymap("i", "<CR>", "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })

-- fzf
utils.keymap("n", "<Leader><Leader>", "<cmd>:Files<CR>")
utils.keymap("n", "<Leader>a", "<cmd>:Buffers<CR>")
utils.keymap("n", "<Leader>r", ":Rg <C-R><C-W><CR>")
utils.keymap("n", "<Leader>c", ":BCommits<CR>")
