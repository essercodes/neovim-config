return {
    {
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
                'html',
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
                'sql',
                'terraform',
                'tsx',
                'typescript',
                'vimdoc',
                'xml',
                'yaml',
                'zsh', 
            }
            -- (#sql? @capture): node text looks like an uppercase SQL statement;
            -- used by after/queries/*/injections.scm to inject sql into strings
            local sql_patterns = {
                '^SELECT%s.-%sFROM%s',
                '^INSERT%s+INTO%s',
                '^UPDATE%s.-%sSET%s',
                '^DELETE%s+FROM%s',
                '^WITH%s.-%sAS%s*%(',
                '^CREATE%s.-TABLE%s',
                '^CREATE%s.-INDEX%s',
                '^ALTER%s+TABLE%s',
                '^DROP%s+TABLE%s',
            }
            vim.treesitter.query.add_predicate('sql?', function(match, _, source, pred)
                for _, node in ipairs(match[pred[2]] or {}) do
                    local text = vim.treesitter.get_node_text(node, source):gsub('^[`\'"]', ''):gsub('^%s+', '')
                    for _, pattern in ipairs(sql_patterns) do
                        if text:find(pattern) then
                            return true
                        end
                    end
                end
                return false
            end, { force = true })

            local treesitter = require('nvim-treesitter')
            treesitter.setup()
            treesitter.install(langs)
            vim.api.nvim_create_autocmd('FileType', {
                -- .jsx/.tsx filetypes differ from their parser names
                pattern = vim.list_extend(vim.deepcopy(langs), { 'javascriptreact', 'typescriptreact' }),
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            "nvim-treesitter",
        }
    }
}
