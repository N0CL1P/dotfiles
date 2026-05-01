local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font_with_fallback({
    'JetBrainsMono Nerd Font',
    'Noto Color Emoji',
})
config.font_size = 14.0

-- Theme
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.80
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
config.window_padding = {
    -- left = 0,
    -- right = 0,
    top = 0,
    bottom = 0,
}

-- Cursor
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 650
config.cursor_blink_ease_in = 'EaseIn'
config.cursor_blink_ease_out = 'EaseOut'

-- MISC
config.window_close_confirmation = 'NeverPrompt'
config.max_fps = 144
config.animation_fps = 60

return config
