-- jolors-scheme conffig
return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      styles = {
        transparency = true,
      },
      palette = {
        main = {
          pine = "#eb6f92",
          -- rose = "#d7827e",
        },
      },
      highlight_groups = {
        StatusLine = { fg = "gold", bg = "gold", blend = 10 },
        -- StatusLineNC = { fg = "subtle", bg = "surface" },
      },
    })

    vim.cmd("colorscheme rose-pine")
    -- vim.cmd("highlight Keyword guifg=#eb6f92")
    -- vim.cmd("highlight Statement guifg=#eb6f92")
  end,
}
