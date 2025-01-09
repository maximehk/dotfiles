-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_rows = 80
config.initial_cols = 120

-- For example, changing the color scheme:
config.color_scheme = 'Snazzy'
-- config.color_scheme = 'Pure'

config.font = wezterm.font 'Fira Code'
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
config.font =
  wezterm.font('JetBrains Mono', { 
    weight = 'Bold',
    --  italic = false
})
config.font_size = 15

config.window_background_opacity = .9
-- and finally, return the configuration to wezterm
return config
