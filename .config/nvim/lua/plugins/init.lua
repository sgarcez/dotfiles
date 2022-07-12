local packer = require("packer")
local use = packer.use

packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'tweekmonster/startuptime.vim' }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require("plugins.configs.treesitter").setup() end }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }

    use { 'neovim/nvim-lsp' }
    use { 'neovim/nvim-lspconfig' }
    use { 'ojroques/nvim-lspfuzzy' }
    use { 'rhysd/conflict-marker.vim' }
    use { 'kosayoda/nvim-lightbulb' }

    use { 'nvim-lua/plenary.nvim' }
    use { 'jose-elias-alvarez/null-ls.nvim' }

    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

    use { 'rust-lang/rust.vim' }

    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }

    use { 'tpope/vim-vinegar' }
    use { 'tpope/vim-commentary' }
    use { 'junegunn/vim-peekaboo' }
    use { 'junegunn/fzf.vim', config = function() require("plugins.configs.fzf").setup() end }
    use { 'ggandor/lightspeed.nvim' }

    use { 'lewis6991/gitsigns.nvim', config = function() require("plugins.configs.gitsigns").setup() end }
    use { 'nvim-lualine/lualine.nvim', config = function() require("plugins.configs.lualine").setup() end }
end)
