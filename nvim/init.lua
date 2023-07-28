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
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "bfrg/vim-cpp-modern",
})

----------------------
---- vim commands ----
vim.cmd([[
  set number
  set relativenumber
  syntax on
  colorscheme monokai_pro
  set tabstop=4
  set shiftwidth=4
  set expandtab
  set termguicolors
  set clipboard+=unnamedplus
]])

-- leader keys
vim.g.mapleader = " "

-- Telescope key binds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
