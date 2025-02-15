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
        -- uses virtual text and gutter signs to show available motions
        "tris203/precognition.nvim",
        opts = {
            startVisible = false,
        },
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
        "stevearc/oil.nvim",
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
        keys = {
            {
                "-",
                mode = { "n" },
                function()
                    return vim.cmd("Oil")
                end,
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
        keys = {
            {
                "<leader>m",
                mode = { "n" },
                function()
                    return require("treesj").toggle()
                end,
            },
        },
    },

    -- snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets",  lazy = false },

    -- completions
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = require("plugins.configs.copilot"),
    },
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = {
            "giuxtaposition/blink-cmp-copilot",
        },
        opts = require("plugins.configs.blink-cmp").opts,
        opts_extend = { "sources.default" },
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
        "b0o/schemastore.nvim",
    },
    {
        -- lsp progress notifications
        "j-hui/fidget.nvim",
        opts = {},
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = require("plugins.configs.trouble").opts,
        keys = require("plugins.configs.trouble").keys,
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
        },
        config = function()
            require("plugins.configs.neotest")
        end,
        keys = {
            {
                "<leader>tr",
                mode = { "n" },
                function()
                    return require("neotest").run.run()
                end,
                desc = "Run tests",
            },
            {
                "<leader>tf",
                mode = { "n" },
                function()
                    return require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Run tests in file",
            },
            {
                "<leader>td",
                mode = { "n" },
                function()
                    return require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
                end,
                desc = "Run tests in file with dap",
            },
            {
                "<leader>ta",
                mode = { "n" },
                function()
                    return require("neotest").run.attach()
                end,
                desc = "Attach to test runner",
            },
            {
                "<leader>to",
                mode = { "n" },
                function()
                    return require("neotest").output_panel.toggle()
                end,
                desc = "Toggle output panel",
            },
        },
    },

    {
        "andythigpen/nvim-coverage",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("coverage").setup({
                auto_reload = true,
            })
        end,
        opts = {
            commands = true, -- create commands
            auto_reload = true, -- reload on file change
        },
        keys = {
            {
                "<leader>tcl",
                mode = { "n" },
                function()
                    return require("coverage").load()
                end,
                desc = "Load coverage",
            },
            {
                "<leader>tct",
                mode = { "n" },
                function()
                    return require("coverage").toggle()
                end,
                desc = "Toggle coverage",
            },
            {
                "<leader>tcs",
                mode = { "n" },
                function()
                    return require("coverage").summary()
                end,
                desc = "Show coverage summary",
            },
        },
    },

    -- UI
    {
        -- hover UI for cmdline, popupmenu, lsp hover
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = require("plugins.configs.noice"),
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
        keys = {
            {
                "<leader>dt",
                mode = { "n" },
                function()
                    return require("dap").toggle_breakpoint()
                end,
                desc = "Toggle breakpoint",
            },
            {
                "<leader>dr",
                mode = { "n" },
                function()
                    return require("dap").repl.toggle()
                end,
                desc = "Toggle REPL",
            },
            {
                "<leader>dc",
                mode = { "n" },
                function()
                    return require("dap").continue()
                end,
                desc = "Continue",
            },
            {
                "<leader>ds",
                mode = { "n" },
                function()
                    return require("dap").step_over()
                end,
                desc = "Step over",
            },
            {
                "<leader>di",
                mode = { "n" },
                function()
                    return require("dap").step_into()
                end,
                desc = "Step into",
            },
            {
                "<leader>do",
                mode = { "n" },
                function()
                    return require("dap").step_out()
                end,
                desc = "Step out",
            },
            {
                "<leader>dut",
                mode = { "n" },
                function()
                    return require("dapui").toggle()
                end,
                desc = "Toggle UI",
            },
        },
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
        event = "BufRead",
        opts = require("plugins.configs.gitsigns"),
    },
    { "rhysd/conflict-marker.vim" },

    -- misc
    -- colour highlighter
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            "lua",
        },
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = require("plugins.configs.snacks").opts,
        keys = require("plugins.configs.snacks").keys,
    },
}
