local wezterm = require 'wezterm'

local config =  wezterm.config_builder()

config.front_end = "WebGpu"
config.freetype_load_target = 'Light'

-- Appearance Settings
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 11, right = 11, top = 11, bottom = 11 }
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS'
-- config.window_background_opacity = 0.95
config.color_scheme = 'Catppuccin Mocha'

-- Font Settings
-- config.font = wezterm.font {
--     family = 'Monaspace Neon NF',
--     harfbuzz_features = { 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'ss10' }
-- }
config.font = wezterm.font 'JetBrainsMono NFM'
config.font_size = 12.0
-- config.line_height = 1.2

-- Platform Specific Settings
function string:contains(value)
    return self:find(value, 1, true) ~= nil
end

local platform = wezterm.target_triple
if platform:contains 'windows' then
    config.default_prog = { 'nu' }
    -- config.default_prog = { 'pwsh', '--nologo' }
    -- config.window_decorations = 'RESIZE'
elseif platform:contains 'apple' then
else
end

return config 

