call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'haorenW1025/completion-nvim'
Plug 'terryma/vim-smooth-scroll'
Plug 'itchyny/lightline.vim'
" Text Object plugins
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
" Show leader key bindings
" Toggle terminal
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
" Inline git blame
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'
" distraction free
Plug 'junegunn/goyo.vim'
" Plug 'scrooloose/nerdtree'	
Plug 'tpope/vim-vinegar'
" Syntax highlighting support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'wsdjeg/vim-lua'
Plug 'elzr/vim-json'
Plug 'lifepillar/pgsql.vim'
Plug 'plasticboy/vim-markdown'
Plug 'mtdl9/vim-log-highlighting'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'wellle/tmux-complete.vim'
call plug#end()
