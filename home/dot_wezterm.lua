local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

config.audible_bell = "Disabled"
config.initial_rows = 80
config.initial_cols = 160
config.font_size = 15


config.color_scheme = 'Snazzy'
-- config.color_scheme = 'Pure'

config.font =
wezterm.font('JetBrains Mono', {
    weight = 'Bold',
    --  italic = false
})
-- config.font = wezterm.font 'Fira Code'
config.keys = {
      -- We're mapping CMD-L to send the string "ls -l" followed by a newline (Enter)
    { key = 'l', mods = 'CMD', action = act.SendString('ls -l\n') },
    {
      key = 'T',
      mods = 'CTRL|SHIFT',
      action = act.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(function(window, pane, line)
          -- line will be `nil` if they hit escape without entering anything
          -- An empty string if they just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    },
  }

--config.window_background_opacity = .9
return config
