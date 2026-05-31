return {
	"sudo-tee/opencode.nvim",
	name = "opencode",
	config = function()
		require("opencode").setup({
			keymap = {
				input_window = {
					-- removed: became [M-m] cycles through agents
					-- ["<leader>oa"] = { "select_agent", mode = { "n" } },
					["<leader>oa"] = { function() require('opencode.api').select_agent() end, mode = { "n" } },
				},
			},
			hooks = {
				on_session_loaded = function()
					vim.o.wrap = true
					vim.o.linebreak = true
				end,
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
