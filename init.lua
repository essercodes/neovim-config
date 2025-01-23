require("config.lazy")
vim.o.background = 'dark'
vim.cmd([[
    colorscheme gruvbox
	set relativenumber number
	syntax on
	set ruler
	retab
	set softtabstop=4
	set cc=80
	set expandtab
	set tabstop=4
	set shiftwidth=4

	augroup make_settings " {
	    autocmd!
	    autocmd BufNewFile,BufRead Makefile set noexpandtab
	augroup END " }
]])

