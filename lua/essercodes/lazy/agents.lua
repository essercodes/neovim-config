return {
	{
		"nickjvandyke/opencode.nvim",
		-- version = "*", -- Latest stable release
		config = function()
			local port = 4096 + (vim.fn.getpid() % 1000)
			local server_url = "http://127.0.0.1:" .. port

			-- One random password per Neovim session, inherited by every child process
			local password = vim.fn.sha256(tostring(vim.uv.hrtime())):sub(1, 32)
			vim.env.OPENCODE_PASSWORD = password
			vim.env.OPENCODE_SERVER_PASSWORD = password

			-- Run a command through an interactive bash so it gets your shell's PATH
			local function shell(cmd)
				return { "bash", "-ic", "exec " .. cmd }
			end

			-- Open a terminal job in a new split; its process lives as long as the buffer
			local function open_term(split_cmd, cmd, opts)
				local prev_win = vim.api.nvim_get_current_win()
				vim.cmd(split_cmd)
				local buf = vim.api.nvim_get_current_buf()
				vim.fn.jobstart(cmd, vim.tbl_extend("force", { term = true }, opts or {}))
				vim.bo[buf].bufhidden = "hide" -- closing the window hides it, doesn't kill it
				vim.api.nvim_set_current_win(prev_win)
				return buf
			end

			-- Start a terminal job in a listed buffer without opening a window
			local function background_term(cmd, opts)
				local buf = vim.api.nvim_create_buf(true, false)
				vim.bo[buf].bufhidden = "hide"
				vim.api.nvim_buf_call(buf, function()
					vim.fn.jobstart(cmd, vim.tbl_extend("force", { term = true }, opts or {}))
				end)
				return buf
			end

			local server_buf
			local ready = false
			local waiters = {}

			local function flush(url)
				local pending = waiters
				waiters = {}
				for _, cb in ipairs(pending) do
					cb(url)
				end
			end

			local function start_tui()
				local tui_buf = open_term("botright vnew", shell("opencode --server " .. server_url))
				-- Killing the server buffer also closes the TUI, which is useless without it
				vim.api.nvim_create_autocmd("BufWipeout", {
					buffer = server_buf,
					once = true,
					callback = function()
						vim.schedule(function()
							if vim.api.nvim_buf_is_valid(tui_buf) then
								vim.api.nvim_buf_delete(tui_buf, { force = true })
							end
						end)
					end,
				})
			end

			-- Called by the plugin on every server lookup; starts the server on first use
			local function ensure_server(cb)
				if ready then
					return cb(server_url)
				end
				table.insert(waiters, cb)
				if server_buf then
					return -- already starting; cb fires once it's listening
				end

				server_buf = background_term(shell("opencode serve --port " .. port), {
					on_stdout = function(_, data)
						if ready then
							return
						end
						for _, line in ipairs(data) do
							if line:lower():find("listening") then
								ready = true
								vim.schedule(function()
									start_tui()
									flush(server_url)
								end)
								return
							end
						end
					end,
					on_exit = function()
						ready = false
						server_buf = nil
						vim.schedule(function()
							flush(nil)
						end)
					end,
				})

				-- Don't leave the plugin hanging if the server never comes up
				vim.defer_fn(function()
					if not ready then
						flush(nil)
					end
				end, 15000)
			end

			-- Set the function directly on the merged opts so it isn't converted by vim.g
			require("opencode.config").opts.server.url = ensure_server

			---@type opencode.Opts
			vim.g.opencode_opts = {
				server = {
					password = password,
				},
			}

			-- ...your keymaps unchanged...
			-- Recommended/example keymaps
			vim.keymap.set({ "n", "x" }, "<leader>ao", "", { desc = "AI/Opencode" })
			vim.keymap.set({ "n", "x" }, "<leader>aoa", function()
				require("opencode").ask("@this: ")
			end, { desc = "Ask OpenCode…" })
			vim.keymap.set({ "n", "x" }, "<leader>aos", function()
				require("opencode").select()
			end, { desc = "Select OpenCode…" })
			vim.keymap.set({ "n", "x" }, "<leader>aot", function()
				return require("opencode").operator("@this ")
			end, { desc = "Append range to OpenCode", expr = true })
			vim.keymap.set({ "n" }, "<leader>aoo", function()
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
	{
		"coder/claudecode.nvim",
		-- dependencies = { "folke/snacks.nvim" },
		opts = function()
			local sh = vim.env.SHELL or "bash"
			return {
				terminal_cmd = sh .. [[ -ic 'exec claude "$@"' claude]],
				terminal = {
					provider = "native", -- built-in :terminal instead of snacks
				},
			}
		end,
		cmd = {
			"ClaudeCode",
			"ClaudeCodeFocus",
			"ClaudeCodeSelectModel",
			"ClaudeCodeAdd",
			"ClaudeCodeSend",
			"ClaudeCodeTreeAdd",
			"ClaudeCodeStatus",
			"ClaudeCodeStart",
			"ClaudeCodeStop",
			"ClaudeCodeOpen",
			"ClaudeCodeClose",
			"ClaudeCodeDiffAccept",
			"ClaudeCodeDiffDeny",
			"ClaudeCodeCloseAllDiffs",
		},
		keys = {
			{ "<leader>ac", nil, desc = "AI/Claude Code" },
			{ "<leader>acc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>acf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>acr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>acC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>acm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>acb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>acs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>acs",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
			},
			-- Diff management
			{ "<leader>aca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>acd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
}
