local M = {}

M.setup = function()
    require 'lualine'.setup {
        options = {
            icons_enabled = false,
            -- theme = 'OceanicNext',
            theme = 'ayu_mirage',
            component_separators = { '', '' },
            section_separators = { '', '' },
            disabled_filetypes = {}
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    }
end
return M