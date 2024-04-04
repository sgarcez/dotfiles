
return {
    opts = {
        modes = {
            char = {
                keys = { "f", "F", "t", "T" },
            },
            search = {
                enabled = false,
            },
        },
    },
    keys = {
        {
            "m",
            mode = { "o", "x" },
            function()
                return require("flash.plugins.treesitter").jump()
            end,
        },
        {
            "gs",
            mode = { "n", "x", "o" },
            function()
                return require("flash").jump()
            end,
        },
        {
            "gl",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump({
                    search = { mode = "search" },
                    highlight = { label = { after = { 0, 0 } } },
                    pattern = "^",
                })
            end,
        },
    },
}
