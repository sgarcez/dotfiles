local packer = require("packer")
local use = packer.use

packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'tweekmonster/startuptime.vim' }
    use { "windwp/nvim-autopairs", }
    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("plugins.configs.treesitter").setup()
        end,
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'neovim/nvim-lsp' }
    use { 'neovim/nvim-lspconfig' }
    use { 'ojroques/nvim-lspfuzzy',
        config = function()
            require('lspfuzzy').setup {}
        end,
    }
    use { 'kosayoda/nvim-lightbulb' }
    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'hrsh7th/cmp-vsnip',
            "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-nvim-lua',
            "hrsh7th/cmp-buffer",
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-emoji',
        },
        config = function()
            require("plugins.configs.cmp")
        end,
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
    }
    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("plugins.configs.nvimtree")
        end,
    }
    use { "rcarriga/nvim-dap-ui", }
    use {
        'ray-x/go.nvim',
        requires = {
            'ray-x/guihua.lua',
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("plugins.configs.go")
        end,
    }
    use { 'rust-lang/rust.vim' }
    use {
        "folke/trouble.nvim",
        config = function()
            require("plugins.configs.trouble")
        end,
    }
    use { 'tpope/vim-vinegar' }
    use { 'tpope/vim-commentary' }
    use { 'junegunn/vim-peekaboo' }
    use { 'ggandor/lightspeed.nvim' }
    use { 'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins.configs.lualine").setup()
        end,
    }
    use { 'lewis6991/gitsigns.nvim',
        event = "BufRead",
        config = function()
            require("plugins.configs.gitsigns").setup()
        end,
    }
    use { 'rhysd/conflict-marker.vim' }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
        config = function()
            require("plugins.configs.telescope")
        end,
    }
    use {
        "rcarriga/nvim-notify",
        requires = { "nvim-telescope/telescope.nvim" },
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end,
        event = "BufWinEnter",
    }
    use {
        "ellisonleao/glow.nvim",
        config = function()
            require("plugins.configs.glow")
        end,
    }
end)
