return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself

		opts = {
			window = {
				position = "current",
			},
			filesystem = {
				filtered_items = {
					hide_hidden = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_ignored = false,
				},
				follow_current_file = {
					enabled = true,
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.opt_local.number = true
						vim.opt_local.relativenumber = true
					end,
				},
			},
		},
	},
}
