local opt = require'utils'.opt

opt('o', 'title', true)
opt('wo', 'number', false)
-- opt('wo', 'relativenumber', true)
opt('o', 'showmode', false)
opt('o', 'gdefault', true)
opt('wo', 'cursorline', true)
opt('o', 'smartcase', true)
opt('o', 'ignorecase', true)
opt('o', 'mouse', 'a')
opt('o', 'showmatch', true)
opt('o', 'startofline', false)
opt('o', 'timeoutlen', 1000)
opt('o', 'ttimeoutlen', 0)
opt('o', 'fileencoding', 'utf-8')
-- opt('wo', 'wrap', false)
opt('wo', 'linebreak', true)
opt('o', 'lazyredraw', true)
opt('o', 'hidden', true)
opt('o', 'inccommand', 'nosplit')
opt('o', 'exrc', true)
opt('o', 'secure', true)
opt('o', 'grepprg', 'rg --smart-case --color=never --no-heading -H -n --column')
opt('o', 'tagcase', 'smart')
opt('o', 'updatetime', 100)
opt('o', 'shortmess', vim.o.shortmess..'c')
opt('o', 'undofile', true)
opt('o', 'swapfile', false)
opt('o', 'backup', false)
opt('o', 'writebackup', false)
opt('o', 'breakindent', true)
opt('o', 'smartindent', true)
opt('o', 'expandtab', true)
-- opt('o', 'shiftwidth', 2)
-- opt('o', 'shiftround', true)
opt('o', 'scrolloff', 999)
opt('o', 'pyxversion', 3)
opt('o', 'matchtime', 0)
opt('o', 'switchbuf', 'uselast')
-- opt('o', 'signcolumn', 'auto:2')
opt('o', 'signcolumn', 'yes:1')

vim.cmd([[
set clipboard=unnamed "sets the default copy register to be *
set clipboard=unnamedplus "sets the default copy register to be +
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
]])

