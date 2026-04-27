return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            "venv-selector",
            "encoding",
            "fileformat",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- ~/.config/nvim/lua/plugins/snacks.lua
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            git_status = true,
            follow_file = true,
          },
        },
        icons = {
          git = {
            enabled = true,
            staged = "✓",
            added = "+",
            deleted = "-",
            modified = "~",
            untracked = "?",
          },
        },
      },
    },
  }
}
