return {
    "ojroques/nvim-osc52",
    config = function()
        local osc52 = require("osc52")
        vim.keymap.set("n", "<leader>c", osc52.copy_operator, { expr = true })
        vim.keymap.set("n", "<leader>cc", "<leader>c_", { expr = true })
        vim.keymap.set("v", "<leader>c", osc52.copy_visual, { expr = true })
    end,
}
