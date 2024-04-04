require("neotest").setup({
    adapters = {
        require("neotest-go"),
    },
    diagnostic = {
        enabled = true,
    },
    status = {
        virtual_text = false,
        signs = true,
    },
})
