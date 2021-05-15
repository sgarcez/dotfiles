local opt = require'utils'.opt

opt('o', 'termguicolors', true)
opt('o', 'background', 'dark')
opt('o', 'synmaxcol', 300)

vim.cmd[[filetype plugin indent on]]
vim.cmd[[syntax on]]

vim.cmd('colorscheme base16-ocean')
