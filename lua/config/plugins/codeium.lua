-- Codeium requires gzip which may not be available on Windows
-- Temporarily disabled - use Copilot instead which is already configured
-- To enable Codeium:
-- 1. Install gzip (comes with Git for Windows in C:\Program Files\Git\usr\bin)
-- 2. Add Git's usr\bin to your system PATH
-- 3. Uncomment the code below

return {}
--[[
return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  event = "InsertEnter",
  config = function()
    require("codeium").setup({
      config_path = vim.fn.stdpath("config") .. "/codeium.json",
    })
  end
}
--]]
