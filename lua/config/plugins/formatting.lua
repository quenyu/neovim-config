return {
  -- General
  { 'michaeljsmith/vim-indent-object' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-commentary' },
  { 'junegunn/vim-easy-align' },

  -- Python
  { "EgZvor/vim-black", lazy = true,},
  { 'jeetsukumaran/vim-python-indent-black', lazy = true, },
  { "microsoft/python-type-stubs", lazy = true, },

  -- Go
  {
    "fatih/vim-go",
    lazy = true,
    ft = "go",
    build = ":GoUpdateBinaries",
    config = function()
      -- Go settings
      vim.g.go_fmt_command = "gofumpt"
      vim.g.go_fmt_autosave = 1
      vim.g.go_imports_autosave = 1
      vim.g.go_mod_fmt_autosave = 1
      vim.g.go_metalinter_autosave = 0
      vim.g.go_auto_type_info = 1
      vim.g.go_highlight_build_constraints = 1
      vim.g.go_highlight_extra_types = 1
      vim.g.go_highlight_fields = 1
      vim.g.go_highlight_functions = 1
      vim.g.go_highlight_methods = 1
      vim.g.go_highlight_operators = 1
      vim.g.go_highlight_structs = 1
      vim.g.go_highlight_types = 1
      vim.g.go_highlight_function_parameters = 1
      vim.g.go_highlight_function_calls = 1
      vim.g.go_highlight_variable_declarations = 1
      vim.g.go_highlight_variable_assignments = 1
    end,
  },

  -- Markdown
  { 'godlygeek/tabular', lazy = true, },
  { 'ellisonleao/glow.nvim', config = true, cmd = "Glow",  lazy = true, },

  -- LaTex
  { 'lervag/vimtex', lazy = true, init =  function () vim.g.vimtex_view_method="zathura" end },

  -- TOML Files
  { 'cespare/vim-toml', lazy = true, },

  -- kitty config syntax highlighting
  { "fladson/vim-kitty", lazy = true, },
}
