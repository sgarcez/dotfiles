return {

    -- moving
    {
        "folke/which-key.nvim",
        opts = {
            show_help = false,
            show_keys = false,
        },
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
        branch = "0.1.x",
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
    {
        "neovim/nvim-lspconfig",
        event = "VimEnter",
        config = function()
            require("plugins.configs.lsp")
        end,
    },
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
        -- lsp progress notifications
        "j-hui/fidget.nvim",
    },
    {
        "folke/trouble.nvim",
        opts = {
            -- mode = "document_diagnostics",
            -- auto_open = false,
            -- auto_close = true,
            -- icons = false,
            -- use_diagnostic_signs = true,
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
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

    -- Task runner
    {
        "stevearc/overseer.nvim",
        opts = {},
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
            {
                "fredrikaverpil/neotest-golang",
                version = "*",
                dependencies = {
                    "leoluz/nvim-dap-go",
                },
            },
        },
        config = function()
            require("plugins.configs.neotest")
        end,
    },

    {
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("coverage").setup()
        end,
        opts = {
            commands = true, -- create commands
            auto_reload = true, -- reload on file change
        },
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

    -- floating statuslines
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        config = function()
            require("incline").setup()
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
        "almo7aya/openingh.nvim",
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = require("plugins.configs.copilot"),
    },

    -- misc
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            "lua",
        },
    },
}
