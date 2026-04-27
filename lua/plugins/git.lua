return {
  -- {
  --   "tveskag/nvim-blame-line",
  -- },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit current file" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    enabled = true,
    opts = {
      signcolumn = true,
      numhl = true,
      current_line_blame = true,
      attach_to_untracked = true,
      preview_config = {
        border = "rounded",
      },
      on_attach = function(bufnr)
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
}

