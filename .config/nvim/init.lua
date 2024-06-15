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
  'hrsh7th/cmp-nvim-lsp'                       ,
  'hrsh7th/cmp-buffer'                         ,
  'hrsh7th/cmp-path'                           ,
  'hrsh7th/cmp-cmdline'                        ,
  'hrsh7th/nvim-cmp'                           ,
  'NLKNguyen/papercolor-theme'                 ,
  'saadparwaiz1/cmp_luasnip' ,
  --'vim-scripts/AutoComplPop'                   ,
  "L3MON4D3/LuaSnip",
  'godlygeek/tabular'                          ,
  'Lokaltog/vim-powerline'
})

----------------------
---- vim commands ----
vim.cmd([[
  set           number
  set           relativenumber
  syntax        on
  colorscheme   gruvbox
  set           tabstop=2
  set           shiftwidth=2
  set           expandtab
  set           termguicolors
  set           clipboard+=unnamedplus
  set           complete+=kspell,.,w,b,u,t,i,d
  set           completeopt=menuone,noinsert,preview,menu
  tnoremap      <Esc>                                       <C-\><C-n>
  inoremap      <C-Space>                                   <C-p>
  set           colorcolumn=100
  set           background=dark

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
  nnoremap      <C-t> :tabnew 0<CR>
]])

-- leader keys
vim.g.mapleader = " "

-- Telescope.nvim key binds
local builtin = require('telescope.builtin')
vim.keymap.set('n' , '<leader>ff' , builtin.find_files , {})
vim.keymap.set('n' , '<leader>fg' , builtin.live_grep  , {})
vim.keymap.set('n' , '<leader>fb' , builtin.buffers    , {})
vim.keymap.set('n' , '<leader>fh' , builtin.help_tags  , {})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'tsserver', 'rust_analyzer', 'zls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
}
