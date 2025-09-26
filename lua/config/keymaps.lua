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

-- Use cmd+s to save buffer
map("n", "<D-s>", ":w<CR>", { noremap = true, silent = true })
map("i", "<D-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

-- Use cmd+w to close buffer
map("n", "<D-w>", ":bd<CR>", { noremap = true, silent = true })
