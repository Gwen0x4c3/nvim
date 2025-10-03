return {
  {
    "mikavilpas/yazi.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { "<leader>E", "<CMD>Yazi<CR>", desc = "[Yazi] open at the current file", mode = { "n", "v" } },
      { "<leader>cw", "<CMD>Yazi cwd<CR>", desc = "[Yazi] open in working directory" },
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
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
        },
        hidden = true,
        ignored = true,
      },
    },
  },
}