require("neotest").setup({
    adapters = {
        -- require("neotest-go"),
        -- vs
        -- require("neotest-golang")({
        --     runner = "gotestsum",
        --     go_test_args = {
        --         "-v",
        --         "-race",
        --         "-count=1",
        --         "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
        --     },
        -- }),
    },
    diagnostic = {
        enabled = true,
    },
    status = {
        virtual_text = false,
        signs = true,
    },
    quickfix = {
        open = function()
            require("trouble").open({ mode = "quickfix", focus = false })
        end,
    },

    -- improve performance
    discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 1,
    },
    running = {
        -- Run tests concurrently when an adapter provides multiple commands to run.
        concurrent = true,
    },
    summary = {
        -- Enable/disable animation of icons.
        animated = false,
    },
})
