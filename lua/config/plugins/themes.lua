return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  -- },

  -- {
  --   'marko-cerovac/material.nvim'
  -- },

  {
    "rose-pine/neovim", name = "rose-pine", opts = {styles = {italic = false,},}
  },

  -- Black Metal themes
  {
    "metalelf0/black-metal-theme-neovim",
    lazy = false,
    priority = 1000, -- load before other plugins
    config = function()
      require("black-metal").setup({
        -- Выберите одну из тем: bathory | burzum | dark-funeral | darkthrone | 
        -- emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | 
        -- mayhem | nile | taake | thyrfing | venom | windir
        theme = "immortal",
        variant = "dark", -- или "light"
        alt_bg = false, -- использовать альтернативный фон
        colored_docstrings = true,
        cursorline_gutter = true,
        dark_gutter = false,
        show_eob = true,
        term_colors = true,
        transparent = false,
        diagnostics = {
          darker = true,
          undercurl = true,
          background = true,
        },
        code_style = {
          comments = "italic",
          conditionals = "none",
          functions = "none",
          keywords = "none",
          headings = "bold",
          operators = "none",
          keyword_return = "none",
          strings = "none",
          variables = "none",
        },
        plugin = {
          lualine = {
            bold = true,
            plain = false,
          },
          cmp = {
            plain = false,
            reverse = false,
          },
        },
      })
      -- Тема будет применена через vim.cmd() в config/themes.lua
    end,
  },
}
