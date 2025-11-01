return {
  'kyazdani42/nvim-tree.lua',
  layz = true,
  dependencies = 'kyazdani42/nvim-web-devicons',
  config = function()
    local nvimtree = require("nvim-tree")
    local utils = require("utils")

    nvimtree.setup({
      disable_netrw = false,
      hijack_netrw = false,

      -- Main parameters for root / relative paths
      sync_root_with_cwd = true,
      respect_buf_cwd = true,

      update_focused_file = {
        enable = true,
        update_cwd = true,      -- Change current working directory to the file's directory
      },

      actions = {
        open_file = {
          window_picker = { enable = false },
        },
      },

      filters = {
        git_ignored = false,
        custom = {
          ".git",
          ".venv",
          ".ipynb_checkpoints",
          "__pycache__",
          ".DS_Store",
        },
        exclude = { ".gitignore" },
      },
    })

    -- NvimTree keymap is now in lua/config/keymaps.lua
  end
}
