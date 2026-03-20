local wezterm = require("wezterm")

return function()
	local mux = wezterm.mux
	local home = os.getenv("HOME")
	local ws = "expr"

	local tab, pane, window = mux.spawn_window({
		workspace = ws,
		cwd = home,
	})
	tab:set_title("dev")

	local term_tab = tab:window():spawn_tab({
		cwd = home,
	})
	term_tab:set_title("term")
end
