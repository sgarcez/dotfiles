call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'haorenW1025/completion-nvim'
Plug 'terryma/vim-smooth-scroll'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'nelstrom/vim-visual-star-search'
Plug 'rhysd/clever-f.vim'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
" Plug 'lotabout/skim.vim'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
Plug 'rhysd/conflict-marker.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-vinegar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'wsdjeg/vim-lua'
Plug 'lifepillar/pgsql.vim'
Plug 'plasticboy/vim-markdown'
Plug 'mtdl9/vim-log-highlighting'
Plug 'rust-lang/rust.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'cideM/yui'
call plug#end()
