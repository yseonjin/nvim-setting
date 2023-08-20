-- plug in =========== [ https://github.com/junegunn/vim-plug ]=============================================
local Plug = vim.fn['plug#']

vim.fn['plug#begin']('~/.vim/plugged')

-- install plugins
Plug('nvim-tree/nvim-web-devicons') -- for nvim tree icons
Plug('nvim-tree/nvim-tree.lua')     -- file tree
Plug('luochen1990/rainbow')         -- colorized bracket
Plug('terrortylor/nvim-comment')    -- auto comment
Plug('folke/todo-comments.nvim')    -- todo comment with plenary.nvim
Plug('nvim-lua/plenary.nvim')       -- lua util function set like loadash in javascript
Plug('neovim/nvim-lspconfig')       -- lsp server adaptor
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('tzachar/fuzzy.nvim')                                                                  -- cmp : floating screen
Plug('tzachar/cmp-fuzzy-path', { requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } }) -- floating screen
Plug('tzachar/cmp-fuzzy-buffer', { requires = { 'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim' } })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lua') -- lua floating screen
Plug('hrsh7th/cmp-nvim-lsp') -- lsp floating screen
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('f3fora/cmp-spell')
Plug('junegunn/fzf', { ['do'] = function() vim.fn["fzf#intsall"]() end })
Plug('junegunn/fzf.vim')
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip')
Plug('github/copilot.vim')
Plug('jose-elias-alvarez/null-ls.nvim') -- null language server to provides neovim's language server for extending other language server
Plug('akinsho/bufferline.nvim', { tag = 'v3.*' })
Plug('hood/popui.nvim')

-- theme -----------------------
Plug('Mofiqul/vscode.nvim')

vim.fn['plug#end']()



-- setup plugins
Require('@plugins.configs.theme.vscode')
Require('@plugins.configs.nvim-tree')
Require('@plugins.configs.nvim-comment')
Require('@plugins.configs.nvim-lspconfig')
Require('@plugins.configs.nvim-cmp')
Require('@plugins.configs.luasnip')
Require('@plugins.configs.cmp-spell')
Require('@plugins.configs.telescope')
Require('@plugins.configs.bufferline')
Require('@plugins.configs.popui')
