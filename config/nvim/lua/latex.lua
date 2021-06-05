require'lspconfig'.texlab.setup{ 
	settings = {
		texlab = {
			build = {
				args = {"-pdf", "-pvc", "-interaction=nonstopmode", "-synctex=1", "%f"},
				isContinuous = true,
			},
			forwardSearch = {
				executable = "evince-synctex",
				args = {"-f", "%l", "%p", "\"code -g %f:%l\""},
			},
		},
	},
}
