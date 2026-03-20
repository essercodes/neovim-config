return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
        popupmenu = { enabled = false },
		lsp = {
			signature = { enabled = false }, -- let blink.cmp handle signature help
			hover = { enabled = false },
			override = {
				["vim.lsp.util.stylize_markdown"] = true,
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
		},
		routes = {},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		{ "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
	},
}
