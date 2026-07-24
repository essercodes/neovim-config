return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {},
		})

		require("fidget").setup({})
		-- Apply blink.cmp capabilities to all LSP servers
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- -- Server-specific configurations
		-- vim.lsp.config("pylsp", {
		-- 	settings = {
		-- 		pylsp = {
		-- 			plugins = {
		-- 				pycodestyle = {
		-- 					ignore = {
		-- 						"E303",
		-- 						"W391",
		-- 					},
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
        vim.lsp.config("basedpyright", {
            settings = {
                basedpyright = {
                  analysis = {
                    diagnosticMode = "openFilesOnly",
                    inlayHints = {
                      callArgumentNames = true
                    }
                  }
                }
              }
        })

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
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
				},
			},
		})

		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							enforce = true,
							group = "crate",
						},
					},
					cargo = {
						allFeatures = true,
					},
					inlayHints = { locationLinks = false },
					diagnostics = {
						enable = true,
						experimental = {
							enable = true,
						},
					},
				},
			},
		})

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
		})

		vim.lsp.enable("terraformls")

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
