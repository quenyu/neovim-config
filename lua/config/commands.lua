-- Define commands

-- Toggle highlight
-- vim.cmd([[command! HiLiToggle (g:hlsearch ? ':nohls' : ':set hls')]])

-- Remove trailing whitespaces
-- (if a file requires trailing spaces, exclude its type using the regex)
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- Swap folder
vim.cmd('command! ListSwap split | enew | r !ls -l ~/.local/share/nvim/swap')
vim.cmd('command! CleanSwap !rm -rf ~/.local/state/nvim/swap/')

-- Open help tags
vim.cmd("command! HelpTags Telescope help_tags")

-- Create ctags
vim.cmd('command! MakeCTags !ctags -R --exclude=@.ctagsignore .')

-- Fix Treesitter parsers (useful when parsers are corrupted or wrong platform)
vim.cmd('command! TSReinstall lua require("nvim-treesitter.install").update({ with_sync = true })')
vim.cmd('command! TSReinstallAll lua vim.cmd("silent !powershell -Command Remove-Item -Recurse -Force \\\"$env:LOCALAPPDATA\\nvim-data\\lazy\\nvim-treesitter\\parser\\\" -ErrorAction SilentlyContinue") vim.cmd("TSUpdate")')
-- Remove all .so files (Linux format) and reinstall for Windows
vim.cmd('command! TSFixWindows lua vim.cmd("silent !powershell -Command Get-ChildItem \\\"$env:LOCALAPPDATA\\nvim-data\\lazy\\nvim-treesitter\\parser\\\" -Filter \\\"*.so\\\" | Remove-Item -Force") vim.cmd("TSUpdate")')