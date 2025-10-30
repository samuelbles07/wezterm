local wezterm = require("wezterm")
local act = wezterm.action

local keys = {
	{
		mods = "LEADER",
		key = "n",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "CTRL|ALT",
		key = "[",
		action = act.ActivateTabRelative(-1),
	},
	{
		mods = "CTRL|ALT",
		key = "]",
		action = act.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "|",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		mods = "LEADER",
		key = "Enter",
		action = act.TogglePaneZoomState,
	},

	-- Workspace
	{
		key = "1",
		mods = "LEADER",
		action = act.SwitchToWorkspace({
			name = "map",
		}),
	},
	{
		key = "2",
		mods = "LEADER",
		action = act.SwitchToWorkspace({
			name = "ooa",
		}),
	},
	{
		key = "3",
		mods = "LEADER",
		action = act.SwitchToWorkspace({
			name = "max",
		}),
	},
}

-- Set switching tab using tab number
for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = act.ActivateTab(i - 1),
	})
end

return keys
