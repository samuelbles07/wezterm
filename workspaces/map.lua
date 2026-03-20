local wezterm = require("wezterm")

return function()
	local mux = wezterm.mux
	local home = os.getenv("HOME")
	local ws = "map"

	local tab, pane = mux.spawn_window({
		workspace = ws,
		cwd = home .. "/Work/airgradient/dev/gis/airgradient-apps-internal",
	})
	tab:set_title("dev")
	pane:send_text("bash -lc 'nvim'\r")

	local tab2, _, _ = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/gis/airgradient-apps-internal",
	})
	tab2:set_title("agent")

	local term_tab = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/gis/airgradient-apps-internal",
	})
	term_tab:set_title("term")
end
