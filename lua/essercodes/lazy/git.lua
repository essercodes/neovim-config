return {
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required

			-- Only one of these is needed.
			"sindrets/diffview.nvim", -- optional
			-- "esmuellert/codediff.nvim", -- optional

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit kind=replace<cr>", desc = "Show Neogit UI (replace)" },
			{ "<leader>gG", "<cmd>Neogit kind=tab<cr>", desc = "Show Neogit UI (tab)" },
			{ "<leader>gs", "<cmd>Neogit kind=split<cr>", desc = "Show Neogit UI (split)" },
		},
	},
}
