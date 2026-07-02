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
					"float_win",
				},
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
			colorscheme = "monokai-pro",
		},
	},
}
