return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			hidden = true, -- Show hidden files like .vscode, .env, etc.
			ignored = true, -- Show git-ignored files/directories
			exclude = {
				".git",
				"node_modules",
				"dist",
				"coverage",
			},
		},
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 15, total = 250 },
				easing = "linear",
			},
		},
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		-- Set a more visible color for hidden files and directories
		-- Using autocmd to ensure it persists after colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				-- Hidden files (dotfiles like .env, .gitignore)
				vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#7aa2f7", italic = true })
				-- Regular directories - lighter gray for better visibility
				vim.api.nvim_set_hl(0, "Directory", { fg = "#a0a0a0" })
				-- Git-ignored directories (node_modules, .git, .vscode) - use original Directory color
				-- Note: NonText is also used for other UI elements like end-of-buffer tildes
				vim.api.nvim_set_hl(0, "NonText", { fg = 6907756 })
			end,
		})

		-- Set it immediately as well
		vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#7aa2f7", italic = true })
		vim.api.nvim_set_hl(0, "Directory", { fg = "#a0a0a0" })
		vim.api.nvim_set_hl(0, "NonText", { fg = 6907756 })
	end,
}
