local packer = require("packer")
local use = packer.use

packer.startup(function()
    use {'neovim/nvim-lspconfig'}
    use {'wbthomason/packer.nvim', opt = true}
    use {'tweekmonster/startuptime.vim'}
    use {'fatih/vim-go', run = ':GoUpdateBinaries'}
    use {'rust-lang/rust.vim'}
    use {'neovim/nvim-lsp'}
    use {'ojroques/nvim-lspfuzzy'}
    use {'kosayoda/nvim-lightbulb'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/nvim-cmp'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("plugins.configs.treesitter").setup()
        end
    }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-vinegar'}
    use {'rhysd/conflict-marker.vim'}
    use {
        'junegunn/fzf.vim',
        config = function()
            require("plugins.configs.fzf").setup()
        end
    }
    use {'junegunn/vim-peekaboo'}
    use {'nvim-lua/plenary.nvim'}
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("plugins.configs.gitsigns").setup()
        end
    }
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require("plugins.configs.lualine").setup()
        end
    }
    use {'ggandor/lightspeed.nvim'}
    use {
        'karb94/neoscroll.nvim',
        config = function()
            require("plugins.configs.neoscroll").setup()
        end
    }
end)
