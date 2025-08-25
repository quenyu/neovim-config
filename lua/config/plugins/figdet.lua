return {
  "j-hui/fidget.nvim",
  config = function()
    local fidget = require("fidget")
    vim.notify = fidget.notify
  end,
}
