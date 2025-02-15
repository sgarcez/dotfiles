local opt = vim.opt

vim.g.mapleader = ";"

opt.undofile = true   -- use undo file
opt.updatetime = 100  -- time (in ms) to write to swap file
opt.expandtab = true  -- expand tab
opt.tabstop = 4       -- tab stop
opt.softtabstop = 4   -- soft tab stop
opt.autoindent = true -- auto indent for new line
opt.shiftwidth = 4    -- auto indent shift width
opt.number = false
opt.relativenumber = false
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.joinspaces = false
opt.previewheight = 5
opt.display = "msgsep"
opt.ignorecase = true      -- search with ignore case
opt.smartcase = false
opt.hlsearch = true        -- highlight search
opt.incsearch = false      -- no incremental search
opt.inccommand = "nosplit" -- live substitute preview
opt.completeopt = { "menu", "menuone", "noselect", "preview" }
opt.pumheight = 15         -- maximum number of items to show in the completion popup
opt.hidden = true
opt.cursorline = false     -- show cursor line
opt.modeline = false
opt.ruler = true           -- show ruler line
opt.signcolumn = "yes:1"   -- show sign column (column of the line number)
-- opt.iskeyword:append("-")  -- consider string-string as whole word
opt.showmatch = true       -- show bracket match
opt.cmdheight = 0          -- height of :command line
opt.shortmess:append({ s = true, I = true, W = true, F = true })
-- completion
opt.wildignore = { "*.o", "*~", "*.pyc" }
opt.wildmode = { "longest", "full" }
opt.wildmenu = true -- wildmenu, auto complete for commands
-- mouse
opt.mouse = "nivh"
-- scroll
opt.startofline = false
opt.timeoutlen = 500
opt.grepprg = "rg --smart-case --color=never --no-heading -H -n --column"
opt.scrolloff = 999
-- clipboard
vim.opt.clipboard = "unnamed"
-- folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false
-- colorscheme
opt.termguicolors = true
opt.background = "dark"
opt.synmaxcol = 300

opt.fillchars = {
    horiz     = '━',
    horizup   = '┻',
    horizdown = '┳',
    vert      = '┃',
    vertleft  = '┫',
    vertright = '┣',
    verthoriz = '╋',
    diff      = '╱',
}
