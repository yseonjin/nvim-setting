local get_current_file_path = require('@utils.path').get_current_file_path;
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cindent = true
vim.opt.ruler = true
vim.opt.wmnu = true
vim.opt.hlsearch = true
vim.opt.history = 500
vim.opt.encoding = 'utf8'
vim.opt.fileencodings = { 'utf-8', 'cp949' }
vim.opt.cursorline = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.enc = 'utf-8'
vim.opt.termguicolors = true
vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = false
vim.opt.wrap = true
vim.opt.showmode = false
vim.opt.mousemoveevent = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.cmd('syntax on')
vim.opt.pumheight = 10

-- langmap
vim.opt.langmap = 'ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz'
