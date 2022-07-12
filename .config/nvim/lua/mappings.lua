local utils = require('utils')

-- utils.keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>')
utils.keymap('n', '<BS>', '<c-^>')

utils.keymap('n', '<Leader>w', '<Esc>:w<CR>')
utils.keymap('n', '<Leader>q', '<Esc>:q<CR>')
utils.keymap('n', 'Q', '<Esc>:q<CR>')

utils.keymap("n", "<Leader>n", ":set number! number?<CR>")

-- Replace word under cursor
utils.keymap('n', '<Leader>sr', ':%s/<C-r><C-w>//g<Left><Left>')

-- buffer and tab nav
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

-- lsp
utils.keymap('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = false })
utils.keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
utils.keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
utils.keymap('n', '<Leader>d', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = false })
utils.keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.keymap('n', '<leader>le', '<cmd>lua vim.lsp.buf.declaration()<CR>')
utils.keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
utils.keymap('v', '<leader>lf', ':<C-u>call v:lua.vim.lsp.buf.range_formatting()<CR>')
utils.keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
utils.keymap('n', '<leader>lo', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
utils.keymap('n', '<Leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>')
utils.keymap('n', '<Leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.keymap('n', '<Leader>lce', '<cmd>lua vim.lsp.codelens.refresh()<CR>')
utils.keymap('n', '<Leader>lcr', '<cmd>lua vim.lsp.codelens.run()<CR>')

-- completion
utils.keymap('i', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true, noremap = false })
utils.keymap('s', '<C-j>', 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true, noremap = false })
utils.keymap('i', '<C-h>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-h>"', { expr = true, noremap = false })
utils.keymap('i', '<C-h>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-h>"', { expr = true, noremap = false })
utils.keymap('i', '<C-l>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-l>"', { expr = true, noremap = false })
utils.keymap('s', '<C-l>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<C-l>"', { expr = true, noremap = false })
utils.keymap('i', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', { expr = true, noremap = false })
utils.keymap('s', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', { expr = true, noremap = false })

-- Finding things
-- utils.keymap("n", "<Leader>c", "<cmd>:Clap<CR>")
utils.keymap("n", "<Leader>f", "<cmd>:Clap files ++finder=fd --type file --follow --hidden --exclude /.git --exclude /vendor<CR>")
utils.keymap("n", "<Leader>r", "<cmd>:Clap grep ++query=<cword><CR>")
-- clap
utils.keymap("n", "<Leader><Leader>", "<cmd>:Files<CR>")
utils.keymap("n", "<Leader>b", "<cmd>:Buffers<CR>")
utils.keymap("n", "<Leader>r", ":Rg <C-R><C-W><CR>")
