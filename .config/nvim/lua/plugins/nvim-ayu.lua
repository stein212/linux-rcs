return {
    "Shatur/neovim-ayu",
    config = function()
        local ayu = require("ayu")
        ayu.setup({
            mirage = true,
            overrides = {
                LineNr = { fg = "#555555" }
            }
        })
        ayu.colorscheme()
    end,
}
