--require'nvim-treesitter'.uninstall{'c', 'rust', 'javascript', 'typescript', 'go', 'lua', 'java', 'kotlin', 'zsh', 'bash', 'csv', 'dart', 'dockerfile', 'gitignore', 'jsx', 'tsx', 'mermaid', 'terraform', 'yaml', 'python', 'make', 'markdown', 'markdown_inline'}

require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'bash',
		'c', 
		'csv',
		'dart',
		'dockerfile',
		'gitignore',
		'go',
		'java',
		'javascript', 
		'jsx',
		'kotlin',
		'lua',
		'make',
		'markdown',
		'markdown_inline',
		'mermaid',
		'python',
		'rust', 
		'terraform',
		'tsx',
		'typescript', 
		'yaml',
		'zsh',
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	sync_install = false,

	auto_install = true,
}
