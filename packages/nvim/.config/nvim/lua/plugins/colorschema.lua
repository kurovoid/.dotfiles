return {
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				-- Optional: uncomment to enable transparency
				transparent_background = false,
				terminal_colors = false,
				devicons = true,
				background_clear = {
					"neo-tree",
					"telescope",
					"nvim-tree",
				},
				-- Floats and the snacks explorer/picker default to a light gray body (NormalFloat)
				-- that clashes with the theme's dark sidebar borders/titles. Unify them.
				override = function(c)
					local bg = c.sideBar.background
					local fg = c.editor.foreground
					return {
						NormalFloat = { bg = bg, fg = fg },
						FloatBorder = { bg = bg, fg = c.base.dimmed3 },
						SnacksPicker = { bg = bg, fg = fg },
						SnacksPickerList = { bg = bg, fg = fg },
						SnacksPickerInput = { bg = bg, fg = fg },
						SnacksPickerBox = { bg = bg, fg = fg },
						SnacksPickerBorder = { bg = bg, fg = c.base.dimmed3 },
						SnacksPickerInputBorder = { bg = bg, fg = c.base.dimmed3 },
						SnacksPickerListCursorLine = { bg = c.list.activeSelectionBackground },
						SnacksPickerToggle = { bg = bg, fg = c.base.dimmed3, italic = true },
					}
				end,
				day_night = {
					enable = false, -- turn off by default
					day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
					night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				},
				-- styles = {
				--   comment = { italic = true },
				--   keyword = { italic = true },
				--   type = { italic = true },
				--   storageclass = { italic = true },
				--   structure = { italic = true },
				--   parameter = { italic = true },
				--   annotation = { italic = true },
				--   tag_attribute = { italic = true },
				-- },
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			-- "monokai-pro" forces the "pro" filter and ignores `filter` above;
			-- use the filter-specific name so it matches Ghostty's "Monokai Pro Spectrum".
			colorscheme = "monokai-pro-spectrum",
		},
	},
}
