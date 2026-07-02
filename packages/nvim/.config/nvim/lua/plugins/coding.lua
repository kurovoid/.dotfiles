return {
	-- Blink.cmp completion with Codeium AI
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			{
				"Exafunction/windsurf.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
				config = function()
					require("codeium").setup({
						enable_cmp_source = false,
					})
				end,
			},
			"rafamadriz/friendly-snippets",
		},
		opts = {
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "codeium" },
				providers = {
					codeium = {
						name = "Codeium",
						module = "codeium.blink",
						async = true,
					},
				},
			},

			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
			},

			appearance = {
				nerd_font_variant = "mono",
				kind_icons = {
					Codeium = "",
				},
			},
		},
	},

	-- -- Rename with live preview
	-- {
	--   "smjonas/inc-rename.nvim",
	--   cmd = "IncRename",
	--   config = true,
	-- },
	--
	-- -- Navigate like a pro
	-- {
	--   "echasnovski/mini.bracketed",
	--   event = "BufReadPost",
	--   config = function()
	--     require("mini.bracketed").setup({
	--       file = { suffix = "" },
	--       window = { suffix = "" },
	--       quickfix = { suffix = "" },
	--       yank = { suffix = "" },
	--       treesitter = { suffix = "n" },
	--     })
	--   end,
	-- },
	--
	-- -- Smart increment/decrement
	-- {
	--   "monaqa/dial.nvim",
	--   keys = {
	--     { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true },
	--     { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true },
	--   },
	--   config = function()
	--     local augend = require("dial.augend")
	--     require("dial.config").augends:register_group({
	--       default = {
	--         augend.integer.alias.decimal,
	--         augend.integer.alias.hex,
	--         augend.date.alias["%Y/%m/%d"],
	--         augend.constant.alias.bool,
	--         augend.semver.alias.semver,
	--         augend.constant.new({ elements = { "let", "const" } }), -- Toggle let/const
	--       },
	--     })
	--   end,
	-- },
	--
	-- -- Code structure overview
	-- {
	--   "simrat39/symbols-outline.nvim",
	--   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
	--   cmd = "SymbolsOutline",
	--   opts = {
	--     position = "right",
	--   },
	-- },
	--
	-- -- Never lose your place
	-- {
	--   "chentoast/marks.nvim",
	--   event = "VeryLazy",
	--   opts = {},
	-- },
}
