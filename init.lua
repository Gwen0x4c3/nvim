-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.neovide_opacity = 0.5
vim.g.neovide_normal_opacity = 0.5
vim.g.transparency = 0.5

vim.g.neovide_remember_window_size = true
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
-- Enable system clipboard access
vim.opt.clipboard = "unnamedplus"
-- Override delete operations to use black hole register (don't affect clipboard)
map({ "n", "v" }, "d", '"_d', { noremap = true })
map({ "n", "v" }, "D", '"_D', { noremap = true })
map({ "n", "v" }, "x", '"_x', { noremap = true })
map({ "n", "v" }, "X", '"_X', { noremap = true })
map("v", "c", '"_c', { noremap = true })
map("v", "C", '"_C', { noremap = true })

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffe5b4", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "gray", bold = false })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#daa520" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#87ceeb" })
