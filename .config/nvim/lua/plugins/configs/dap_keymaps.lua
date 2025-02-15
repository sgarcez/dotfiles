return {
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
}
