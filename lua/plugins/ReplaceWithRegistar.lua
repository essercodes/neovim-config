return {
{
	'inkarkat/vim-ReplaceWithRegister',
	config = function()
		vim.api.nvim_set_keymap('n', '<Leader>gr', '"+gr', { noremap = false, silent = true })
	end,
},
}
