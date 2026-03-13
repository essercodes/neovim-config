return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"saghen/blink.cmp",
		version = "*",
		build = "cargo build --release",
		-- optional: provides snippets for the snippet source
		opts_extend = {
			"sources.completion.enabled_providers",
			"sources.compat",
			"sources.default",
		},
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
		},

		-- use a release tag to download pre-built binaries
		-- version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {

			keymap = {
				preset = "enter",
				["<C-u>"] = { "scroll_signature_up", "fallback" },
				["<C-d>"] = { "scroll_signature_down", "fallback" },

				-- default in all keymap presets
				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},

			signature = {
				enabled = true,

				window = { border = "rounded" }, -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
			},

			completion = {
				documentation = {
					auto_show = true,
					window = {
                        -- gap = 2,
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					},
				},
				menu = {
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					draw = {
                        gap = 2,
						treesitter = { "lsp" },
					},
				},
			},

			snippets = { preset = "luasnip" },
			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			cmdline = {
				enabled = true,
				keymap = {
					preset = "cmdline",
					["<Right>"] = false,
					["<Left>"] = false,
				},
				completion = {
					--[[ list = { selection = { preselect = false } },
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ":"
                    end,
                }, ]]
					ghost_text = { enabled = true },
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		-- See :h blink-cmp-config-keymap for defining your own keymap
		-- keymap = {
		-- 	-- preset = "default",
		-- 	preset = "enter",
		-- 	["<C-u>"] = { "scroll_signature_up", "fallback" },
		-- 	["<C-d>"] = { "scroll_signature_down", "fallback" },
		--
		-- 	-- default in all keymap presets
		-- 	["<leader>k"] = { "show_signature", "hide_signature", "fallback" },
		-- },
	},
}
