local plugins = {}
-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

require("packer").startup(
    function()
        use {'wbthomason/packer.nvim', opt = true}
        use {"tweekmonster/startuptime.vim"}
        use {'neovim/nvim-lspconfig'}
        use {'neovim/nvim-lsp'}
        use {'ojroques/nvim-lspfuzzy'}
	use {'folke/lsp-colors.nvim'}
        use {'hrsh7th/vim-vsnip'}
        use {'hrsh7th/vim-vsnip-integ'}
        use {'hrsh7th/nvim-compe'}
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use {'kassio/neoterm'}
        use {'tpope/vim-surround'}
        use {'tpope/vim-commentary'}
        use {'tpope/vim-vinegar'}
        use {'tpope/vim-fugitive'}
	use {'airblade/vim-gitgutter'}
        use {'rhysd/git-messenger.vim'}
        use {'rhysd/conflict-marker.vim'}
        use {'rhysd/clever-f.vim'}
        use {'junegunn/fzf.vim'}
        use {'junegunn/vim-peekaboo'}
        use {'fatih/vim-go', run = ':GoUpdateBinaries'}
        use {'rust-lang/rust.vim'}
        use {
            'glepnir/galaxyline.nvim',
            branch = 'main',
            requires = {'kyazdani42/nvim-web-devicons'}
        }
    end
)

require('lspfuzzy').setup{}
