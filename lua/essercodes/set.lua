vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number=true
vim.o.relativenumber=true
vim.o.ruler=true
vim.o.colorcolumn="80"

vim.o.smartindent=true
vim.o.wrap=false

vim.o.swapfile=false
vim.o.backup=false
vim.o.undodir=os.getenv("HOME") .. "/.vim/undotree"
vim.o.undofile=true

vim.o.hlsearch=false
vim.o.incsearch=true

vim.o.termguicolors=true

vim.o.scrolloff=8
vim.o.signcolumn='yes'

vim.o.updatetime=50

vim.o.expandtab=true
vim.o.shiftwidth=4
vim.o.tabstop=4

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = 'Makefile',
    command = 'set noexpandtab',
})

