-- Custom keymaps on top of LazyVim defaults
local map = vim.keymap.set

-- Quick save
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Better window navigation (ctrl+hjkl already set by LazyVim)

-- Move lines up/down in visual mode (already set by LazyVim)

-- Clear search highlights
map("n", "<Esc>", "<cmd>noh<cr><Esc>", { desc = "Clear highlights" })

-- Tmux navigator integration (if using vim-tmux-navigator)
-- LazyVim already handles this via its tmux extra
