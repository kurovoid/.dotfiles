return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = {
    enable = true,
    max_lines = 3, -- How many lines the context window should span
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 1, -- Maximum number of lines to show for a single context
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded
    mode = "cursor", -- Line used to calculate context. 'cursor' or 'topline'
    separator = nil, -- Separator between context and content
    zindex = 20,
  },
  keys = {
    {
      "[c",
      function()
        require("treesitter-context").go_to_context()
      end,
      desc = "Jump to context (opening tag/function)",
    },
  },
}
