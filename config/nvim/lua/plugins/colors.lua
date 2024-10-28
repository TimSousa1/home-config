return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,

        dependencies = {
            "nvim-lualine/lualine.nvim"
        },

		opts = {
			no_italic = true,
			term_colors = true,
			transparent_background = false,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},

			color_overrides = {
				mocha = {
					base = "#000000",
					mantle = "#000000",
					crust = "#000000",
				},
            },

            integrations = {
                telescope = {
                    enabled = true,
                },
                mason = true,
                dropbar = {
                    enabled = true,
                    color_mode = true,
                },
            },
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
}
