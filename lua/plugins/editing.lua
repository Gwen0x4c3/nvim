return {
  {
    "rainbowhxch/accelerated-jk.nvim",
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    event = "VeryLazy",
    config = true,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = true,
  },

  {
    "kosayoda/nvim-lightbulb",
  },

  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "folke/snacks.nvim",
        opts = {
          terminal = {},
        },
      },
    },
    event = "LspAttach",
    keys = {
      {
        "<leader>ca",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          if vim.api.nvim_buf_is_valid(bufnr) then
            require("tiny-code-action").code_action()
          else
            print("Invalid buffer!")
          end
        end,
        desc = "Code Action",
      },
    },
    opts = {},
  },

  { "wakatime/vim-wakatime", lazy = false },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- 启用默认快捷键
        default_commands = true, -- 启用命令
        disable_diagnostics = false,
        highlights = {
          incoming = "DiffAdd", -- 对方分支的改动高亮
          current = "DiffText", -- 当前分支的改动高亮
        },
      })
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
    -- config = function()
    --     require("nvim-surround").setup({
    --         -- Put your configuration here
    --     })
    -- end
  },
}
