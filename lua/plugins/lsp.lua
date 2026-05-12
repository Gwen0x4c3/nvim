return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
    },
    ft = "python", -- Load when opening Python files
    keys = {
      -- { ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
    },
    opts = { -- this can be an empty lua table - just showing below for clarity.
      search = {}, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
    },
  },

  -- Glance.nvim - 类似 GoLand Cmd+Y 的代码预览（定义/引用/类型定义）
  {
    "dnlhc/glance.nvim",
    event = "LspAttach",
    config = function()
      require("glance").setup({
        border = {
          enable = true,
          top_char = "▀",
          bottom_char = "▄",
        },
        theme = {
          enable = true,
          mode = "dark_border",
        },
        folds = {
          fold_closed = "",
          fold_open = "",
          folded = true,
        },
        mappings = {
          list = {
            ["<CR>"] = "jump",
            ["o"] = "jump",
            ["q"] = "close",
            ["<Esc>"] = "close",
          },
        },
      })
    end,
    keys = {
      { "gp", "<cmd>Glance definitions<cr>", desc = "[Glance] Preview definitions" },
      { "gP", "<cmd>Glance type_definitions<cr>", desc = "[Glance] Preview type definitions" },
      { "gr", "<cmd>Glance references<cr>", desc = "[Glance] Preview references" },
      { "gy", "<cmd>Glance implementations<cr>", desc = "[Glance] Preview implementations" },
    },
  },
}
