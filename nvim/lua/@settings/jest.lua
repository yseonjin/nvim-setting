local get_current_file_path = require('@utils.path').get_current_file_path;
local get_module_rootdir_of_cur_file = require('@utils.path').get_module_rootdir_of_cur_file;
local change_dir_to = require('@utils.path').change_dir_to;
local replace_char_by_index = require('@utils.string').replace_char_by_index;
local open_terminal_vertical = require('@settings.terminal-settings').open_terminal_vertical

local function parse_test_name(test_signature)
  local current_line = vim.api.nvim_buf_get_lines(0, vim.fn.line('.') - 1, vim.fn.line('.'), false)[1]
  local test_name = current_line:match(test_signature .. "%((.-),")
  if test_name == nil then
    return nil
  end

  replace_char_by_index(test_name, 1, "'")
  replace_char_by_index(test_name, #test_name, "'")
  return test_name;
end

local function build_command(test_name, file_name)
  test_name = string.gsub(test_name, "%(", "\\(");
  test_name = string.gsub(test_name, "%)", "\\)");

  return 'pnpm jest --watch -t ' ..
      test_name .. ' ' ..
      file_name
end

local function jest_single()
  local test_name = parse_test_name('it') or parse_test_name('describe') or parse_test_name('test')

  if test_name == nil then
    vim.notify('No test found in this line');
    return;
  end

  change_dir_to(get_module_rootdir_of_cur_file());

  local cmd = build_command(test_name, get_current_file_path())
  open_terminal_vertical(cmd)
end

vim.api.nvim_create_user_command('JestSingle', jest_single, { nargs = '?' })
vim.keymap.set('n', '<F5>', ':JestSingle<CR>', { silent = true });

local function jest_single_copy()
  local test_module_root = get_module_rootdir_of_cur_file();
  local test_name = parse_test_name('it') or parse_test_name('describe')
  if test_name == nil then
    vim.notify('No test found in this line');
    return;
  end
  local cd_cmd = 'cd ' .. test_module_root;
  local jest_cmd = build_command(test_name, get_current_file_path())
  vim.fn.system('echo "' .. cd_cmd .. ' && ' .. jest_cmd .. '" | pbcopy')
end

vim.api.nvim_create_user_command('JestSingleCopy', jest_single_copy, {})
vim.keymap.set('n', '<leader>jsc', ':JestSingleCopy<CR>', { silent = true });
