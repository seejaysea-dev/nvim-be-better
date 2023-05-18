function ColorMePretty(color)
	color = color or 'rose-pine'
	vim.cmd.colorscheme(color)
end

ColorMePretty('gruvbox-material')
