-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- Use jj -> Escape
map("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Use cmd+c to copy and cmd+v to paste
map("v", "<D-c>", '"+y', { noremap = true, silent = true })
map("n", "<D-c>", '"+yy', { noremap = true, silent = true })
map("n", "<D-v>", '"+p', { noremap = true, silent = true })
map("i", "<D-v>", "<C-r>+", { noremap = true, silent = true })
-- Use cmd+x to cut
map("v", "<D-x>", '"+d', { noremap = true, silent = true })

-- Use option+delete to delete a word
map("i", "<A-Backspace>", "<C-w>", { noremap = true, silent = true })
-- Use cmd+delete to delete
map("i", "<D-Backspace>", "<C-u>", { noremap = true, silent = true })
map("n", "<D-Backspace>", "dd", { noremap = true, silent = true })

-- Use cmd+s to format changed lines, then save
map("n", "<D-s>", ":DiffFormat<CR>:w<CR>", { noremap = true, silent = true })
map("i", "<D-s>", "<Esc>:DiffFormat<CR>:w<CR>a", { noremap = true, silent = true })

-- Use cmd+a to select all
map("n", "<D-a>", "ggVG", { noremap = true, silent = true })
map("i", "<D-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- Use cmd+w to close buffer
vim.keymap.set("n", "<D-w>", function()
  require("snacks").bufdelete()
end, { desc = "Close buffer" })

-- Enable system clipboard access
vim.opt.clipboard = "unnamedplus"
-- Override delete operations to use black hole register (don't affect clipboard)
map({ "n", "v" }, "d", '"_d', { noremap = true })
map({ "n", "v" }, "D", '"_D', { noremap = true })
map({ "n", "v" }, "x", '"_x', { noremap = true })
map({ "n", "v" }, "X", '"_X', { noremap = true })
map("v", "c", '"_c', { noremap = true })
map("v", "C", '"_C', { noremap = true })

-- Map cmd+arrow keys to resize windows
map("n", "<D-Up>", ":resize +2<CR>", { noremap = true, silent = true })
map("n", "<D-Down>", ":resize -2<CR>", { noremap = true, silent = true })
map("n", "<D-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
map("n", "<D-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- ========= Plugins Keymaps =========
-- accelerated-jk plugin settings
vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

-- Use cmd+j to open terminal
vim.keymap.set("n", "<D-j>", "<cmd>lua require('snacks.terminal').toggle()<cr>", { desc = "Toggle Terminal" })
vim.keymap.set("t", "<D-j>", "<cmd>lua require('snacks.terminal').toggle()<cr>", { desc = "Toggle Terminal" })
