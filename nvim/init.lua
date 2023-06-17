---- lazy nvim ----
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy nvim plugins
require("lazy").setup({
  -- mason.nvim suite
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "mfussenegger/nvim-dap",
  "jose-elias-alvarez/null-ls.nvim",
})

-- mason.nvim
require("mason").setup()

---- vim commands ----
vim.cmd([[
  set number
  set relativenumber
  syntax on
]])

-- leader keys
vim.g.mapleader = " "
