return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			-- lspconfig names; mason-lspconfig maps these to packages
			local servers = {
				"basedpyright",
				"bashls",
				"eslint",
				"lua_ls",
				"rust_analyzer",
				"tailwindcss",
				"terraformls",
				"vimls",
				"vtsls",
			}
			-- mason package names; linters/formatters with no LSP
			local tools = {
                "cspell",
                "editorconfig-checker",
                "shellcheck",
                "vint" 
            }

			require("mason").setup()
			require("mason-lspconfig").setup({ ensure_installed = servers })

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				local registry = require("mason-registry")
				registry.refresh()

				-- translate server names -> package names
				local map = require("mason-lspconfig").get_mappings().lspconfig_to_package
				local packages = vim.deepcopy(tools)
				for _, s in ipairs(servers) do
					table.insert(packages, map[s] or s)
				end

				local pending = 0
				for _, name in ipairs(packages) do
					local ok, pkg = pcall(registry.get_package, name)
					if not ok then
						vim.notify("unknown mason package: " .. name, vim.log.levels.ERROR)
					elseif not pkg:is_installed() then
						pending = pending + 1
						print("installing " .. name)
						pkg:install():once("closed", function()
							pending = pending - 1
							print("done " .. name)
						end)
					end
				end

				-- block until everything settles, so --headless can exit cleanly
				vim.wait(600000, function()
					return pending == 0
				end, 200)
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
