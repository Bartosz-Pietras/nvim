require('mini.pairs').setup()
require('mini.comment').setup()

-- Custom comments for ttcn3
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ttcn3",
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})

