local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- fonts

config.font = wezterm.font_with_fallback({
    --@0
    "CommitMono",
	-- "Input Mono",
	"JetBrains Mono",
	"Server Mono",
})
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14
config.line_height = 1.1

-- ui

config.color_scheme = "Ocean (base16)"
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 1,
}
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.window_decorations = "RESIZE"
config.colors = {
	tab_bar = {
		background = "#343d46",
		active_tab = {
			bg_color = "#2b303b",
			fg_color = "#65737e",
			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#343d46",
			fg_color = "#65737e",
			intensity = "Half",
		},
		inactive_tab_hover = {
			bg_color = "#2b303b",
			fg_color = "#65737e",
		},
		new_tab = {
			bg_color = "#343d46",
			fg_color = "#65737e",
		},
		new_tab_hover = {
			bg_color = "#2b303b",
			fg_color = "#65737e",
			italic = true,
		},
	},
	-- cursor_bg = "#ebcb8b",
	-- cursor_border = "#ebcb8b",
}
config.default_cursor_style = "SteadyBlock"

-- keybingings

local function is_vim(pane)
	-- this is set by the smart-splits neovim plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
	{ key = "-", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	{ key = "=", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	{ key = "0", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	{ key = "-", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
	{ key = "=", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
	{ key = "0", mods = "SUPER", action = wezterm.action.DisableDefaultAssignment },
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }) },
	{ mods = "LEADER", key = "j", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "l", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { mods = "LEADER|CTRL", key = "h", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	-- { mods = "LEADER|CTRL", key = "j", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	-- { mods = "LEADER|CTRL", key = "k", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	-- { mods = "LEADER|CTRL", key = "l", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ mods = "LEADER", key = "p", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ mods = "LEADER", key = "n", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ mods = "LEADER", key = "1", action = wezterm.action({ ActivateTab = 0 }) },
	{ mods = "LEADER", key = "2", action = wezterm.action({ ActivateTab = 1 }) },
	{ mods = "LEADER", key = "3", action = wezterm.action({ ActivateTab = 2 }) },
	{ mods = "LEADER", key = "4", action = wezterm.action({ ActivateTab = 3 }) },
	{ mods = "LEADER", key = "5", action = wezterm.action({ ActivateTab = 4 }) },
	{ mods = "LEADER", key = "6", action = wezterm.action({ ActivateTab = 5 }) },
	{ mods = "LEADER", key = "7", action = wezterm.action({ ActivateTab = 6 }) },
	{ mods = "LEADER", key = "8", action = wezterm.action({ ActivateTab = 7 }) },
	{ mods = "LEADER", key = "9", action = wezterm.action({ ActivateTab = 8 }) },
	{ mods = "LEADER", key = "w", action = act.ShowTabNavigator },
	-- new tab
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action_callback(function(win, pane)
			local mux_win = win:mux_window()
			for _, item in ipairs(mux_win:tabs_with_info()) do
				if item.is_active then
					mux_win:spawn_tab({})
					win:perform_action(wezterm.action.MoveTab(item.index + 1), pane)
					return
				end
			end
		end),
	},
	{
		mods = "LEADER",
		key = ",",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

return config
