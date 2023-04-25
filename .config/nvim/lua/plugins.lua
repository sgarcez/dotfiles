return {

    -- moving
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end,
        event = "BufWinEnter",
    },
    {
        -- type 2 first chars + label char
        'ggandor/leap.nvim',
        event = 'VeryLazy',
        dependencies = 'tpope/vim-repeat',
        config = function()
            local map = vim.api.nvim_set_keymap
            -- 2-character Sneak (default)
            local opts = { noremap = false }
            map('n', 'z', '<Plug>(leap-forward-x)', opts)
            map('n', 'Z', '<Plug>(leap-backward-x)', opts)

            -- visual-mode
            map('x', 'z', '<Plug>(leap-forward-x)', opts)
            map('x', 'Z', '<Plug>(leap-backward-x)', opts)

            -- operator-pending-mode
            map('o', 'z', '<Plug>(leap-forward-x)', opts)
            map('o', 'Z', '<Plug>(leap-backward-x)', opts)
        end,
    },
    {
        -- single key search, overrides f, t, F, T
        'ggandor/flit.nvim',
        opts = { labeled_modes = 'nv' },
    },
    {
        -- auto enabled and disable search highlighting
        'romainl/vim-cool',
        event = 'VeryLazy'
    },
    -- { 'chaoren/vim-wordmotion', event = 'VeryLazy' },
    -- {
    --     -- textobjects that expand on e.g. di'
    --     'wellle/targets.vim',
    --     event = 'VeryLazy'
    -- },


    -- navigating
    { 'tpope/vim-vinegar' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'crispgm/telescope-heading.nvim',
        },
        config = function()
            require 'plugins.configs.telescope'
        end,
        cmd = 'Telescope',
    },

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-textsubjects',
            'RRethy/nvim-treesitter-endwise',
        },
        build = ':TSUpdate',
        -- event = 'VeryLazy',
        config = function()
            require("plugins.configs.treesitter")
        end,
    },

    -- snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets', lazy = false },

    -- completions
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-nvim-lua',
            "hrsh7th/cmp-buffer",
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'saadparwaiz1/cmp_luasnip',
            'doxnit/cmp-luasnip-choice',
        },
        config = function()
            require("plugins.configs.cmp")
        end,
        event = 'InsertEnter',
    },
    { "jose-elias-alvarez/null-ls.nvim" },


    -- LSP / Diagnostics
    { 'neovim/nvim-lsp' },
    { 'neovim/nvim-lspconfig' },
    { 'folke/lsp-colors.nvim' },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'jayp0521/mason-null-ls.nvim',
        },
        config = function()
            require("plugins.configs.mason")
        end,
    },
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup()
        end

    },
    { 'kosayoda/nvim-lightbulb' },
    {
        "folke/trouble.nvim",
        config = function()
            require("plugins.configs.trouble")
        end,
    },

    -- langs
    {
        'ray-x/go.nvim',
        dependencies = {
            'ray-x/guihua.lua',
            'mfussenegger/nvim-dap',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require 'plugins.configs.go'
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
    },
    {
        'simrat39/rust-tools.nvim',
        config = function()
            require("plugins.configs.rusttools")
        end,
    },

    -- UI
    {
        -- hover UI for messages, cmdline and the popupmenu
        'folke/noice.nvim',
        opts = {
            views = { mini = { lang = 'markdown' } },
            routes = {
                {
                    filter = {
                        event = 'msg_show',
                        kind = '',
                        find = 'written',
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = 'lsp',
                        kind = 'progress',
                        find = 'null-l',
                    },
                    opts = { skip = true, stop = true },
                },
                -- {
                --     view = 'notify',
                --     filter = { event = 'msg_showmode' },
                -- },
            },
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = true,
            },
        },
        dependencies = { 'MunifTanjim/nui.nvim' },
    },
    {
        "rcarriga/nvim-notify",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("plugins.configs.nvimtree")
        end,
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = 'jbyuki/one-small-step-for-vimkind',
        cmd = { 'BreakpointToggle', 'Debug', 'DapREPL' },
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'nvim-dap',
        opts = {},
    },
    {
        -- better quickfix with previews
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
    },


    -- comments
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- registers
    { 'junegunn/vim-peekaboo' },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins.configs.lualine")
        end,
    },

    -- git
    {
        'lewis6991/gitsigns.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        event = "BufRead",
        config = function()
            require("plugins.configs.gitsigns")
        end,
    },
    { 'rhysd/conflict-marker.vim' },


    -- markdown previews
    {
        'ellisonleao/glow.nvim',
        config = function()
            require("plugins.configs.glow")
        end,
    },

    -- pairs
    {
        -- add/replace surrounding pair e.g sr'", sa(
        'echasnovski/mini.surround',
        config = function()
            require('mini.surround').setup {}
        end,
        event = 'VeryLazy',
    },

    { 'github/copilot.vim' },

}
