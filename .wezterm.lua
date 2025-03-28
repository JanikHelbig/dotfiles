local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

--  config.front_end = "WebGpu"
config.freetype_load_target = 'Light'

-- Appearance Settings
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.window_padding = { left = 11, right = 11, top = 11, bottom = 11 }
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
-- config.window_background_opacity = 0.95
config.color_scheme = 'Catppuccin Frappe'

-- Font Settings
config.font = wezterm.font 'JetBrains Mono'
-- config.font = wezterm.font 'Cascadia Code NF'
config.font_size = 11.0

-- Platform Specific Settings
function string:contains(value)
    return self:find(value, 1, true) ~= nil
end

local platform = wezterm.target_triple
if platform:contains 'windows' then
    config.default_prog = { 'pwsh', '--nologo' }
    -- config.window_decorations = 'RESIZE'
elseif platform:contains 'apple' then
else
end

return config 

