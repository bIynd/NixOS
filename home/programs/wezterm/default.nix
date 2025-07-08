{
  config,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;

    extraConfig = ''
      local wezterm = require("wezterm")
      local act = wezterm.action

      return {
        font = wezterm.font_with_fallback({
          { family = "JetBrainsMono Nerd Font", weight = "Regular" },
          { family = "Fira Code", weight = "Regular" },
        }),
        font_size = 12,
        window_background_opacity = 0.92,
        text_background_opacity = 1.0,
        enable_scroll_bar = false,
        enable_kitty_graphics = true,
        enable_tab_bar = false,
        window_padding = { left = 8, right = 8, top = 8, bottom = 8 },
        color_scheme = wezterm.gui.get_appearance():find("Dark")
          and "Catppuccin Mocha"
          or "Catppuccin Latte",
        default_cursor_style = "BlinkingBar",
        scrollback_lines = 7000,
        keys = {
          { key = "L", mods = "CTRL|SHIFT", action = act.ClearScrollback("ScrollbackAndViewport") },
        },
        enable_wayland = true,
        front_end = "WebGpu",
        underline_position = -3,
        animation_fps = 60,
        max_fps = 60,
      }
    '';
  };
}
