return {
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     italic_comments = true,
  --     borderless_pickers = false,
  --   }
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        term_colors = true,
        dim_inactive = {
          enabled = false, -- 禁用，避免冲突
          shade = "dark",
          percentage = 0.15,
        },
        custom_highlights = function(colors)
          return {
            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
            FloatTitle = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
            VertSplit = { bg = "NONE" },
            WinSeparator = { bg = "NONE" },
            SignColumn = { bg = "NONE" },
            LineNr = { bg = "NONE" },
            CursorLineNr = { bg = "NONE" },
            DiagnosticSignError = { bg = "NONE" },
            DiagnosticSignWarn = { bg = "NONE" },
            DiagnosticSignInfo = { bg = "NONE" },
            DiagnosticSignHint = { bg = "NONE" },
            GitSignsAdd = { bg = "NONE" },
            GitSignsChange = { bg = "NONE" },
            GitSignsDelete = { bg = "NONE" },
          }
        end,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = { "bold" },
          keywords = { "bold" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = { "bold" },
          operators = {},
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = true,
          telescope = { enabled = true },
          which_key = true,
          indent_blankline = { enabled = true },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
