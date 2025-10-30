local wezterm = require 'wezterm'

return function()
  local mux = wezterm.mux
  local home = os.getenv 'HOME'
  local ws = 'ooa'

  local tab, pane, window = mux.spawn_window {
    workspace = ws,
    cwd = home .. '/Work/airgradient/dev/arduino-dev',
  }
  tab:set_title 'dev'
  pane:send_text "bash -lc 'nvim'\r"

  local term_tab = tab:window():spawn_tab {
    cwd = home .. '/Work/airgradient/dev/arduino-dev',
  }
  term_tab:set_title 'term'
end
