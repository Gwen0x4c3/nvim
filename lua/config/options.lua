vim.g.neovide_opacity = 0.6
vim.g.neovide_normal_opacity = 0.6
vim.g.transparency = 0.7

vim.g.neovide_remember_window_size = true
vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = true

vim.g.neovide_input_macos_option_key_is_meta = "only_left"

-- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray", bold = false })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffe5b4", bold = true })
-- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "gray", bold = false })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#87ceeb" })

-- Auto read files when changed outside of Neovim
vim.opt.autoread = true
vim.opt.relativenumber = false
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})

-- Disable autoformat by default
vim.g.autoformat = false
