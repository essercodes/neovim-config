vim.o.relativenumber=true
vim.o.ruler=true
vim.o.colorcolumn="80,100"
vim.o.expandtab=true
vim.o.shiftwidth=4
vim.o.tabstop=4

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = 'Makefile',
    command = 'set noexpandtab',
})
