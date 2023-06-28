-------------------
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
  -- colorscheme
  "phanviet/vim-monokai-pro",
  "nordtheme/vim",
})

----------------------
---- vim commands ----
vim.cmd([[
  set number
  set relativenumber
  syntax on
  colorscheme nord
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set termguicolors
  set clipboard+=unnamedplus
]])

-- leader keys
vim.g.mapleader = " "
