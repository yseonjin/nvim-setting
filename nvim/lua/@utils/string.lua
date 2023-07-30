local function trim(str)
  return (str:gsub("^%s*(.-)%s*$", "%1"))
end

local function is_empty_string(str)
  return str == nil or str == ''
end

local function is_not_empty_string(str)
  return not is_empty_string(str)
end

local function replace_char_by_index(str, idx, new_char)
  return string.sub(str, 1, idx - 1) .. new_char .. string.sub(str, idx + 1)
end

local function get_nth_char(str, n)
  return string.sub(str, n, n)
end

return {
  trim = trim,
  is_empty_string = is_empty_string,
  is_not_empty_string = is_not_empty_string,
  replace_char_by_index = replace_char_by_index,
  get_nth_char = get_nth_char,
}

