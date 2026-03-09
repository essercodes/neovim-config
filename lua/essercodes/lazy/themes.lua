return {
    {
        "ellisonleao/gruvbox.nvim", 
        name = "gruvbox",
        priority = 1000, 
        config = function()
            require('gruvbox').setup({
                contrast = "hard",
                transparent_mode = true,
            })
            vim.o.background = "dark"
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}

