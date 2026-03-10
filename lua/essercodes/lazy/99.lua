return {
    "ThePrimeagen/99",
    config = function()
        local _99 = require("99")
        local cwd = vim.uv.cwd()
        local basename = vim.fs.basename(cwd)

        _99.setup({
            logger = {
                level = _99.DEBUG,
                path = "/tmp/" .. basename .. ".99.debug",
                print_on_error = true,
            },
            tmp_dir = "./.tmp/nvim99",
            model = "opencode/minimax-m2.5-free",

            --- Completions: #rules and @files in the prompt buffer
            completion = {
                custom_rules = {
                    "scratch/custom_rules/",
                },

                --- Configure @file completion (all fields optional, sensible defaults)
                files = { },
                source = "native", -- "native" (default), "cmp", or "blink"
            },

            md_files = {
                "AGENT.md",
            },
        })

        vim.keymap.set("v", "<leader>9v", function()
            _99.visual()
        end)

        vim.keymap.set("n", "<leader>9x", function()
            _99.stop_all_requests()
        end)

        vim.keymap.set("n", "<leader>9s", function()
            _99.search()
        end)

        vim.keymap.set("n", "<leader>9l", function()
            _99.view_logs()
        end)

        vim.keymap.set("n", "<leader>9m", function()
            require("99.extensions.telescope").select_model()
        end)

        vim.keymap.set("n", "<leader>9p", function()
            require("99.extensions.telescope").select_provider()
        end)
    end,
}
