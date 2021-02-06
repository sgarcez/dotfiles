let g:mapleader = ";"

set autoread              " Reload files that have not been modified
set number
set norelativenumber
set so=999
set noswapfile            " Disable creation of *.swp files
set nobackup              " no backup files
set nowritebackup         " only in case you don't want a backup file while editing
set undofile              " Enable undo persistence across sessions
set lazyredraw            " Speed up on large files
set showcmd               " Show (partial) command in status line.
set ruler                 " Show the line and column numbers of the cursor.
set mouse=a
set showmatch             " Highlight matching braces
set clipboard=unnamed,unnamedplus
set updatetime=100
set encoding=utf-8
set autoindent
set noerrorbells
set signcolumn=auto:2
set expandtab             " replace <Tab> with spaces
set tabstop=4             " number of spaces that a <Tab> in the file counts for
set softtabstop=4         " remove <Tab> symbols as spaces
set shiftwidth=4          " indent size for << and >>
set shiftround            " round indent to multiple of 'shiftwidth' (for << and >>)

" Search
set hlsearch              " Highlight results
set ignorecase            " Ignore casing of searches
set smartcase             " Override the 'ignorecase' when there is uppercase letters
set incsearch             " Start showing results as you type
set inccommand=nosplit

" Colours
set termguicolors
set background=dark
colorscheme base16-ocean

" Wildmenu
set wildmenu
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp
set wildmode=list:longest,full
set completeopt=menu,menuone,noselect

setlocal spell spelllang=en_gb

" PLUGINS

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

"'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>

"'itchyny/lightline.vim'
let g:lightline = {'colorscheme': 'one', 'component': { 'filename': '%F'}}
let g:lightline.tabline = {'left': [['tabs']], 'right': []}

"'junegunn/fzf.vim'
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

"'airblade/vim-gitgutter'
let g:gitgutter_max_signs=1000
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_use_location_list = 0

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
