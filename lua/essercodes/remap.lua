
-- Move highlighted text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when appending next line
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor after moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzze")
vim.keymap.set("n", "n", "nzzze")
vim.keymap.set("n", "n", "nzzze")

vim.keymap.set("n", "<leader>c", function()
    vim.lsp.buf.rename()
end, {desc = "LSP: Rename"})

-- Open file explorer
vim.keymap.set("n", "<leader>pv", function()
  local file = vim.fn.expand('%:p')
  if vim.fn.filereadable(file) == 1 then
    vim.cmd("Neotree action=focus position=current reveal_file=" .. file)
  else
    vim.cmd("Neotree action=focus position=current")
  end
end, {desc = "Project View"})

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-[>', [[<C-\><C-n>]])
