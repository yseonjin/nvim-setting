local get_module_rootdir_of_cur_file = require('@utils.path').get_module_rootdir_of_cur_file
local change_dir_to = require('@utils.path').change_dir_to


-- Paste without yanking in visual select mode
vim.keymap.set('x', 'p', '"_dP', { silent = true })

vim.keymap.set('n','<C-t>',':NvimTreeToggle<CR>',{silent = true})
vim.keymap.set('n','<C-s>',':w<CR>',{silent = true})
vim.keymap.set('n','<C-q>',':q<CR>',{silent = true})
vim.keymap.set('n','<C-w><Left>','<C-w>h',{noremap=true, silent = true})
vim.keymap.set('n','<C-w><Down>','<C-w>j',{noremap=true, silent = true})
vim.keymap.set('n','<C-w><Up>','<C-w>k',{noremap=true, silent = true})
vim.keymap.set('n','<C-w><Right>','<C-w>l',{noremap=true, silent = true})

vim.keymap.set('i','<C-s>','<ESC>:w<CR>i',{silent = true})
vim.keymap.set('i','<C-w><Left>','<ESC><C-w>hi',{noremap=true, silent = true})
vim.keymap.set('i','<C-w><Down>','<ESC><C-w>ji',{noremap=true, silent = true})
vim.keymap.set('i','<C-w><Up>','<ESC><C-w>ki',{noremap=true, silent = true})
vim.keymap.set('i','<C-w><Right>','<ESC><C-w>li',{noremap=true, silent = true})


vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')


vim.keymap.set('t','<C-w><Left>','<C-\\><C-n><C-w>h',{noremap=true, silent = true})
vim.keymap.set('t','<C-w><Down>','<C-\\><C-n><C-w>j',{noremap=true, silent = true})
vim.keymap.set('t','<C-w><Up>','<C-\\><C-n><C-w>k',{noremap=true, silent = true})
vim.keymap.set('t','<C-w><Right>','<C-\\><C-n><C-w>l',{noremap=true, silent = true})

