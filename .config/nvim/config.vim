let g:mapleader = ";"

" set shada="NONE"        " Prevent SHADA files from being generated or read
set autoread              " Reload files that have not been modified
set nonumber
set norelativenumber
set noswapfile            " Disable creation of *.swp files
set nobackup              " no backup files
set nowritebackup         " only in case you don't want a backup file while editing
set undofile              " Enable undo persistence across sessions
set lazyredraw            " Speed up on large files
set showcmd               " Show (partial) command in status line.
set ruler                 " Show the line and column numbers of the cursor.
set mouse=a
set showmatch             " Highlight matching braces
" set scrolloff=999         " Keep the cursor centered in the screen
set clipboard=unnamed,unnamedplus
set updatetime=100
set encoding=utf-8
set autoindent          " Copy indent from current line when starting a new line
set noerrorbells        " No beeps
" Indentation
set expandtab     " replace <Tab> with spaces
set tabstop=4     " number of spaces that a <Tab> in the file counts for
set softtabstop=4 " remove <Tab> symbols as spaces
set shiftwidth=4  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
" Search
set hlsearch   " Highlight results
set ignorecase " Ignore casing of searches
set incsearch  " Start showing results as you type
set inccommand=nosplit
set smartcase  " Override the 'ignorecase' when there is uppercase letters
" Colours
set termguicolors

set background=dark
colorscheme base16-ocean

set signcolumn=yes
" Wildmenu
set wildmenu
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp
set wildmode=list:longest,full
set completeopt=menuone,noinsert,noselect " Completion
" set shortmess+=c " Avoid showing message extra message when using completion

" Disable some providers
let g:loaded_python3_provider = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_node_provider = 0

" Disable some in built plugins completely
" let g:loaded_netrw            = 1
" let g:loaded_netrwPlugin      = 1
let g:loaded_matchparen       = 1
let g:loaded_matchit          = 1
let g:loaded_2html_plugin     = 1
let g:loaded_getscriptPlugin  = 1
let g:loaded_gzip             = 1
let g:loaded_logipat          = 1
let g:loaded_rrhelper         = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin        = 1
let g:loaded_vimballPlugin    = 1
let g:loaded_zipPlugin        = 1

" PLUGINS
" 'fatih/vim-go'
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 0
" let g:go_fmt_command = "gofumports"
let g:go_metalinter_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'staticcheck', 'typecheck', 'unused', 'varcheck']
let g:go_metalinter_autosave = 0
let g:go_metalinter_deadline = '5s'
let g:go_metalinter_command = "golangci-lint"
let g:go_list_type = 'locationlist'
let g:go_jump_to_error = 0
" let g:go_auto_type_info = 1

"'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
"'itchyny/lightline.vim'
" let g:lightline = {'colorscheme': 'ayu_dark', 'component': { 'filename': '%F'}}
" let g:lightline = {'colorscheme': 'ayu_mirage', 'component': { 'filename': '%F'}}
" let g:lightline = {'colorscheme': 'solarized', 'component': { 'filename': '%F'}}
let g:lightline = {'colorscheme': 'one', 'component': { 'filename': '%F'}}
let g:lightline.tabline = {'left': [['tabs']], 'right': []}

"'junegunn/fzf.vim'
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
" let g:fzf_colors =
" \ { "fg":      ["fg", "Normal"],
"   \ "bg":      ["bg", "Normal"],
"   \ "hl":      ["fg", "IncSearch"],
"   \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
"   \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
"   \ "hl+":     ["fg", "IncSearch"],
"   \ "info":    ["fg", "IncSearch"],
"   \ "border":  ["fg", "Ignore"],
"   \ "prompt":  ["fg", "Comment"],
"   \ "pointer": ["fg", "IncSearch"],
"   \ "marker":  ["fg", "IncSearch"],
"   \ "spinner": ["fg", "IncSearch"],
"   \ "header":  ["fg", "WildMenu"] }

"'airblade/vim-gitgutter'
"let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_max_signs=1000
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_use_location_list = 0
" let g:gitgutter_sign_added = '+a'
" let g:gitgutter_sign_modified = '+m'
" let g:gitgutter_sign_removed = '-r'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_modified_removed = 'mr'

"'junegunn/goyo.vim'
let g:goyo_width=150


"'github.com/wfxr/minimap.vim'
let g:minimap_auto_start=0
hi MinimapCurrentLine ctermfg=Green guifg=#50FA7B
let g:minimap_highlight = 'MinimapCurrentLine'

" Neovim LSP Diagnostics
let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_show_sign = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
let g:diagnostic_level = 'Hint'

" 'haorenW1025/completion-nvim'
let g:completion_enable_auto_popup = 1
" let g:completion_enable_auto_paren = 1
let g:completion_auto_change_source = 1
let g:completion_matching_ignore_case = 1
let g:completion_trigger_character = ['.', '::']
let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'vim-vsnip'

let s:lsp_chain_config = [
  \   {'complete_items': ['lsp', 'snippet']},
  \   {'mode': '<c-p>'},
  \   {'mode': '<c-n>'},
  \   {'mode': 'file'},
  \ ]
let g:completion_chain_complete_list = {
  \ 'go' : s:lsp_chain_config,
  \ 'rust' : s:lsp_chain_config,
  \ 'default' : [
  \     {'mode': '<c-p>'},
  \     {'mode': '<c-n>'},
  \     {'mode': 'file'},
  \ ]
  \ }

