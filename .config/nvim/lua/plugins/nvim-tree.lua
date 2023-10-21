return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvimTree = require("nvim-tree")
        nvimTree.setup({
            sort_by = "case_sensitive",
            actions= {
                open_file = {
                    resize_window = true,
                }
            },
            view = {
                relativenumber = true,
            },
            filters = {
                dotfiles = false,
            },
            git = {
                ignore = false,
            },
        })
        local nvimTreeApi = require("nvim-tree.api")
        vim.keymap.set("n", "<leader>tf", nvimTreeApi.tree.focus)
        vim.keymap.set("n", "<leader>tt", nvimTreeApi.tree.toggle)
        vim.keymap.set("n", "<leader>tr", nvimTreeApi.tree.find_file)
    end,
}
