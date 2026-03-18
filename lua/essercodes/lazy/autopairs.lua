return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
            
			npairs.add_rules({
				Rule("```", "```", "opencode")
                    :with_pair(cond.not_before_char("`", 3)),
				Rule("```.*$", "```", "opencode")
                    :only_cr()
                    :use_regex(true),
			})
		end,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		-- Note that nvim-ts-autotag will not work unless you have treesitter
		-- parsers (like html) installed for a given filetype.
		"windwp/nvim-ts-autotag",
        opts = {
            aliases = {
                -- ["opencode"] = "html"
            }
        }
	},
}

