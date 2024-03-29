return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "bash-language-server",
        "gopls",
        "marksman",
        "json-lsp",
        "yaml-language-server",
        "pyright",
        "cmake-language-server",

        -- format
        "prettier",
        "shfmt",
        "stylua",
        "gofumpt",
        "clang-format",
        "black",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "hiphish/rainbow-delimiters.nvim",
        config = function()
          require "configs.rainbow_delimiters"
        end,
      },
      {
        "abecodes/tabout.nvim",
        config = require "configs.tabout",
      },
    },

    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "javascript",
        "typescript",
        "c",
        "cpp",
        "go",
        "python",
        "markdown",
        "markdown_inline",
        "bash",
        "vimdoc",
        "cmake",
        "make",
        "diff",
        "yaml",
        "proto",
        "ini",
        "json",
        "xml",
        "html",
        "ninja",
        "regex",
        "sql",
        "gpg",
        "gitcommit",
        "git_config",
        "git_rebase",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "nvim-telescope/telescope-frecency.nvim",
        "jvgrootveld/telescope-zoxide",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "debugloop/telescope-undo.nvim",
      },
      {
        "ahmedkhalf/project.nvim",
        event = { "CursorHold", "CursorHoldI" },
        config = function()
          require("project_nvim").setup {
            detection_methods = { "pattern" },
            patterns = { ".git", ".svn", ".clang-format", "package.json", ".hgtags" },
            ignore_lsp = { "null-ls", "copilot" },
          }
        end,
      },
    },
    opts = require "configs.telescope"
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "NeogitOrg/neogit",
    -- branch = "nightly",
    cmd = { "Neogit" },
    dependencies = {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
      config = function()
        require("diffview").setup {
          enhanced_diff_hl = true,
          hooks = {
            diff_buf_read = function()
              -- Change local options in diff buffers
              vim.opt_local.wrap = true
            end,
          },
        }
      end,
    },
    config = function()
      require("neogit").setup {
        integrations = { diffview = true },
        disable_commit_confirmation = true,
        disable_builtin_notifications = true,
      }
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPost",
    config = function()
      require("nvim-lastplace").setup {
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      }
    end,
  },
  {
    "windwp/nvim-spectre",
    cmd = { "Spectre" },
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "smoka7/hop.nvim",
    lazy = true,
    cmd = { "HopWord", "HopLine", "HopPattern", "HopChar1CurrentLine" },
    config = function()
      require("hop").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      -- dofile(vim.g.base46_cache .. "todo")
      require("todo-comments").setup {}
    end,
  },
  {
    "junegunn/vim-easy-align",
    cmd = { "EasyAlign" },
    lazy = true,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup()
      vim.notify = require "notify"
    end,
  },
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    cond = true,
    config = require "configs.bigfile",
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>", "<C-f>" },
    config = require "configs.neoscroll",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    opts = require "configs.aerial",
  },
  {
    "jghauser/mkdir.nvim",
    event = "BufNewFile",
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },
  {
    "aznhe21/actions-preview.nvim",
    event = { "LspAttach" },
    config = require "configs.actions_preview",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = { "ys", "cs", "ds" },
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "BufReadPost",
    opts = {
      -- config
    },
    init = function()
      -- `matchparen.vim` needs to be disabled manually in case of lazy loading
      vim.g.loaded_matchparen = 1
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "LspAttach",
    config = function()
      require("dropbar").setup {}
    end,
  },
  {
    "kelly-lin/ranger.nvim",
    -- event = "VeryLazy",
    cmd = { "Ranger" },
    config = function()
      require("ranger-nvim").setup { replace_netrw = true, enable_cmds = true }
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    config = require "configs.illuminate",
  },
  {
    "olimorris/persisted.nvim",
    cmd = {
      "SessionToggle",
      "SessionStart",
      "SessionStop",
      "SessionSave",
      "SessionLoad",
      "SessionLoadLast",
      "SessionLoadFromFile",
      "SessionDelete",
    },
    config = require "configs.persisted",
  },
  {
    "mg979/vim-visual-multi",
    keys = { "<C-p>" },
    branch = "master",
  },
  {
    "ojroques/nvim-bufdel",
    cmd = { "BufDel", "BufDelOthers" },
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = require "configs.fidget",
  },
  {
    "nvimdev/hlsearch.nvim",
    event = "BufReadPost",
    config = function()
      require("hlsearch").setup()
    end,
  },
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    dependencies = {
      { "kkharji/sqlite.lua" },
    },
    opts = {
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 150,
      },
      ring = { storage = "sqlite" },
    },
  },
  {
    "dnlhc/glance.nvim",
    event = "LspAttach",
    config = require "configs.glance",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:

      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = require "configs.noice",
  },
}
