vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.opt.termguicolors = true
vim.o.background = light

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

require("lazy").setup({
  { "williamboman/mason.nvim",
  build = ":MasonUpdate" },
  "williamboman/mason-lspconfig.nvim", lazy = false,
  "neovim/nvim-lspconfig", lazy = false,
  { "rose-pine/neovim", name = "rose-pine" },
  "shaunsingh/solarized.nvim", lazy = false,
  {
  "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd [[ colorscheme NeoSolarized ]]
    end
   }
})
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").csharp_ls.setup({})
require("solarized") -- to use solarized theme
-- require("rosepine") -- to use rose pine theme
