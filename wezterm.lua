local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Use CPU instead of GPU
-- config.front_end = 'Software'
config.front_end = "OpenGL"

-- Limit redraws to save CPU/GPU without noticeable slowdown
config.animation_fps = 1
config.max_fps = 60

-- config.color_scheme = 'SoftServer'
-- config.color_scheme = 'Snazzy'
config.color_scheme = "nordfox"

-- Fonts
-- config.font = wezterm.font('Hack Nerd Font', { weight = 'Bold' })
config.font = wezterm.font("Hack", { weight = "Regular", italic = false })
-- config.font = wezterm.font('Fira Code', { weight = 'Regular', italic = false })
config.font_size = 12

-- Windows
config.window_decorations = "NONE"
-- config.enable_tab_bar = false
config.window_background_opacity = 0.94
-- config.macos_window_background_blur = 50

-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 8000

-- Tabs
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	if tab.is_active then
		return {
			{ Background = { Color = "#c8c800" } },
			{ Text = tab.tab_index .. ":" .. title .. " " },
		}
	end
	return {
		{ Text = tab.tab_index .. ":" .. title .. " " },
	}
end)

-- keymaps
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = require("keymaps")

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	if gui_window then
		gui_window:maximize()
	end

	require("workspaces.map")()
	require("workspaces.ooa")()
	require("workspaces.max")()
	require("workspaces.core")()
	require("workspaces.expr")()
	wezterm.mux.set_active_workspace("core")
end)

wezterm.on("update-status", function(window, pane)
	local workspace = window:active_workspace()
	window:set_right_status(wezterm.format({
		{ Background = { Color = "#522d80" } },
		{ Foreground = { Color = "#f2f2f2" } },
		{ Text = " " .. workspace .. " " },
	}))
end)

return config
