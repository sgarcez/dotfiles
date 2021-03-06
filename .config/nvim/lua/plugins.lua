local plugins = {}
-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

require("packer").startup(
    function()
        use {'wbthomason/packer.nvim', opt = true}
        use {'tweekmonster/startuptime.vim'}
        use {'fatih/vim-go', run = ':GoUpdateBinaries'}
        use {'rust-lang/rust.vim'}
        use {'neovim/nvim-lspconfig'}
        use {'neovim/nvim-lsp'}
        use {'ojroques/nvim-lspfuzzy'}
        use {'kosayoda/nvim-lightbulb'}
        use {'hrsh7th/vim-vsnip'}
        use {'hrsh7th/vim-vsnip-integ'}
        use {'hrsh7th/nvim-compe'}
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use {'nvim-treesitter/nvim-treesitter-textobjects'}
        use {'tpope/vim-commentary'}
        use {'tpope/vim-vinegar'}
        use {'rhysd/conflict-marker.vim'}
        use {'rhysd/clever-f.vim'}
        use {'junegunn/fzf.vim'}
        use {'junegunn/vim-peekaboo'}
        use {'nvim-lua/plenary.nvim'}
        use {'lewis6991/gitsigns.nvim'}
        use {'hoob3rt/lualine.nvim'}
    end
)
