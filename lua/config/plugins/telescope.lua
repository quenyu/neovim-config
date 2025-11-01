return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- using master to fix issues with deprecated to definition warnings
  -- '0.1.x' for stable ver.
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- fzf-native: use cmake for Windows, make for Unix
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = vim.fn.has("win32") == 1 and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" or "make",
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local utils = require("utils")

    -- Load fzf extension if available (requires compilation)
    pcall(function()
      telescope.load_extension('fzf')
    end)
    
    -- Load notify extension if available
    pcall(function()
      telescope.load_extension('notify')
    end)

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        -- Use fd for file finding (faster than built-in)
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        file_ignore_patterns = {
          "%.git/",
          "%.venv/",
          "node_modules/",
          "__pycache__/",
          "%.o",
          "%.so",
          "%.exe",
        },
        mappings = {
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-c>'] = actions.close,
          },
          n = {
            ['<C-c>'] = actions.close,
          },
        },
        layout_config = {
          horizontal ={
            height = 47,
            prompt_position = "top",
          }
        }
      },
      extensions ={
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })

    -- Telescope keymaps are now set up in lua/config/keymaps.lua
    -- This ensures they are available immediately, not just after plugin loads

  end
}
