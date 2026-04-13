-- Custom autocommands on top of LazyVim defaults

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank (LazyVim already does this, but keeping as an example)

-- Auto-resize splits when terminal is resized
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
