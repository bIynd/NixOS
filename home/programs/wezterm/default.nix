{
  config,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        -- General
        font_size = 14.0,
        font = wezterm.font('JetBrains Mono'),
        adjust_window_size_when_changing_font_size = false,
        default_cursor_style = "BlinkingBar",

        -- Appearance
        enable_tab_bar = false,
        enable_scroll_bar = false,
        -- window_decorations = 'RESIZE',
        window_background_opacity = 0.78,
        text_background_opacity = 1.0,

        -- Colors

        -- Wayland / rendering
        enable_wayland = true,
        front_end = "WebGpu",
        underline_position = -3,
        animation_fps = 60,
        max_fps = 60,

        -- Kitty graphics protocol support
        enable_kitty_graphics = true,

        -- Key bindings
        keys = {
          {
            key = 'q',
            mods = 'CTRL',
            action = wezterm.action.ToggleFullScreen,
          }
          -- {
          --    key = '\',
          --    mods = 'CTRL',
          --    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
          --  },
        },

        -- Mouse bindings
        mouse_bindings = {
          {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
          },
        }
      }'';
  };
}
