local wezterm = require("wezterm")

return function()
	local mux = wezterm.mux
	local home = os.getenv("HOME")
	local ws = "max"

	local tab, pane, window = mux.spawn_window({
		workspace = ws,
		cwd = home .. "/Work/airgradient/dev/openair-max",
	})
	tab:set_title("dev")
	pane:send_text("bash -lc 'nvim'\r")

	local tab2, pane2, window2 = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/openair-max",
	})
	pane2:send_text("get_idf\r")
	tab2.set_title("term")
end
