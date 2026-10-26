return {
	"jmbuhr/otter.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {},
	init = function()
		-- LSP features (diagnostics, hover, completion) for SQL embedded in strings;
		-- requiring otter lazy-loads the plugin on first matching buffer
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "python", "javascript", "javascriptreact", "typescript", "typescriptreact", "rust", "java", "markdown" },
			callback = function()
				require("otter").activate({ "sql" });
			end,
		});
	end,
}
