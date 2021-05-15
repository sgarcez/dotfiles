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
opt('wo', 'wrap', false)
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

vim.api.nvim_exec([[
set clipboard=unnamed "sets the default copy register to be *
set clipboard=unnamedplus "sets the default copy register to be +
]], "")

vim.api.nvim_exec([[
" 'fatih/vim-go'
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 0
let g:go_metalinter_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'staticcheck', 'typecheck', 'unused', 'varcheck']
let g:go_metalinter_autosave = 0
let g:go_metalinter_deadline = '5s'
let g:go_metalinter_command = "golangci-lint"
let g:go_list_type = 'locationlist'
let g:go_jump_to_error = 0
]], "")
