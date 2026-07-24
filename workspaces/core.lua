local wezterm = require("wezterm")

return function()
	local mux = wezterm.mux
	local home = os.getenv("HOME")
	local ws = "core"

	local tab, pane, _ = mux.spawn_window({
		workspace = ws,
		cwd = home .. "/Work/airgradient/dev/fwcore/airgradient-firmware",
	})
	tab:set_title("dev")
	pane:send_text("bash -lc 'nvim'\r")

	local tab3, pane3, _ = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/fwcore",
	})
	pane3:send_text("get_idf\r")
	tab3:set_title("term")

	local tab2, _, _ = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/fwcore",
	})
	tab2:set_title("agent")
end
