local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Colors
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'Tomorrow (dark) (terminal.sexy)'
config.colors = {
  foreground = '#FFFFFF',
}
-- config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 20
-- Fonts
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14
-- Window
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
