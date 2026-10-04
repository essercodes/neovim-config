return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader><leader>",
			function()
				require("which-key").show({ keys = "<c-w>"})
			end,
			desc = "Windows",
		},
	},
}
