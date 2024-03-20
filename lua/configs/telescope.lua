local opts = {
  extensions = {
    fzf = {
      fuzzy = false, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    },
    undo = {
      side_by_side = true,
    },
    aerial = {
      show_lines = false,
      show_nesting = {
        ["_"] = false, -- This key will be the default
        lua = true, -- You can set the option for specific filetypes
      },
    },
  },
  extensions_list = {
    "themes",
    "terms",
    "projects",
    "fzf",
    "frecency",
    "aerial",
    "zoxide",
    "undo",
  },
}

return opts
