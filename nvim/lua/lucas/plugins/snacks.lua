-- has a bunch of useful things, only using input which makes nvim input look better
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    input = { enabled = true },
    picker = {
      enabled = true,
      formatters = {
        file = {
          -- ... other file formatter options ...
          truncate = "center", -- Truncate the middle of the path
          min_width = 40, -- Minimum length of the truncated path
          -- You can also use "left" or "right" for truncation
        },
      },
    },
  },
}
