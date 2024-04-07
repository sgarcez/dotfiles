return {

    -- moving
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 600
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = require("plugins.configs.flash").opts,
        keys = require("plugins.configs.flash").keys,
    },
    {
        -- auto enable and disable search highlighting
        "romainl/vim-cool",
        event = "VeryLazy",
    },

    -- navigation
    { "christoomey/vim-tmux-navigator" },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "crispgm/telescope-heading.nvim",
        },
        config = function()
            require("plugins.configs.telescope")
        end,
        cmd = "Telescope",
    },
    {
        "stevearc/oil.nvim",
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "RRethy/nvim-treesitter-textsubjects",
        },
        build = ":TSUpdate",
        config = function()
            require("plugins.configs.treesitter")
        end,
    },

    -- split/join args
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            use_default_keymaps = false,
            max_join_length = 200,
        },
    },

    -- snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets",  lazy = false },

    -- completions
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdLineEnter" },
        -- event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "saadparwaiz1/cmp_luasnip",
            "doxnit/cmp-luasnip-choice",
        },
        config = function()
            require("plugins.configs.cmp")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            require("plugins.configs.none-ls")
        end,
        dependencies = {
            "gbprod/none-ls-shellcheck.nvim",
        },
    },

    -- LSP / Diagnostics
    { "neovim/nvim-lsp" },
    { "neovim/nvim-lspconfig" },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-null-ls.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("plugins.configs.mason")
        end,
    },
    {
        "j-hui/fidget.nvim",
    },
    {
        "folke/trouble.nvim",
        opts = {
            mode = "document_diagnostics",
            auto_open = false,
            auto_close = true,
            icons = false,
        },
    },

    -- langs
    {
        "simrat39/rust-tools.nvim",
        opts = require("plugins.configs.rusttools"),
    },
    {
        "towolf/vim-helm",
        ft = "helm",
    },

    -- Test runners
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-go",
        },
        config = function()
            require("plugins.configs.neotest")
        end,
    },

    -- UI
    {
        -- hover UI for messages, cmdline and the popupmenu
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = require("plugins.configs.noice"),
    },
    {
        "folke/zen-mode.nvim",
    },
    {
        "rcarriga/nvim-notify",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    {
        -- better quickfix with previews
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },

    -- debugger
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "jbyuki/one-small-step-for-vimkind",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
        },
        cmd = { "BreakpointToggle", "Debug", "DapREPL" },
        config = function()
            require("plugins.configs.dap")
        end,
    },

    -- winbar
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        config = function()
            require('incline').setup()
        end,
    },

    -- comments
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- registers
    { "junegunn/vim-peekaboo" },
    {
        "nvim-lualine/lualine.nvim",
        opts = require("plugins.configs.lualine"),
    },

    -- git
    {
        "kdheepak/lazygit.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufRead",
        opts = require("plugins.configs.gitsigns"),
    },
    { "rhysd/conflict-marker.vim" },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = require("plugins.configs.copilot"),
    },
}
