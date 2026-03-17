vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.colorcolumn = "80"

vim.o.smartindent = true
vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undotree"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.updatetime = 50

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.list = true
-- vim.o.listchars='tab:>-,space:·,nbsp:␣,conceal:☠,trail:•,eol:¶,precedes:«,extends:»'
vim.o.listchars = "tab:>-,space:·,nbsp:␣,conceal:☠,trail:•,precedes:«,extends:»"

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "Makefile", "*.yaml" },
	command = "set noexpandtab",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.md" },
	callback = function()
		vim.o.wrap = true
		vim.o.linebreak = true
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
	desc = "Set terminal to insert mode",
})
