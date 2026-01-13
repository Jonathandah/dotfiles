-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- <leader>r to replace word under cursor
vim.keymap.set("n", "<leader>r", ":%s/\\V\\<<C-r><C-w>\\>//g<Left><Left>", { desc = "Replace word under cursor" })

-- <leader>dl to insert console.log for word under cursor
vim.keymap.set("n", "<leader>dd", function()
  local word = vim.fn.expand("<cword>")
  local buf = 0
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local last = vim.api.nvim_buf_line_count(buf)

  while row <= last do
    local line = vim.api.nvim_buf_get_lines(buf, row - 1, row, false)[1]

    if line:match(";[%s]*$") or line:match("}%s*$") then
      vim.api.nvim_buf_set_lines(buf, row, row, false, { 'console.log("' .. word .. ':", ' .. word .. ");" })
      return
    end

    row = row + 1
  end
end, { desc = "Smart console.log placement" })

-- Center the cursor after scrolling with Ctrl+d and Ctrl+u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
