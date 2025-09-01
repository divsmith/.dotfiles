local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 15

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

--config.color_scheme = 'Afterglow'
--config.color_scheme = 'Vice Dark (base16)'
config.color_scheme = 'Bamboo'
--config.color_scheme = 'Tokyo Night'

config.keys = {
 -- THIS IS WORKING CORRECTLY
--   {
--     key = 'K',
--     mods = 'CTRL|SHIFT',
--     action = act.Multiple {
--       act.ClearScrollback 'ScrollbackAndViewport',
--       act.SendKey { key = 'L', mods = 'CTRL' },
--     },
--   },
   -- THIS WON'T WORK
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
}

return config
