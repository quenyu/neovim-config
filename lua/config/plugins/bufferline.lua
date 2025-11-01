return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    event = 'BufWinEnter',
    config = function()

      local bufferline = require("bufferline")
      -- format as "<id>. <file-name>"
      local tabname_format = function (opts)
        return string.format('%s.', opts.ordinal)
      end

      bufferline.setup({
        options = {
          always_show_bufferline = true,
          numbers = tabname_format,
          show_buffer_icons = true,
          show_buffer_close_icons = true,  -- Show close icons on tabs
          show_close_icon = true,  -- Show close icon on the right
          separator_style = 'thin',
          -- Close buffers with the mouse
          close_command = "bdelete! %d",  -- Close buffer when clicking on the icon
          right_mouse_command = "bdelete! %d",  -- Right click closes the buffer
          left_mouse_command = "buffer %d",  -- Left click switches to the buffer
          middle_mouse_command = "bdelete! %d",  -- Middle click (wheel) closes the buffer
          -- Don't show bufferline over vertical, unmodifiable buffers
          offsets = {{
            filetype = 'NvimTree',
            text = 'File Explorer',
            highlight = 'Directory'
          }},
        },
        -- Don't use italic on current buffer
        highlights = {buffer_selected = { bold = true },},
      })

    end,
  },

}
