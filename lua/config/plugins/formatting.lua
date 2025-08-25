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
