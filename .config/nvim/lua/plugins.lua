return {
    { 'chaoren/vim-wordmotion', event = 'VeryLazy' },
    {
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
        'ggandor/flit.nvim',
        opts = { labeled_modes = 'nv' },
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
    },
    {
        'echasnovski/mini.surround',
        config = function()
            require('mini.surround').setup {}
        end,
        event = 'VeryLazy',
    },
    { 'romainl/vim-cool',       event = 'VeryLazy' },
    { 'wellle/targets.vim',     event = 'VeryLazy' },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'RRethy/nvim-treesitter-textsubjects',
            'RRethy/nvim-treesitter-endwise',
        },
        build = ':TSUpdate',
        event = 'VeryLazy',
        config = function()
            require("plugins.configs.treesitter")
        end,
    },
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets', lazy = false },
    {
        'lewis6991/hover.nvim',
        event = 'BufReadPost',
        config = function()
            require('hover').setup {
                init = function()
                    require 'hover.providers.lsp'
                end,
            }
            vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
            vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
        end,
    },
    {
        'DNLHC/glance.nvim',
        cmd = 'Glance',
        config = function()
            require('glance').setup {
                detached = true,
                border = { enable = true, top_char = '─', bottom_char = '─' },
                theme = { mode = 'brighten' },
                indent_lines = { icon = '│' },
                winbar = { enable = true },
            }
        end,
    },
    { 'neovim/nvim-lsp' },
    { 'neovim/nvim-lspconfig' },
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
    -- {
    --     'ojroques/nvim-lspfuzzy',
    --     config = function()
    --         require('lspfuzzy').setup {}
    --     end,
    -- },
    { 'kosayoda/nvim-lightbulb' },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- 'hrsh7th/vim-vsnip',
            -- 'hrsh7th/vim-vsnip-integ',
            -- 'hrsh7th/cmp-vsnip',
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
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("plugins.configs.nvimtree")
        end,
    },
    {
        'mfussenegger/nvim-dap',
        -- init = function()
        --     require 'config.dap_setup'
        -- end,
        -- config = function()
        --     require 'config.dap'
        -- end,
        dependencies = 'jbyuki/one-small-step-for-vimkind',
        cmd = { 'BreakpointToggle', 'Debug', 'DapREPL' },
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'nvim-dap',
        opts = {},
    },
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
        'beauwilliams/focus.nvim',
        opts = { excluded_filetypes = { 'toggleterm', 'TelescopePrompt' }, signcolumn = false },
        event = 'VeryLazy',
    },
    {
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
        event = 'VeryLazy',
    },
    {
        'simrat39/rust-tools.nvim',
        config = function()
            require("plugins.configs.rusttools")
        end,
    },
    { 'folke/lsp-colors.nvim' },
    {
        "folke/trouble.nvim",
        config = function()
            require("plugins.configs.trouble")
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end,
        event = "BufWinEnter",
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    { 'tpope/vim-vinegar' },
    { 'tpope/vim-surround' },
    { 'junegunn/vim-peekaboo' },
    -- {
    --     'phaazon/hop.nvim',
    --     branch = 'v2',
    --     config = function()
    --         require("plugins.configs.hop")
    --     end
    -- },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("plugins.configs.lualine")
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        event = "BufRead",
        config = function()
            require("plugins.configs.gitsigns")
        end,
    },
    { 'rhysd/conflict-marker.vim' },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
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
        -- init = function()
        -- require 'config.telescope_setup'
        -- end,
        config = function()
            require 'plugins.configs.telescope'
        end,
        cmd = 'Telescope',
    },
    {
        "rcarriga/nvim-notify",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("plugins.configs.glow")
        end,
    },
    { 'github/copilot.vim' },
}
