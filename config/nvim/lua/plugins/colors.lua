return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim"
        },
        integrations = {
            mason = true,
        },
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
    }

}
