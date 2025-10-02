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

-- Replace autoformat with diff format
vim.g.autoformat = false
vim.api.nvim_create_user_command("DiffFormat", function()
  local hunks = require("gitsigns").get_hunks()
  local format = require("conform").format
  for i = #hunks, 1, -1 do
    local hunk = hunks[i]
    if hunk ~= nil and hunk.type ~= "delete" then
      local start = hunk.added.start
      local last = start + hunk.added.count
      -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
      local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
      format({ range = range })
    end
  end
end, { desc = "Format changed lines" })
