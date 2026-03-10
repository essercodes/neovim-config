vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function()
  local file = vim.fn.expand('%:p')
  if vim.fn.filereadable(file) == 1 then
    vim.cmd("Neotree action=focus position=float reveal_file=" .. file)
  else
    vim.cmd("Neotree action=focus position=float")
  end
end)
vim.g.maplocalleader = "\\"

