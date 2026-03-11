return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search File Names" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search Git Files" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Grep Search Project" })

		vim.keymap.set("n", "<leader>gr", function()
			builtin.lsp_references()
		end, { desc = "LSP: Go to references" })
		vim.keymap.set("n", "<leader>gd", function()
			builtin.lsp_definitions()
		end, { desc = "LSP: Go to definitions" })
	end,
}
