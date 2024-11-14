vim.g.mapleader = ' '
require("config")
vim.cmd.colorscheme('tokyonight')

vim.filetype.add({
    extension = {
        ttcn3 = 'ttcn3',
    },
    filename = {
        ['.ttcn3'] = 'ttcn3',
    }
})

