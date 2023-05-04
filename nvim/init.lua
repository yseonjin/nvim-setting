function Require(module_name)
  local ok, mod = pcall(require, module_name)
  if not ok then
    vim.notify('RequireError: Fail to load ' .. module_name, 'error')
    mod = nil
  end
  return mod;
end

-----------------------

Require('@plugins.load-plugins')        -- load plugins
Require('@settings.terminal-settings').setup({})  -- make terminal
Require('@settings.options')            -- set vim options
Require('@settings.key-bindings')       -- set key binding
Require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})



vim.g.rainbow_active = 1
vim.cmd('colorscheme tender')

