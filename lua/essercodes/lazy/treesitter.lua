return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local langs = { 
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
            'vimdoc',
            'yaml',
            'zsh', 
        }
        local treesitter = require('nvim-treesitter')
        treesitter.setup()
        treesitter.install(langs)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = langs, 
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
