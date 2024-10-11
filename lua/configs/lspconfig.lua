-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- use tiny-inline-diagnostic.nvim need to remove virtual_text
vim.diagnostic.config {
  virtual_text = false,
}

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "bashls", "gopls", "marksman", "yamlls", "pyright", "cmake", "jsonls" }
local nvlsp = require "nvchad.configs.lspconfig"

local map = vim.keymap.set
local conf = require("nvconfig").ui.lsp

local on_attach = function(client, bufnr)
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client, bufnr)
  end

  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end

  map("n", "K", vim.lsp.buf.hover, opts "Lsp hover information")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Lsp Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Lsp Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "Lsp List workspace folders")

  map("n", "<leader>ra", function()
    require "nvchad.renamer"()
  end, opts "Lsp NvRenamer")
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local root_files = {
  ".clangd",
  ".clang-tidy",
  ".clang-format",
  ".git",
  -- 'compile_commands.json',
  -- 'compile_flags.txt',
  -- 'configure.ac', -- AutoTools
}

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

lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = {
    "clangd",
    "--clang-tidy",
    "--enable-config",
    "--background-index",
    "--query-driver=" .. get_binary_path_list { "clang++", "clang", "gcc", "g++" },
    "--all-scopes-completion=true",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=never",
    "--compile_args_from=filesystem",
    "--completion-parse=auto",
    -- "--malloc-trim",
    "--pch-storage=memory",
    "--limit-references=3000",
    "--limit-results=350",
    "--log=error",
    "-j=2",
  },
  root_dir = function(fname)
    ---@diagnostic disable-next-line: deprecated
    -- return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname)
    return "code"
  end,
  single_file_support = true,
}
