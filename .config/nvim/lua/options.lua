local cmd = vim.cmd
local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = { 'utf-8' }
opt.backup = false -- no .bak
opt.swapfile = false -- no .swap
opt.undofile = true -- use undo file
opt.updatetime = 100 -- time (in ms) to write to swap file

opt.expandtab = true -- expand tab
opt.tabstop = 4 -- tab stop
opt.softtabstop = 4 -- soft tab stop
opt.autoindent = true -- auto indent for new line
opt.shiftwidth = 4 -- auto indent shift width

opt.number = false
opt.relativenumber = false

opt.backspace = { 'indent', 'eol', 'start' } -- backspace behaviors
opt.list = false -- hide whitespace chars
opt.ignorecase = false -- search with no ignore case
opt.smartcase = false
opt.hlsearch = true -- highlight search
opt.incsearch = false -- no incremental search
opt.inccommand = 'nosplit' -- live substitute preview
opt.completeopt = { 'menuone', 'noselect' }
opt.pumheight = 15 -- maximum number of items to show in the completion popup
opt.hidden = true
opt.cursorline = true -- show cursor line
opt.ruler = true -- show ruler line
opt.signcolumn = 'yes:1' -- show sign column (column of the line number)
opt.mouse = 'nv' -- enable mouse under normal and visual mode
cmd('set mousehide') -- hide mouse when characters are typed
opt.showmatch = true -- show bracket match
opt.cmdheight = 1 -- height of :command line
opt.wildmenu = true -- wildmenu, auto complete for commands
opt.wildmode = { 'longest', 'full' }
opt.shortmess:append('c') -- status line e.g. CTRL+G

opt.startofline = false
opt.timeoutlen = 1000
opt.ttimeoutlen = 0
opt.lazyredraw = true
opt.grepprg = 'rg --smart-case --color=never --no-heading -H -n --column'
opt.scrolloff = 999

cmd('set clipboard=unnamed') -- sets the default copy register to be *
cmd('set clipboard=unnamedplus') --  sets the default copy register to be +
cmd('set foldmethod=expr')
cmd('set foldexpr=nvim_treesitter#foldexpr()')
cmd('set nofoldenable')

-- colorscheme
opt.termguicolors = true
opt.background = 'dark'
opt.synmaxcol =  300
cmd('filetype plugin indent on')
cmd('syntax on')
cmd('colorscheme base16-ocean')

-- completion
local ignores = {
  '*.o',
  '*.obj,*~',
  '*.git*',
  '*vim/backups*',
  '*mypy_cache*',
  '*__pycache__*',
  '*cache*',
  '*logs*',
  'log/**',
  'tmp/**',
}
vim.opt.wildignore =  table.concat(ignores, ',')
