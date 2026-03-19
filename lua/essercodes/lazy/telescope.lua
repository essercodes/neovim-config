return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},

	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
        require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search File Names" })
		vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Search Buffers" })
		vim.keymap.set("n", "<leader>pr", builtin.oldfiles, { desc = "Search Recent Files" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Search Git Files" })
		-- vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Grep Search Project" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Grep Search Project" })

		vim.keymap.set("n", "<leader>ss", builtin.spell_suggest, { desc = "Search Spelling" })
		vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "Search Marks" })
		vim.keymap.set("n", "<leader>sr", builtin.registers, { desc = "Search Registers" })
		vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "Search Jump-list" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymap" })
		vim.keymap.set("n", "<leader>sh", builtin.man_pages, { desc = "Search Man Pages" })

		local function pick_file(action_fn)
			local search_dir = vim.fn.input("Search directory: ", vim.fn.getcwd(), "dir")
			if search_dir == "" then
				search_dir = vim.fn.getcwd()
			end

			require("telescope.builtin").find_files({
				cwd = search_dir,
				attach_mappings = function(prompt_bufnr, map)
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")

					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local buf_dir = vim.fn.expand("%:p:h")
						local selection = action_state.get_selected_entry()
						local absolute = selection.path
						local relative_buf = buf_dir ~= "" and ("." .. absolute:sub(#buf_dir + 1)) or absolute
						local relative_cwd = vim.fn.fnamemodify(selection.path, ":p:.")
						local filename = vim.fn.fnamemodify(selection.path, ":t")
						local relative_home = vim.fn.fnamemodify(selection.path, ":p:~")

						vim.ui.select({ relative_cwd, relative_buf, absolute, filename, relative_home }, {
							prompt = "Choose path:",
						}, function(choice)
							if choice then
								action_fn(choice)
							end
						end)
					end)
					return true
				end,
			})
		end

		vim.keymap.set("n", "<leader>sf", function()
			pick_file(function(choice)
				vim.api.nvim_put({ choice }, "c", true, true)
			end)
		end, { desc = "Find & paste Filename" })

		vim.keymap.set("n", "<leader>sF", function()
			pick_file(function(choice)
				vim.fn.setreg('"', choice)
				vim.notify("Copied: " .. choice)
			end)
		end, { desc = "Find & yank Filename" })

		vim.keymap.set("n", "<leader>gr", function()
			builtin.lsp_references()
		end, { desc = "LSP: Go to References" })
		vim.keymap.set("n", "<leader>gd", function()
			builtin.lsp_definitions()
		end, { desc = "LSP: Go to Definitions" })
		vim.keymap.set("n", "<leader>gi", function()
			builtin.lsp_implementations()
		end, { desc = "LSP: Go to Implementations" })
		vim.keymap.set("n", "<leader>gt", function()
			builtin.lsp_type_definitions()
		end, { desc = "LSP: Go to Type Definitions" })
	end,
}
