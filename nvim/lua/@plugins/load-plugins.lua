-- plug in =========== [ https://github.com/junegunn/vim-plug ]=============================================
local Plug = vim.fn['plug#']

vim.fn['plug#begin']('~/.vim/plugged')

-- install plugins
Plug('nvim-tree/nvim-web-devicons')  -- for nvim tree icons
Plug('nvim-tree/nvim-tree.lua')      -- file tree
Plug('luochen1990/rainbow')          -- colorized bracket
Plug('jacoborus/tender.vim')         -- vim theme
Plug('terrortylor/nvim-comment')     -- auto comment
Plug('folke/todo-comments.nvim')     -- todo comment with plenary.nvim
Plug('nvim-lua/plenary.nvim')        -- lua util function set like loadash in javascript
Plug('neovim/nvim-lspconfig')        -- lsp server adaptor

vim.fn['plug#end']()



-- setup plugins
Require('@plugins.configs.nvim-tree')
Require('@plugins.configs.nvim-comment')
Require('@plugins.configs.nvim-lspconfig')
