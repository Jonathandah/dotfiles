return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#070707", -- Default background
                base01 = "#d0cdcd", -- Lighter background (status bars)
                base02 = "#070707", -- Selection background
                base03 = "#d0cdcd", -- Comments, invisibles
                base04 = "#E8E8E8", -- Dark foreground
                base05 = "#f5f5f5", -- Default foreground
                base06 = "#f5f5f5", -- Light foreground
                base07 = "#E8E8E8", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#998f8f", -- Variables, errors, red
                base09 = "#c5bfbf", -- Integers, constants, orange
                base0A = "#a59c9c", -- Classes, types, yellow
                base0B = "#978c8c", -- Strings, green
                base0C = "#d1cccc", -- Support, regex, cyan
                base0D = "#b4acac", -- Functions, keywords, blue
                base0E = "#c2bcbc", -- Keywords, storage, magenta
                base0F = "#bdb7b7", -- Deprecated, brown/yellow
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
