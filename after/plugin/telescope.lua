local builtin = require('telescope.builtin')
local default_opts = { noremap = true, silent = true }
local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

vim.keymap.set("n", "<C-s>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('v', '<C-s>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {})

telescope.setup {
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                    -- freeze the current list and start a fuzzy search in the frozen list
                    ["<C-space>"] = lga_actions.to_fuzzy_refine,
                },
            },
        }
    }
}

-- don't forget to load the extension
telescope.load_extension("live_grep_args")
