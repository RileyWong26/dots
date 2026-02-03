require("lucas.core")
require("lucas.lazy")


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})

-- disable copilot
vim.cmd("Copilot disable")

-- ~/.config/nvim/filetype.lua
vim.filetype.add({
  extension = {
    myext = "luc8",
  },
  -- filename = {
  --   ["MySpecialFile"] = "luc8",
  -- },
  pattern = {
    [".*%.asm"] = "luc8",
  },
})
