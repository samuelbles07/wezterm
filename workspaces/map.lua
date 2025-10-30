local wezterm = require("wezterm")

return function()
	local mux = wezterm.mux
	local home = os.getenv("HOME")
	local ws = "map"

	local tab, pane, window = mux.spawn_window({
		workspace = ws,
		cwd = home .. "/Work/airgradient/dev/gis/airgradient-map",
	})
	tab:set_title("dev")
	pane:send_text("bash -lc 'nvim'\r")

	local term_tab = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/gis/airgradient-map",
	})
	term_tab:set_title("term")

	-- ensure the first tab is the active one
	-- window:activate_tab(tab)
end
