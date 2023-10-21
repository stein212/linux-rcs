return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({
            settings = {
                clangd = {
                    SuggestMissingIncludes = false,
                },
            },
        })

        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<C-d>", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
    end,
}
