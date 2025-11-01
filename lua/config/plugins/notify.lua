return {
  -- nvim-notify: Beautiful notification system with history viewer
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
        -- Render style: "default", "minimal", "compact"
        render = "compact",
        -- Position: "top_left", "top_right", "bottom_left", "bottom_right", "top_center", "bottom_center"
        position = "top_right",
        -- Maximum width of notification
        max_width = 80,
        -- Maximum height of notification
        max_height = 10,
        -- Animation stages: "fade_in_slide_out", "fade", "slide", "static"
        stages = "fade_in_slide_out",
        -- Timeout (ms) for notifications
        timeout = 3000,
        -- Show background color
        background_colour = "#000000",
        -- Icons
        icons = {
          ERROR = "✗",
          WARN = "⚠",
          INFO = "ℹ",
          DEBUG = "→",
          TRACE = "→",
        },
      })
      
      -- Keep fidget for LSP notifications, but also use notify
      -- vim.notify will be handled by both plugins
    end,
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all notifications",
      },
    },
  },
  
  -- Telescope extension for notify (built into telescope.nvim, just needs to be loaded)
}

