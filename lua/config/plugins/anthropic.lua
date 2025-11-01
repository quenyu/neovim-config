return {
  -- claudecode.nvim - Claude Code integration for chat and AI assistance
  -- Provides Claude AI for code editing and assistance (Cursor-style)
  {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claudecode").setup({
        -- API key is automatically read from environment variable ANTHROPIC_API_KEY
        -- The key has been set in your system environment variables
      })
    end,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code chat" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current file to Claude context" },
    },
  },
}
