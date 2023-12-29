return {
    {
        "devsjc/vim-jb",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.jb_enable_italics = 1
            vim.cmd("colorscheme jb")
        end,
    },
    -- {
    --     "felipeagc/fleet-theme-nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd("colorscheme fleet")
    --     end,
    -- },
    {
        "folke/tokyonight.nvim",
    },
}
