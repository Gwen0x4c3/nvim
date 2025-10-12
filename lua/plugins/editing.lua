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

  { 'wakatime/vim-wakatime', lazy = false }
}

