return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      local markdownlint = require("lint.linters.markdownlint-cli2")
      markdownlint.args = {
        "--config",
        vim.fn.expand("~/.markdownlint-cli2.jsonc"),
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", vim.fn.expand("~/.markdownlint-cli2.jsonc") },
        },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
