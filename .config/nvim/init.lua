-------------------
---- lazy nvim ----
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git"                                    ,
    "clone"                                  ,
    "--filter=blob:none"                     ,
    "https://github.com/folke/lazy.nvim.git" ,
    "--branch=stable"                        , -- latest stable release
    lazypath                                 ,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy nvim plugins
require("lazy").setup({
  -- colorscheme
  "hzchirs/vim-material"                       ,
  "phanviet/vim-monokai-pro"                   ,
  "nordtheme/vim"                              ,
  "ellisonleao/gruvbox.nvim"                   , -- gruvbox
  {
    "nvim-telescope/telescope.nvim"            ,
    dependencies = { 'nvim-lua/plenary.nvim' }
  }                                            ,
  "bfrg/vim-cpp-modern"                        ,
  "neovim/nvim-lspconfig"                      ,
  "williamboman/mason.nvim"                    ,
  "williamboman/mason-lspconfig.nvim"          ,
  'hrsh7th/cmp-nvim-lsp'                       ,
  'hrsh7th/cmp-buffer'                         ,
  'hrsh7th/cmp-path'                           ,
  'hrsh7th/cmp-cmdline'                        ,
  'hrsh7th/nvim-cmp'                           ,
  'vim-scripts/AutoComplPop'                   ,
  'godlygeek/tabular'
})

----------------------
---- vim commands ----
vim.cmd([[
  set           number
  set           relativenumber
  syntax        on
  colorscheme   vim-material
  set           tabstop=4
  set           shiftwidth=4
  set           expandtab
  set           termguicolors
  set           clipboard+=unnamedplus
  set           complete+=kspell,.,w,b,u,t,i,d
  set           completeopt=menuone,noinsert,preview,menu
  tnoremap      <Esc>                                       <C-\><C-n>
  inoremap      <C-Space>                                   <C-p>
  set           colorcolumn=100
  set           background=light
  set           nowrap

  nnoremap      <M-1> :tabn 1<CR>
  nnoremap      <M-2> :tabn 2<CR>
  nnoremap      <M-3> :tabn 3<CR>
  nnoremap      <M-4> :tabn 4<CR>
  nnoremap      <M-5> :tabn 5<CR>
  nnoremap      <M-6> :tabn 6<CR>
  nnoremap      <M-7> :tabn 7<CR>
  nnoremap      <M-8> :tabn 8<CR>
  nnoremap      <M-9> :tabn 9<CR>
  nnoremap      <M-0> :tabn 0<CR>
]])

-- leader keys
vim.g.mapleader = " "

-- Telescope.nvim key binds
local builtin = require('telescope.builtin')
vim.keymap.set('n' , '<leader>ff' , builtin.find_files , {})
vim.keymap.set('n' , '<leader>fg' , builtin.live_grep  , {})
vim.keymap.set('n' , '<leader>fb' , builtin.buffers    , {})
vim.keymap.set('n' , '<leader>fh' , builtin.help_tags  , {})


-- mason nvim --
require("mason").setup()
-- lspconfig --
