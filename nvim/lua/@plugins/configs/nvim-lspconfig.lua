local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs');
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
local use_handlers_with_filetype = require('@plugins.configs.hooks.util').use_handlers_with_filetype
local common_handlers = require('@plugins.configs.hooks.common_handler')
local tsserver_handlers = require('@plugins.configs.hooks.tsserver_handler')
local cmd_resolver = require("null-ls.helpers.command_resolver")



-- lua
lspconfig.lua_ls.setup({
  on_attach = use_handlers_with_filetype({
    lua = {
      common_handlers.keymap_to_common_language_service,
      common_handlers.buf_set_format_on_save,
    }
  }),
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "Require", "Log", "DEBUG" },
      },
    }
  },
  capabilities = default_capabilities
})

-- typescript
lspconfig.tsserver.setup({
  on_attach = use_handlers_with_filetype({
    typescript = {
      common_handlers.keymap_to_common_language_service,
      tsserver_handlers.setting_for_tsserver_language_service,
    }
  }),
  hostInfo = 'neovim',
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  filetype = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "json",
  },
  init_options = {
    preferences = {
      quotePreference = 'single',
      includeCompletionsForModuleExports = true,
      includeCompletionsForImportStatements = true,
      includeCompletionsWithSnippetText = true,
      includeAutomaticOptionalChainCompletions = true,
      includeCompletionsWithClassMemberSnippets = true,
      includeCompletionsWithInsertText = true,
      importModuleSpecifierPreference = 'project-relative',
      importModuleSpecifierEnding = 'minimal',
      provideRefactorNotApplicableReason = true,
      allowRenameOfImportPath = true,
      allowTextChangesInNewFiles = true,
      displayPartsForJSDoc = true,
      generateReturnInDocTemplate = true,
    },
    code_action_on_save = {}
  },
  capabilities = default_capabilities
})

-- lisp
if not configs.cl_lsp then
  configs.cl_lsp = {
    default_config = {
      cmd = { vim.env.HOME .. "/.roswell/bin/cl-lsp" },
      filetypes = { 'lisp' },
      root_dir = lspconfig.util.find_git_ancestor,
      settings = {},
    },
  }




end
lspconfig.cl_lsp.setup({
  on_attach = use_handlers_with_filetype({
    lisp = {
      common_handlers.keymap_to_common_language_service,
      common_handlers.buf_set_format_on_save,
    }
  }),
  root_dir = lspconfig.util.root_pattern('main.lisp'),
  capabilities = default_capabilities
})


local null_ls = require("null-ls")

null_ls.setup({
  debug = false,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", "package.json", "jsconfig.json",
    "tsconfig.json"),
  on_attach = use_handlers_with_filetype({
    typescript = {
      common_handlers.buf_set_format_on_save,
    },
  }),
  fallback_severity = vim.diagnostic.severity.INFO,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "json", "yaml", "markdown", "lua", "typescript", "javascript" },
      prefer_local = 'node_modules/.bin/prettier',
    }),
    null_ls.builtins.diagnostics.eslint.with({
      filetypes = { "html", "json", "yaml", "markdown", "lua", "typescript", "javascript" },
    }),
    null_ls.builtins.diagnostics.cspell.with({
      filetypes = { "html", "json", "yaml", "markdown", "lua", "typescript", "javascript" },
            --[[
      -- NULL_LS_COMPLETION = "COMPLETION",
      -- NULL_LS_DIAGNOSTICS = "DIAGNOSTICS",
      -- NULL_LS_DIAGNOSTICS_ON_OPEN = "DIAGNOSTICS_ON_OPEN",
      -- NULL_LS_DIAGNOSTICS_ON_SAVE = "DIAGNOSTICS_ON_SAVE",
      -- NULL_LS_FORMATTING = "FORMATTING",
      -- NULL_LS_HOVER = "HOVER",
      -- NULL_LS_RANGE_FORMATTING = "RANGE_FORMATTING",
      -- RANGE_FORMATTING = "NULL_LS_RANGE_FORMATTING"
      --]]
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),
    null_ls.builtins.code_actions.cspell.with({
      filetypes = { "html", "json", "yaml", "markdown", "lua", "typescript", "javascript" }
    }),
  },
})
