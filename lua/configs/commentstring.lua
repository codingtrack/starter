return function()
  vim.g.skip_ts_context_commentstring_module = true
  -- Whether to update the `commentstring` on the `CursorHold` autocmd
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }
end
