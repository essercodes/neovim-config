return {
	"sudo-tee/opencode.nvim",
	name = "opencode",
	config = function()
		require("opencode").setup({
			keymap = {
				input_window = {
					["<leader>oa"] = { "select_agent", mode = { "n" } },
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				anti_conceal = { enabled = false },
				file_types = { "markdown", "opencode_output" },
			},
			ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
		},
		"saghen/blink.cmp",
		"folke/snacks.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
