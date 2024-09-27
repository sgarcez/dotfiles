-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Batman'

config.font = wezterm.font_with_fallback({
    -- <built-in>, BuiltIn
    "JetBrains Mono",
    -- "Input Mono",

    -- <built-in>, BuiltIn
    -- Assumed to have Emoji Presentation
    "Noto Color Emoji",

    -- <built-in>, BuiltIn
    "Symbols Nerd Font Mono",

})

config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
