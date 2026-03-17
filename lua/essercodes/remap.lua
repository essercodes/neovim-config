vim.keymap.set({"n", "v"}, "j", "gj")
vim.keymap.set({"n", "v"}, "k", "gk")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Keep cursor in place when appending next line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after half-page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after half-page up" })
vim.keymap.set("n", "n", "nzzze", { desc = "Center cursor after repeat last search" })
vim.keymap.set("n", "N", "Nzzze", { desc = "Center cursor after reverse repeat last search" })
vim.keymap.set("n", "*", "*zzze", { desc = "Center cursor after search forward for the identifier under the cursor" })
vim.keymap.set("n", "#", "#zzze", { desc = "Center cursor after search backward for the identifier under the cursor" })

vim.keymap.set("n", "<leader>c", function()
	vim.lsp.buf.rename()
end, { desc = "LSP: Rename" })

-- Open file explorer

vim.keymap.set("n", "<leader>pv", function()
	local file = vim.fn.expand("%:p")
	if vim.fn.filereadable(file) == 1 then
		vim.cmd("Neotree reveal_file=" .. file)
	else
		vim.cmd("Neotree")
	end
end, { desc = "Project View" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Break terminal focus" })
vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]], { desc = "Break terminal focus" })
vim.keymap.set("t", "<C-w>h", [[<C-\><C-n><C-w>h]], { desc = "Break focus and move to left pane" })
vim.keymap.set("t", "<C-w>j", [[<C-\><C-n><C-w>j]], { desc = "Break focus and move to below pane" })
vim.keymap.set("t", "<C-w>k", [[<C-\><C-n><C-w>k]], { desc = "Break focus and move to above pane" })
vim.keymap.set("t", "<C-w>l", [[<C-\><C-n><C-w>l]], { desc = "Break focus and move to right pane" })

vim.keymap.set("n", "<leader><leader>", "<C-w>", { desc = "<C-w> window action alias" })
vim.keymap.set("t", "<leader><leader>h", [[<C-\><C-n><C-w>h]], { desc = "Break focus and move to left pane" })
vim.keymap.set("t", "<leader><leader>j", [[<C-\><C-n><C-w>j]], { desc = "Break focus and move to below pane" })
vim.keymap.set("t", "<leader><leader>k", [[<C-\><C-n><C-w>k]], { desc = "Break focus and move to above pane" })
vim.keymap.set("t", "<leader><leader>l", [[<C-\><C-n><C-w>l]], { desc = "Break focus and move to right pane" })
vim.keymap.set("n", "<leader>T", "<Cmd>below 20sp | terminal<CR>", { desc = "Open terminal split" })
