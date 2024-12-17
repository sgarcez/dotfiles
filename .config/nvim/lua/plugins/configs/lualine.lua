return {
    options = {
        icons_enabled = false,
        -- theme = 'OceanicNext',
        theme = "ayu_mirage",
        globalstatus = true,
        component_separators = { "", "" },
        section_separators = { "", "" },
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { "mode" },
        -- lualine_b = { "branch" },
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                file_status = true,
                path = 1, -- relative path
                -- path = 3, -- absolute path
                shorting_target = 40,
            },
        },
        lualine_x = { "branch" },
        lualine_y = { "encoding" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
