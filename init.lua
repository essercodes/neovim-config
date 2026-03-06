require("config.lazy")
vim.o.background = "dark"
vim.cmd([[
  colorscheme gruvbox
	set relativenumber number
	syntax on
	set ruler
	retab
	set softtabstop=2
	set cc=80
	set expandtab
	set tabstop=2
	set shiftwidth=2

	augroup make_settings " {
	    autocmd!
	    autocmd BufNewFile,BufRead Makefile set noexpandtab
	augroup END " }

]])

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
