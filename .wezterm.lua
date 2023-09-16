local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.front_end = "WebGpu"
config.freetype_load_target = 'Light'

-- Appearance Settings
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.color_scheme = 'Catppuccin Frappe'

-- Font Settings
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 15.0

-- Platform Specific Settings
function string:contains(value)
    return self:find(value, 1, true) ~= nil
end

local platform = wezterm.target_triple
if platform:contains 'windows' then
    config.default_prog = { 'pwsh', '--nologo' }
    config.window_decorations = 'RESIZE'
elseif platform:contains 'apple' then
else 
end

return config 

