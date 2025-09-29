return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable native code action and replace it with tiny-code-action.nvim
      keys[#keys + 1] = { "<leader>ca", false }
    end,
  },
}
