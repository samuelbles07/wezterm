local wezterm = require("wezterm")

return function()
	local mux = wezterm.mux
	local home = os.getenv("HOME")
	local ws = "max"

	local tab, pane = mux.spawn_window({
		workspace = ws,
		cwd = home .. "/Work/airgradient/dev/openair-max",
	})
	tab:set_title("dev")
	pane:send_text("bash -lc 'nvim'\r")

	local tab3, pane3 = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/openair-max",
	})
	pane3:send_text("get_idf\r")
	tab3:set_title("term")

	local tab2 = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/openair-max",
	})
	tab2:set_title("agent")
end
