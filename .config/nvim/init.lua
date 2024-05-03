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
  "ellisonleao/gruvbox.nvim",   -- gruvbox
  {
   -- "nvim-telescope/telescope.nvim",
    --dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "bfrg/vim-cpp-modern",
  "neovim/nvim-lspconfig",
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'vim-scripts/AutoComplPop',
})

----------------------
---- vim commands ----
vim.cmd([[
  set number
  set relativenumber
  syntax on
  colorscheme gruvbox
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set termguicolors
  set clipboard+=unnamedplus
  set complete+=kspell
  set completeopt=menuone,longest,noinsert
  tnoremap <Esc> <C-\><C-n>
  inoremap <C-Space> <C-p>
  set colorcolumn=80

]])

-- leader keys
vim.g.mapleader = " "

-- Telescope key binds
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


---- nvim cmp
--local cmp = require'cmp'
-- cmp.setup({
--    snippet = {
--      -- REQUIRED - you must specify a snippet engine
--      expand = function(args)
--        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--      end,
--    },
--    window = {
--      completion = cmp.config.window.bordered(),
--      documentation = cmp.config.window.bordered(),
--    },
--    mapping = cmp.mapping.preset.insert({
--      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
--      ['<C-Space>'] = cmp.mapping.complete(),
--      ['<C-e>'] = cmp.mapping.abort(),
--      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--    }),
--    sources = cmp.config.sources({
--      { name = 'nvim_lsp' },
--      -- { name = 'vsnip' }, -- For vsnip users.
--      { name = 'luasnip' }, -- For luasnip users.
--      -- { name = 'ultisnips' }, -- For ultisnips users.
--      -- { name = 'snippy' }, -- For snippy users.
--    }, {
--      { name = 'buffer' },
--    })
--  })

----- nvim lsp (with cmp)
---- clangd (C/C++)
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
--  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['clangd'].setup {
--    capabilities = capabilities
--}
---- tsserver (Typescript)
--require'lspconfig'.tsserver.setup{}
---- HTML
--require'lspconfig'.html.setup{
--  capabilities = capabilities,
--}
