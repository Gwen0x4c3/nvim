return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "https://code.byted.org/chenjiaqi.cposture/codeverse.vim.git",  -- 把 codeverse 也加到这里作为依赖
  },

  config = function()
    local cmp = require("cmp")

    cmp.setup({
      sources = {
        { name = "trae",     group_index = 1 },   -- AI 补全优先
        { name = "nvim_lsp", group_index = 2 },
        { name = "buffer",   group_index = 3 },
        { name = "path",     group_index = 3 },
      },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      experimental = {
        ghost_text = true,
      },
    })

    -- ==================== 关键在这里 ====================
    -- 等 cmp 完全 setup 后再初始化 trae
    require("trae").setup({})
    -- ====================================================
  end,
}
