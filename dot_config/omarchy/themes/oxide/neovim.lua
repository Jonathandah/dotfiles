return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Monotone shades (base00-base07)
                base00 = "#081112", -- Default background
                base01 = "#939798", -- Lighter background (status bars)
                base02 = "#081112", -- Selection background
                base03 = "#939798", -- Comments, invisibles
                base04 = "#b3b7b8", -- Dark foreground
                base05 = "#d2d3d3", -- Default foreground
                base06 = "#d2d3d3", -- Light foreground
                base07 = "#b3b7b8", -- Light background

                -- Accent colors (base08-base0F)
                base08 = "#f96184", -- Variables, errors, red
                base09 = "#22030a", -- Integers, constants, orange
                base0A = "#f6b016", -- Classes, types, yellow
                base0B = "#01d38f", -- Strings, green
                base0C = "#01d38f", -- Support, regex, cyan
                base0D = "#7289de", -- Functions, keywords, blue
                base0E = "#c190eb", -- Keywords, storage, magenta
                base0F = "#2b2011", -- Deprecated, brown/yellow
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
