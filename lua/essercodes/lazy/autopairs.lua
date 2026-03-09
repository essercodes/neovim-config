return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        -- Note that nvim-ts-autotag will not work unless you have treesitter 
        -- parsers (like html) installed for a given filetype.
        'windwp/nvim-ts-autotag',
    },
}

