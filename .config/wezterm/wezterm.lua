local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Batman"

config.font = wezterm.font_with_fallback({
	-- <built-in>, BuiltIn
	"JetBrains Mono",
	-- "Input Mono",
    "Server Mono",
})

config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

return config
