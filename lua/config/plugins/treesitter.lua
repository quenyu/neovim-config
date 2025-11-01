return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },

    build = function()
      local parser_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser"
      if vim.fn.isdirectory(parser_dir) == 1 then
        local files = vim.fn.readdir(parser_dir)
        for _, f in ipairs(files) do
          if f:match("%.so$") then
            os.remove(parser_dir .. "/" .. f)
          end
        end
      end

      vim.cmd("TSUpdate")
    end,

    config = function()
      local install = require("nvim-treesitter.install")

      if vim.fn.executable("gcc") == 1 then
        install.compilers = { "cl" }
      else
        install.compilers = { "cl" }
      end

      install.prefer_git = false
      install.use_bundler = false

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local parser_dir = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter/parser"
          if vim.fn.isdirectory(parser_dir) == 1 then
            local files = vim.fn.readdir(parser_dir)
            for _, f in ipairs(files) do
              if f:match("%.so$") then
                os.remove(parser_dir .. "/" .. f)
              end
            end
          end
        end
      })

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "json", "yaml", "python", "markdown", "markdown_inline",
          "bash", "lua", "vim", "gitignore", "c", "julia", "go"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })

    end,
  },
}
