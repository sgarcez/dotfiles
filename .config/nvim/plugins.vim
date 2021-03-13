call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-compe'
Plug 'kassio/neoterm'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim', { 'on': 'GitMessenger' }
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/clever-f.vim'
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy', {'branch': 'main'}
Plug 'junegunn/vim-peekaboo'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'terryma/vim-smooth-scroll'
Plug 'itchyny/lightline.vim'
call plug#end()
