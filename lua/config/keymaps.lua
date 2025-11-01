-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================================================
-- GENERAL
-- =========================================================================
map("i", "kj", "<Esc>", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Saving
map({"n","i","v"}, "<C-s>", function()
  vim.cmd("w")
end, opts)

-- Close
map("n", "<C-c>", ":q<CR>", opts)
map("n", "<A-w>", ":bd<CR>", opts)

-- =========================================================================
-- BUFFERLINE
-- =========================================================================
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)
map("n", "<leader>bx", ":bd<CR>", opts)
map("n", "<leader>bX", ":BufferLineCloseRight<CR>", opts)
map("n", "<leader>bL", ":BufferLineCloseLeft<CR>", opts)

-- =========================================================================
-- SPLITS
-- =========================================================================
map("n", "<leader>ws", ":split<CR>", opts)
map("n", "<leader>vs", ":vsplit<CR>", opts)

-- =========================================================================
-- TEXT
-- =========================================================================
map("n", "Y", "y$", opts)
map("x", "<leader>p", '"_dP', opts)
map({"n","v"}, "<leader>d", '"_d', opts)
map({"n","v"}, "<leader>y", '"+y', opts)
map({"n","v"}, "<leader>P", '"+p', opts)

-- =========================================================================
-- SEARCH
-- =========================================================================
map({"n","v"}, "<leader>nh", ":nohlsearch<CR>", opts)
map("n", "<leader>s", ":%s//g<Left><Left>", opts)

-- =========================================================================
-- LOCATION LIST / QUICKFIX
-- =========================================================================
map("n", "<leader>lo", ":lopen<CR>", opts)
map("n", "<leader>lc", ":lclose<CR>", opts)
map("n", "<C-n>", ":lnext<CR>", opts)
map("n", "<C-p>", ":lprev<CR>", opts)

map("n", "<leader>co", ":copen<CR>", opts)
map("n", "<leader>cc", ":cclose<CR>", opts)
map("n", "<C-N>", ":cnext<CR>", opts)
map("n", "<C-P>", ":cprev<CR>", opts)

-- =========================================================================
-- TELESCOPE (autoload-safe wrappers)
-- =========================================================================
local function tele(builtin, opts)
  return function()
    local ok, b = pcall(require, 'telescope.builtin')
    if ok then b[builtin](opts or {}) end
  end
end

map("n", "<leader>o", tele("find_files"), opts)
map("n", "<leader>H", tele("find_files", { hidden = true }), opts)
map("n", "<leader>b", tele("buffers"), opts)
map("n", "<leader>lg", tele("live_grep"), opts)
map("n", "<leader>pr", tele("oldfiles"), opts)

-- =========================================================================
-- FILE EXPLORER
-- =========================================================================
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- =========================================================================
-- GIT (fugitive & lazygit)
-- =========================================================================
map("n", "<leader>G", ":G<CR>", opts)
map("n", "<leader>gl", ":Gclog<CR>", opts)
map("n", "<leader>gg", ":LazyGit<CR>", opts)

-- =========================================================================
-- DIAGNOSTICS
-- =========================================================================
map("n", "<leader>i", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, opts)

-- =========================================================================
-- NOTIFICATIONS
-- =========================================================================
map("n", "<leader>uh", function()
  local ok, telescope = pcall(require, "telescope")
  if ok then telescope.extensions.notify.notify() end
end, opts)

map("n", "<leader>un", function()
  local ok, notify = pcall(require, "notify")
  if ok then notify.dismiss({ silent = true, pending = true }) end
end, opts)

-- =========================================================================
-- FUN
-- =========================================================================
map("n", "<leader>fml", function()
  local ca = require('cellular-automaton')
  ca.start_animation('scramble')
end, opts)
