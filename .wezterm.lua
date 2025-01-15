local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "GitHub Dark"

config.font = wezterm.font("FiraCode Nerd Font Med")

config.window_close_confirmation = "NeverPrompt"

config.enable_tab_bar = false
--- settings
return config
