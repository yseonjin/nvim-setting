vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })

local function open_terminal_horizontal(command_str)
  vim.cmd('belowright split term://zsh');
  vim.opt.number = false;
  vim.opt.bufhidden = 'hide';
  vim.cmd('startinsert')
  if command_str ~= nil then
    vim.fn.feedkeys(command_str, '<CR>')
  end
end

local function open_terminal_vertical(command_str)
  vim.cmd('belowright vsplit term://zsh');
  vim.opt.number = false;
  vim.opt.bufhidden = 'hide';
  vim.cmd('startinsert')
  if command_str ~= nil then
    vim.fn.feedkeys(command_str, '<CR>')
  end
end

local function move_to_not_terminal_window(arrow_key, restore)
  vim.cmd('wincmd ' .. arrow_key)
  if vim.bo.buftype == 'terminal' then
    vim.cmd('wincmd ' .. restore)
    vim.cmd('stopinsert')
    print("Use <C-a> instead of <C-w> to move to terminal window")
  end
end


local function move_to_window_and_startinsert_if_terminal(arrow_key)
  vim.cmd('wincmd ' .. arrow_key)
  if vim.bo.buftype == 'terminal' then
    vim.cmd('startinsert')
  end
end

local function buf_is_terminal(bufnr)
  return vim.bo[bufnr].buftype == 'terminal'
end

local function setup() 
  vim.api.nvim_create_user_command('Hterminal', function(command)
    open_terminal_horizontal(command.args);
  end,
    { nargs = '?' })

  vim.api.nvim_create_user_command('Vterminal', function(command)
    open_terminal_vertical(command.args);
  end,
    { nargs = '?' })
  vim.keymap.set('n','<C-a>t', ':Hterminal<CR>', { noremap = true, silent = true })
  vim.keymap.set('n','<C-a>v', ':Vterminal<CR>', { noremap = true, silent = true })
  vim.keymap.set('n','<C-a>x', function()
    if buf_is_terminal(0) == true then
      vim.cmd('q!')
    end
  end, { noremap = true, silent = true })

  vim.keymap.set('t', '<C-a>t', '<C-\\><C-n>:Hterminal<CR>', { noremap = true, silent = true })
  vim.keymap.set('t', '<C-a>v', '<C-\\><C-n>:Vterminal<CR>', { noremap = true, silent = true })
  vim.keymap.set('t', '<C-a>x', '<C-\\><C-n>:q!<CR>', { noremap = true, silent = true })
end

return {
  setup = setup,
  open_terminal_horizontal = open_terminal_horizontal,
  open_terminal_vertical = open_terminal_vertical,
}
