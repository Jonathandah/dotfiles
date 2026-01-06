return {
	{
		"bjarneo/aether.nvim",
		name = "aether",
		priority = 1000,
		opts = {
			disable_italics = false,
			colors = {
				-- Monotone shades (base00-base07)
				base00 = "#170810", -- Default background
				base01 = "#4a3c45", -- Lighter background (status bars)
				base02 = "#170810", -- Selection background
				base03 = "#4a3c45", -- Comments, invisibles
				base04 = "#f0eaed", -- Dark foreground
				base05 = "#ffffff", -- Default foreground
				base06 = "#ffffff", -- Light foreground
				base07 = "#f0eaed", -- Light background

				-- Accent colors (base08-base0F)
				base08 = "#E85F6F", -- Variables, errors, red
				base09 = "#FF7A8A", -- Integers, constants, orange
				base0A = "#D4A882", -- Classes, types, yellow
				base0B = "#F29B9A", -- Strings, green
				base0C = "#E8C099", -- Support, regex, cyan
				base0D = "#D9A56C", -- Functions, keywords, blue
				base0E = "#D1B399", -- Keywords, storage, magenta
				base0F = "#E6BA94", -- Deprecated, brown/yellow
			},
		},
		config = function(_, opts)
			require("aether").setup(opts)
			vim.cmd.colorscheme("aether")

			-- Enable hot reload
			require("aether.hotreload").setup()
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "aether",
		},
	},
}
