local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Shell setup
config.default_prog = { 'powershell.exe', '-NoLogo' }

config.launch_menu = {
  {
    args = { 'top' },
  },{
     -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'Bash',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'C:/Program Files/Git/bin/sh.exe --login', '-l' },

  }
}

-- General appearance and visuals
config.font_size = 11
config.line_height = 1.1

-- Colors
config.color_scheme = 'Dracula'

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.use_fancy_tab_bar = true
config.window_frame = {
  font = wezterm.font { family = 'FiraCode Nerd Font Mono', weight = 'Regular' },
}

config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 350

-- Terminal emulation (no SSH check needed if you want to just always use wezterm)
config.term = "xterm-256color"

config.max_fps = 144
config.animation_fps = 30

-- Tab bar color matching your DWM colors
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#8be9fd",
      fg_color = "#00141d",
    },

    inactive_tab = {
      bg_color = "#1e1f29",
      fg_color = "#FFFFFF",
    },

    inactive_tab_hover = {
      bg_color = "#44475a",
      fg_color = "#FFFFFF",
    },

    new_tab_hover = {
      bg_color = "#44475a",
      fg_color = "#FFFFFF",
    },

    new_tab = {
      bg_color = "#1e1f29",
      fg_color = "#8be9fd",  -- col_barbie (for the "+" button)
    },
  },
}

-- Keybindings using ALT for tabs & splits
config.keys = {
  -- Tab management
  { key = "t", mods = "ALT", action = wezterm.action.SpawnTab "CurrentPaneDomain" },
  { key = 't', mods = 'ALT|CTRL', action = wezterm.action.ShowLauncher },
  { key = "w", mods = "ALT|CTRL", action = wezterm.action.CloseCurrentTab { confirm = false } },
  { key = "Tab", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
  { key = "Tab", mods = "ALT|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

  -- Pane management
  { key = "x", mods = "ALT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "w", mods = "ALT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane { confirm = false } },

  -- Pane navigation (move between panes with ALT + Arrows)
  { key = "LeftArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection "Right" },
  { key = "UpArrow",    mods = "ALT", action = wezterm.action.ActivatePaneDirection "Up" },
  { key = "DownArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection "Down" },
}

config.warn_about_missing_glyphs = false

return config
