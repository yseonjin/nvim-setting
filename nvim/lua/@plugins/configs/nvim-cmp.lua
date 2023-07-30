local cmp = require('cmp')
local luasnip = require('@plugins.configs.luasnip')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local function use_kind_filter(filter)
  return function(entry, _)
    local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
    return filter(kind)
  end
end

local function use_word_filter(filter)
  return function(entry)
    return filter(entry:get_word())
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      entry_filter = use_kind_filter(function(kind)
        return kind ~= 'Text' and kind ~= 'Snippet'
      end),
    },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    {
      name = 'fuzzy_path',
      entry_filter = use_word_filter(function(word)
        return word ~= 'No matches found' and word ~= 'Searching...';
      end),
    },
    {
      name = 'fuzzy_buffer',
      entry_filter = use_kind_filter(function(kind)
        return kind ~= 'Text'
      end),
    },
  }),
  formatting = {
    expandable_indicator = true,
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = ({
        Text = '',
        Method = '',
        Function = '󰘧',
        Constructor = '',
        Field = 'ﰠ',
        Variable = '',
        Class = 'C',
        Interface = 'I',
        Module = '',
        Property = 'ﰠ',
        Unit = '塞',
        Value = '',
        Enum = '',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = '',
        Event = '',
        Operator = '',
      })[vim_item.kind] or vim_item.kind

      local source = entry.source.name
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[vim]',
        luasnip = '[LuaSnip]',
        fuzzy_path = '[Path]',
        fuzzy_buffer = '[Buf]',
        cmdline = '[Cmd]',
        buffer = '[Buf]',
        path = '[Path]',
        spell = '[Spell]',
      })[source] or source;
      if source == 'luasnip' or source == 'nvim_lsp' then
        vim_item.dup = 0
      end

      return vim_item
    end
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  }
})
