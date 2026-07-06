return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	opts = {
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = "<leader>//",
			---Block-comment toggle keymap
			block = "<leader>??",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment toggle keymap
			line = "<leader>/",
			---Block-comment toggle keymap
			block = "<leader>?",
		},
		---LHS of extra mappings
		extra = {
			---Add comment on the line above
			above = "<leader>/O",
			-- -Add comment on the line below
			below = "<leader>/o",
			---Add comment at the end of line
			eol = "<leader>/A",
		},
		---Enable keybindings
		---NOTE: If given `false` then the plugin won't create any mappings
		mappings = {
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
		pre_hook = function(ctx)
			return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
		end,
	},
}
