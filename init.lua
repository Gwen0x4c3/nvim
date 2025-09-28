-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.neovide_opacity = 0.5
vim.g.neovide_normal_opacity = 0.5
vim.g.transparency = 0.5

vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = true
vim.g.neovide_remember_window_size = true

vim.g.neovide_input_macos_option_key_is_meta = "only_left"

-- Auto read files when changed outside of Neovim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})

-- clipboard settings
local map = vim.keymap.set
vim.opt.clipboard = ""
map({ "n", "x" }, "y", '"+y')
map("n", "p", '""p')

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffe5b4", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "gray", bold = false })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#daa520" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#87ceeb" })
