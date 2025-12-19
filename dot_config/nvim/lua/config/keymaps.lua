-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- <leader>r to replace word under cursor
vim.keymap.set('n', '<leader>r', ':%s/\\V\\<<C-r><C-w>\\>//g<Left><Left>', { desc = 'Replace word under cursor' })
