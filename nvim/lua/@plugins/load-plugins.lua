-- plug in =========== [ https://github.com/junegunn/vim-plug ]=============================================
local Plug = vim.fn['plug#']

vim.fn['plug#begin']('~/.vim/plugged')

-- install plugins
Plug('nvim-tree/nvim-web-devicons')  -- for nvim tree icons
Plug('nvim-tree/nvim-tree.lua')      -- file tree
Plug('luochen1990/rainbow')          -- colorized bracket
Plug('jacoborus/tender.vim')         -- vim theme

vim.fn['plug#end']()



-- setup plugins
Require('@plugins.configs.nvim-tree')


