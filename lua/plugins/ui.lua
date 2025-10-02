return {
  {
    "tveskag/nvim-blame-line",
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
            -- exclude = {
            -- "**/.git/*",
            --},
          },
        },
        hidden = true,
        ignored = true,
      },
    },
  },

  {
    "mikavilpas/yazi.nvim",
    dependencies = { "folke/snacks.nvim" },
    -- stylua: ignore
    keys = {
      { "<leader>E",  "<CMD>Yazi<CR>",        desc = "[Yazi] open at the current file", mode = { "n", "v" } },
      { "<leader>cw", "<CMD>Yazi cwd<CR>",    desc = "[Yazi] open in working directory"                     },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- enabled = false,
    config = function()
      require("lualine").setup({
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            "venv-selector", -- You can customize the look of the output, see below`.
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
}
