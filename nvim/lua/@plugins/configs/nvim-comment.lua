require('nvim_comment').setup({})


local bufopts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-/>', ':CommentToggle<CR>', bufopts)
vim.keymap.set('i', '<C-/>', ':CommentToggle<CR>', bufopts)
vim.keymap.set('v', '<C-/>', ":'<,'>CommentToggle<CR>gv", bufopts)
