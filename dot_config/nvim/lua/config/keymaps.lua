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

-- Code companion keybinds
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set(
  { "n", "v" },
  "<leader>a",
  "<cmd>CodeCompanionChat Toggle<cr>",
  { noremap = true, silent = true, desc = "Toggle CodeCompanionChat" }
)
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

-- Function to create decorative comment header
local function create_comment_header()
  local line = vim.api.nvim_get_current_line()
  local text = vim.fn.input("Header text: ")
  
  if text == "" then
    return
  end
  
  -- Get comment string for current filetype
  local commentstring = vim.bo.commentstring
  local comment_char = commentstring:match("(.*)%%s") or "#"
  comment_char = vim.trim(comment_char)
  
  -- Create the header (total width of 70 characters)
  local text_with_spaces = " " .. text:upper() .. " "
  local total_width = 70
  local text_width = #text_with_spaces
  local remaining = total_width - text_width
  local left_padding = math.floor(remaining / 2)
  local right_padding = remaining - left_padding
  
  local header = comment_char .. string.rep("#", left_padding) .. text_with_spaces .. string.rep("#", right_padding)
  
  -- Insert the header at current line
  vim.api.nvim_set_current_line(header)
end
-- Keybind to create comment header
vim.keymap.set("n", "<leader>ch", create_comment_header, { desc = "Create comment header" })
