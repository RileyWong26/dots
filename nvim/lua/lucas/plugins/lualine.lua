return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status")
    local theme = require("lualine.themes.rose-pine")
    -- theme.normal.c.bg = "#eb6f92"
    theme.normal.c.fg = "#ebbcba"
    local function icon()
      return [[♥]]
    end
    -- configure lualine with modified theme
    lualine.setup({
      options = { theme = theme },
      sections = {
        lualine_c = { icon },
        lualine_x = {
          icon,
          -- {
          --   lazy_status.updates,
          --   cond = lazy_status.has_updates,
          -- },
          -- { "encoding" },
          -- { "fileformat" },
          { "filetype" },
        },
        lualine_y = {},
      },
    })
  end,
}
