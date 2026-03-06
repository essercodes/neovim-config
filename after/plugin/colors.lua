
function ColorMyPencils(color)
	require("gruvbox").setup({
		contrast = "hard",
		transparent_mode = true,
	})

	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	-- Set Transparent
	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) 
end

ColorMyPencils()
