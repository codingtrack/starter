return function()
  local cmp = {
    name = "nvim-cmp",
    opts = { defer = true },
    disable = function()
      require("cmp").setup.buffer { enabled = false }
    end,
  }

  local ftdetect = {
    name = "ftdetect",
    opts = { defer = true },
    disable = function()
      vim.api.nvim_set_option_value("filetype", "bigfile", { scope = "local" })
    end,
  }

  local wilder = {
    name = "wilder",
    opts = { defer = true },
    disable = function()
      require("wilder").disable()
    end,
  }

  require("bigfile").config {
    filesize = 1, -- size of the file in MiB
    pattern = { "*" }, -- autocmd pattern
    features = { -- features to disable
      "indent_blankline",
      "lsp",
      "illuminate",
      "treesitter",
      "syntax",
      "vimopts",
      "filetype",
      "matchparen",
      cmp,
      ftdetect,
      -- wilder,
    },
  }
end
