-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- use tiny-inline-diagnostic.nvim need to remove virtual_text
vim.diagnostic.config {
  virtual_text = false,
}

local nvlsp = require "nvchad.configs.lspconfig"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    nvlsp.on_attach(_, args.buf)

    local bufnr = args.buf
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', 'gd', '<cmd>Glance definitions<CR>', opts)
    vim.keymap.set('n', 'gD', '<cmd>Glance type_definitions<CR>', opts)
    vim.keymap.set('n', 'gr', '<cmd>Glance references<CR>', opts)
    vim.keymap.set('n', 'gm', '<cmd>Glance implementations<CR>', opts)
  end,
})

-- EXAMPLE
local servers = { "bashls", "gopls", "marksman", "yamlls", "pyright", "cmake", "jsonls", "clangd" }
vim.lsp.enable(servers)

local function get_binary_path_list(binaries)
  local path_list = {}
  for _, binary in ipairs(binaries) do
    local path = vim.fn.exepath(binary)
    if path ~= "" then
      table.insert(path_list, path)
    end
  end
  return table.concat(path_list, ",")
end

vim.lsp.config.clangd = {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--enable-config',
    '--background-index',
    '--query-driver=' .. get_binary_path_list { "clang++", "clang", "gcc", "g++" },
    '--all-scopes-completion=true',
    '--completion-style=detailed',
    '--header-insertion-decorators',
    '--header-insertion=never',
    '--compile_args_from=filesystem',
    '--completion-parse=auto',
    -- '--malloc-trim",
    '--pch-storage=memory',
    '--limit-references=3000',
    '--limit-results=350',
    '--log=error',
    '-j=4',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  single_file_support = true,
}
