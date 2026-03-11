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
		vim.keymap.set("n", "<leader>po", builtin.oldfiles, { desc = "Search Old Files" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Search Git Files" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Grep Search Project" })

		vim.keymap.set("n", "<leader>ss", builtin.spell_suggest, { desc = "Search Spelling" })
		vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "Search Marks" })
		vim.keymap.set("n", "<leader>sr", builtin.registers, { desc = "Search Registers" })
		vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "Search Jump-list" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymap" })
		vim.keymap.set("n", "<leader>sh", builtin.man_pages, { desc = "Search Man Pages" })

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
