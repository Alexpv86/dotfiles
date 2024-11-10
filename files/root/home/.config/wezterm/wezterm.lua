local wezterm = require("wezterm")

return {
	term = "wezterm",
	enable_csi_u_key_encoding = true,

	color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte

	-- enable_csi_u_key_encoding = true,
	-- enable_kitty_keyboard = true,

	dpi = 96.0,

	-- colors = {
	-- 	selection_fg = "none",
	-- 	selection_bg = "rgba(50% 50% 50% 50%)",
	-- },

	font = wezterm.font({
		-- family = "MesloLGS NF",
		family = "JetBrainsMono Nerd Font",
		weight = "Medium",
	}),
	force_reverse_video_cursor = true,

	font_size = 14,
	-- freetype_load_flags = "NO_HINTING",
	front_end = "OpenGL",
	freetype_load_target = "Light",
	freetype_render_target = "HorizontalLcd",
	-- cell_width = 0.9,
	--
	window_padding = {
		left = 7,
		right = 0,
		top = 7,
		bottom = 0,
	},

	enable_tab_bar = false,
	-- tab_bar_at_bottom = true,
	-- hide_tab_bar_if_only_one_tab = false,
	-- use_fancy_tab_bar = false,
	-- tab_and_split_indices_are_zero_based = false,
}
