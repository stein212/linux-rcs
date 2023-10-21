---- For nvim-tree
-- disable netrw at the view start of your init.lua
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.syntax = "On"

vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%C%s%l %#NonText#%r"

vim.opt.statusline = "%{FugitiveStatusline()}%m%r%h%w%k%f%=%l:%c"

vim.opt.list = true
vim.opt.listchars = {
    space = ".",
    tab = "> ",
    trail = "█",
}

vim.opt.colorcolumn = { 80, 100, 120 }

vim.opt.directory = vim.fn.expand("~/.vim/swapfiles//")
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true
vim.opt.undolevels = 1000

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
	lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- xml comment / uncomment
vim.keymap.set("v", "mc", ":s/\\%V\\(<\\_.*>\\)\\%V/<!--\\1-->/<CR>")
vim.keymap.set("v", "mu", ":s/\\%V<!--\\s*\\(\\_.*\\)\\s*-->\\%V/\\1/<CR>")
-- enable % for <> in xml
vim.api.nvim_command("au FileType xml set matchpairs+=<:>")
-- enable folding in xml
vim.api.nvim_command("au FileType xml set foldmethod=indent foldlevelstart=999 foldminlines=0")

-- wrap/unwrap lines
vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { noremap = true })

-- remove search highlight
vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { noremap = true })

-- refresh buffer
vim.keymap.set("n", "<leader>z", ":set wrap!<CR>", { noremap = true })

-- focus split
vim.keymap.set("n", "<leader>F", ":lua require('focus-split').select_and_focus_win()<CR>", { noremap = true })

vim.api.nvim_command("highlight SwapSplitStatusLine guifg=#000000 guibg=#eb9e34")
vim.api.nvim_command("highlight FocusSplitStatusLine guifg=#000000 guibg=#33aaaa")
vim.api.nvim_command("match ErrorMsg /\\s\\+$/")
