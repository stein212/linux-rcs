return {
    "riddlew/swap-split.nvim",
    config = function()
        require("swap-split").setup({
            ignore_filetypes = {
                "NvimTree",
            },
        })

        vim.keymap.set("n", "<leader>S", "<cmd>SwapSplit<CR>", { noremap = true })
    end,
}
