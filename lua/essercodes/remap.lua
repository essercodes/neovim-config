-- 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move highlighted text down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move highlighted text up"})

-- 
vim.keymap.set("n", "J", "mzJ`z", {desc = "Keep cursor in place when appending next line"})

-- Center cursor after moving
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Center cursor after half-page down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Center cursor after half-page up"})
vim.keymap.set("n", "n", "nzzze", {desc = "Center cursor after repeat last search"})
vim.keymap.set("n", "N", "Nzzze", {desc = "Center cursor after reverse repeat last search"})
vim.keymap.set("n", "*", "*zzze", {desc = "Center cursor after search forward for the identifier under the cursor"})
vim.keymap.set("n", "#", "#zzze", {desc = "Center cursor after search backward for the identifier under the cursor"})

vim.keymap.set("n", "<leader>c", function()
	vim.lsp.buf.rename()
end, { desc = "LSP: Rename" })

vim.keymap.set("n", "<leader>pf", "<Cmd>Neotree<CR>", { desc = "Open file explorer" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], {desc = "Break terminal focus"})
vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]], {desc = "Break terminal focus"})
vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]], {desc = "Break focus and move to left pane"})
vim.keymap.set("t", "<C-w>j", [[<C-\><C-n><C-w>j]], {desc = "Break focus and move to below pane"})
vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]], {desc = "Break focus and move to above pane"})
vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]], {desc = "Break focus and move to right pane"})

vim.keymap.set("n", "<leader><leader>", "<C-w>", {"<C-w> window action alias"})
vim.keymap.set("n", "<leader>T", "<Cmd>below 20sp | terminal<CR>", {desc = "Open terminal split"})
