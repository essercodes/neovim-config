return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {},
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				-- "rust_analyzer",
				-- "gopls",
				"vtsls",
				"tailwindcss",
				"eslint",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				vim.lsp.config("lua_ls", {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
								path = {
									"lua/?.lua",
									"lua/?/init.lua",
								},
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							format = {
								enable = true,
								-- Put format options here
								-- NOTE: the value should be STRING!!
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
								},
							},
						},
					},
				}),

				vim.lsp.config("tailwindcss", {
					filetypes = {
						"html",
						"css",
						"scss",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"svelte",
						"heex",
					},
				}),
			},
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
