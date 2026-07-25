return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
            local ensure_installed = {
					"basedpyright",
					"bash-language-server",
                    "cspell",
					"editorconfig-checker",
					"lua_ls",
					"shellcheck",
					"terraformls",
					"shellcheck",
					"tailwindcss",
					"eslint",
					"rust_analyzer",
					"vim-language-server",
					"vint",
					"vtsls",
				}

			require("mason").setup()
			require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
            })

            vim.api.nvim_create_user_command("MasonInstallAll", function ()
              vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
            end, {})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					-- "delve",
				},
				automatic_installation = false,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
					delve = function(config)
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file args",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
}
