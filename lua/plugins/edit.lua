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
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
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
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    enabled = true,
    opts = {
      signcolumn = true,
      numhl = false,
      current_line_blame = true,
      attach_to_untracked = true,
      preview_config = {
        border = "rounded",
      },
      on_attach = function(bufnr)
        -- Toggles
        require("snacks")
          .toggle({
            name = "line blame",
            get = function()
              return require("gitsigns.config").config.current_line_blame
            end,
            set = function(enabled)
              require("gitsigns").toggle_current_line_blame(enabled)
            end,
          })
          :map("<leader>gt")
        require("snacks")
          .toggle({
            name = "word diff",
            get = function()
              return require("gitsigns.config").config.word_diff
            end,
            set = function(enabled)
              require("gitsigns").toggle_word_diff(enabled)
            end,
          })
          :map("<leader>gw")
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  {
    "kosayoda/nvim-lightbulb",
  },

  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- { "nvim-telescope/telescope.nvim" },
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
          require("tiny-code-action").code_action()
        end,
        desc = "Code Action",
      },
    },
    opts = {},
  },
}
