local wezterm = require("wezterm")

return function()
	local mux = wezterm.mux
	local home = os.getenv("HOME")
	local ws = "core"

	local tab, pane, window = mux.spawn_window({
		workspace = ws,
		cwd = home .. "/Work/airgradient/dev/airgradient-core",
	})
	tab:set_title("dev")
	pane:send_text("bash -lc 'nvim'\r")

	local term_tab = tab:window():spawn_tab({
		cwd = home .. "/Work/airgradient/dev/airgradient-core",
	})
	term_tab:set_title("term")
end
