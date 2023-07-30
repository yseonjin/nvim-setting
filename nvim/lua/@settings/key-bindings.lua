---@diagnostic disable-next-line: unused-local
local get_module_rootdir_of_cur_file = require('@utils.path').get_module_rootdir_of_cur_file
local change_dir_to = require('@utils.path').change_dir_to
local change_cwd_to_root_dir_of_cur_file = require('@utils.path').change_cwd_to_root_dir_of_cur_file

-- Paste without yanking in visual select mode
vim.keymap.set('x', 'p', '"_dP', { silent = true })

vim.keymap.set('n', '<C-t>', ':NvimTreeFindFileToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('n', '<C-q>', ':q<CR>', { silent = true })
vim.keymap.set('n', '<C-w><Left>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w><Down>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w><Up>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w><Right>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', '/\\c', { noremap = true, silent = true }) -- search word in file
vim.keymap.set('n', '<C-w><;>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w></>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w><[>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w><\'>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-a>', 'ggVGy', { silent = true })
vim.keymap.set('n', '<C-x>', 'ggVGx', { silent = true })
vim.keymap.set('n', '{', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '}', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '©', change_cwd_to_root_dir_of_cur_file, { silent = true })

vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>i', { silent = true })
vim.keymap.set('i', '<C-w><Left>', '<ESC><C-w>hi', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w><Down>', '<ESC><C-w>ji', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w><Up>', '<ESC><C-w>ki', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w><Right>', '<ESC><C-w>li', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w><;>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w></>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w><[>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w><\'>', '<C-w>l', { noremap = true, silent = true })



vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')


vim.keymap.set('t', '<C-w><Left>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w><Down>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w><Up>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w><Right>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w><;>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w></>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w><[>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('t', '<C-w><\'>', '<C-w>l', { noremap = true, silent = true })
