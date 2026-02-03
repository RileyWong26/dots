-- Plugin for gc and gb commenting
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")

    local ts = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({

      pre_hook = ts.create_pre_hook(),
    })
  end,
}
