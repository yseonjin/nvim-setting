local get_module_rootdir_of_cur_file = require('@utils.path').get_module_rootdir_of_cur_file
local change_dir_to = require('@utils.path').change_dir_to

-- keymap 시작
vim.keymap.set('n','<C-t>',':NvimTreeToggle <CR>',{silent = true})
vim.keymap.set('n','<C-s>',':wq <CR>',{silent = true})
vim.keymap.set('n','<C-q>',':q <CR>',{silent = true})
