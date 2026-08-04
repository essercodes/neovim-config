return {
	{
		"nickjvandyke/opencode.nvim",
		version = "*", -- Latest stable release
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Your configuration, if any; goto definition on the type for details
				server = {
					url = "localhost:4096",
					start = function()
						os.execute("tmux split-window -h -- bash -ic 'opencode --port 4096'")
					end,
				},
			}

			-- Recommended/example keymaps
			vim.keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ")
			end, { desc = "Ask OpenCode…" })
			vim.keymap.set({ "n", "x" }, "<leader>os", function()
				require("opencode").select()
			end, { desc = "Select OpenCode…" })
			vim.keymap.set({ "n", "x" }, "<leader>ot", function()
				return require("opencode").operator("@this ")
			end, { desc = "Append range to OpenCode", expr = true })
			vim.keymap.set({ "n" }, "<leader>oo", function()
				return require("opencode").operator("@this ") .. "_"
			end, { desc = "Append line to OpenCode", expr = true })
			vim.keymap.set({ "n" }, "<S-C-u>", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "Scroll OpenCode up" })
			vim.keymap.set({ "n" }, "<S-C-d>", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "Scroll OpenCode down" })
		end,
	},
}
