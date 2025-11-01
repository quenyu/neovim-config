return {

  "hrsh7th/nvim-cmp",
  event = {"InsertEnter", "CmdlineEnter"},
  branch = "main", -- fix for deprecated functions coming in nvim 0.13
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "saadparwaiz1/cmp_luasnip", -- autocompletion
    "rafamadriz/friendly-snippets", -- snippets
    "L3MON4D3/LuaSnip",
    "nvim-treesitter/nvim-treesitter",
    "Exafunction/codeium.nvim", -- Codeium AI completion
    -- "onsails/lspkind.nvim", -- vs-code pictograms
  },
  config = function ()
    -- local vim = require("vim")
    local cmp = require("cmp")
    local has_luasnip, luasnip = pcall(require, 'luasnip')

    local unpack = table.unpack or unpack  -- Neovim don't seem to use Lua 5.4
    local function has_words_before()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(
        0, line - 1, line, true
      )[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      preselect = cmp.PreselectMode.Item,  -- Preselect first item for faster completion

      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },

      -- Performance settings
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
      },

      -- Snippet engine, required
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Configure completion sources with priority
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000, group_index = 1 },  -- LSP has highest priority
        { name = "copilot", priority = 900, group_index = 2 },   -- GitHub Copilot
        { name = "luasnip", priority = 750, group_index = 2 },    -- Snippets
        { name = "buffer", priority = 500, group_index = 3 },     -- Buffer text
        { name = "path", priority = 250, group_index = 3 },       -- File paths
        -- { name = "codeium", priority = 800, group_index = 2 },    -- Codeium (disabled - requires gzip)
      }),

      -- Better completion behavior
      completion = {
        keyword_length = 1,  -- Start completion after 1 character
        completeopt = "menu,menuone,noinsert,noselect",
      },


      mapping = cmp.mapping.preset.insert({
        -- open/close autocomplete
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_luasnip and luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end,

        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
            -- elseif luasnip.jumpable(-1) then
            --   luasnip.jump(-1)
          else
            fallback()
          end
        end,

        ['<C-c>'] = cmp.mapping.close(),

        -- select completion
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,  -- Auto-select if there's only one item
        }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),  -- Force confirm with selection

        -- Scroll documentation
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
      }),
    })

  end,
}
