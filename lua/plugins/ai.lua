return {
  -- {
  --   "NickvanDyke/opencode.nvim",
  --   dependencies = {
  --     { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  --   },
  --   config = function()
  --     vim.g.opencode_opts = {}
  --     vim.opt.autoread = true
  --
  --     vim.keymap.set("n", "<leader>ot", function()
  --       require("opencode").toggle()
  --     end, { desc = "Toggle embedded" })
  --     vim.keymap.set("n", "<leader>oA", function()
  --       require("opencode").ask()
  --     end, { desc = "Ask" })
  --     vim.keymap.set("n", "<leader>oa", function()
  --       require("opencode").ask("@cursor: ")
  --     end, { desc = "Ask about this" })
  --     vim.keymap.set("v", "<leader>oa", function()
  --       require("opencode").ask("@selection: ")
  --     end, { desc = "Ask about selection" })
  --     vim.keymap.set("n", "<leader>oe", function()
  --       require("opencode").prompt("Explain @cursor and its context")
  --     end, { desc = "Explain this code" })
  --     vim.keymap.set("n", "<leader>o+", function()
  --       require("opencode").prompt("@buffer", { append = true })
  --     end, { desc = "Add buffer to prompt" })
  --     vim.keymap.set("v", "<leader>o+", function()
  --       require("opencode").prompt("@selection", { append = true })
  --     end, { desc = "Add selection to prompt" })
  --     vim.keymap.set("n", "<leader>on", function()
  --       require("opencode").command("session_new")
  --     end, { desc = "New session" })
  --     vim.keymap.set("n", "<S-C-u>", function()
  --       require("opencode").command("messages_half_page_up")
  --     end, { desc = "Messages half page up" })
  --     vim.keymap.set("n", "<S-C-d>", function()
  --       require("opencode").command("messages_half_page_down")
  --     end, { desc = "Messages half page down" })
  --     vim.keymap.set({ "n", "v" }, "<leader>os", function()
  --       require("opencode").select()
  --     end, { desc = "Select prompt" })
  --   end,
  -- },

  -- {
  --   "coder/claudecode.nvim",
  --   dependencies = { "folke/snacks.nvim" },
  --   config = true,
  --   keys = {
  --     { "<leader>a", nil, desc = "AI/Claude Code" },
  --     { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
  --     { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  --     { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
  --     { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
  --     { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
  --     { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
  --     { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  --     {
  --       "<leader>as",
  --       "<cmd>ClaudeCodeTreeAdd<cr>",
  --       desc = "Add file",
  --       ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
  --     },
  --     { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
  --     { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  --   },
  -- },
  {
    "https://code.byted.org/chenjiaqi.cposture/codeverse.vim.git",
    dependencies = {
      "hrsh7th/nvim-cmp", -- 必须保留
    },
    config = function() end,
  },

  -- ~/.config/nvim/lua/plugins/sidekick.lua
  {
    "folke/sidekick.nvim",
    event = "VeryLazy",
    opts = {
      cli = {
        tools = {
          coco = {
            cmd = { "coco" },
            title = "Coco AI",
          },
          aiden = {
            cmd = { "aiden" },
            title = "Aiden CLI",
          },
        },
        mux = {
          enabled = true,
          backend = "tmux",
        }
      },
    },
    keys = {
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        desc = "Sidekick Focus",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
}
