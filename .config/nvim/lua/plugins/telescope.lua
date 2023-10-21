return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-e>"] = lga_actions.quote_prompt(),
                            ["<C-d>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<C-d>"] = actions.delete_buffer,
                            ["<C-g>"] = function(prompt_bufnr)
                                local selection = actions.get_selected_entry(prompt_bufnr)
                                actions.close(prompt_bufnr)
                                vim.cmd("botright vsp " .. selection.value)
                            end,
                            ["<C-X>"] = function(prompt_bufnr)
                                local selection = actions.get_selected_entry(prompt_bufnr)
                                actions.close(prompt_bufnr)
                                vim.cmd("botright sp " .. selection.value)
                            end,
                        },
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({
                hidden = true,
                no_ignore = true,
                no_ignore_parent = true,
            })
        end, {})
        vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
}
