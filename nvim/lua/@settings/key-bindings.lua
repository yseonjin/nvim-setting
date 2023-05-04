local get_module_rootdir_of_cur_file = require('@utils.path').get_module_rootdir_of_cur_file
local change_dir_to = require('@utils.path').change_dir_to


-- Paste without yanking in visual select mode
vim.keymap.set('x', 'p', '"_dP', { silent = true })

vim.keymap.set('n','<C-t>',':NvimTreeToggle <CR>',{silent = true})
vim.keymap.set('n','<C-s>',':w <CR>',{silent = true})
vim.keymap.set('n','<C-q>',':q <CR>',{silent = true})
vim.keymap.set('n','<C-w><Left>','<C-w>h',{noremap=true, silent = true})
vim.keymap.set('n','<C-w><Down>','<C-w>j',{noremap=true, silent = true})
vim.keymap.set('n','<C-w><Up>','<C-w>k',{noremap=true, silent = true})
vim.keymap.set('n','<C-w><Right>','<C-w>l',{noremap=true, silent = true})


vim.keymap.set('i','<C-s>',':w <CR>',{silent = true})
vim.keymap.set('i','<C-w><Left>','<C-w>h',{noremap=true, silent = true})
vim.keymap.set('i','<C-w><Down>','<C-w>j',{noremap=true, silent = true})
vim.keymap.set('i','<C-w><Up>','<C-w>k',{noremap=true, silent = true})
vim.keymap.set('i','<C-w><Right>','<C-w>l',{noremap=true, silent = true})


vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')


