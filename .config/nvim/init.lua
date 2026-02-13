-- BOOTSTRAP VIM PACKER

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- IMPORT PLUGINS AND CONFIGURATION
require("colors")
require("plugins")
require("config")

-- PLUGINS INSTALLATION
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
   'nvim-telescope/telescope.nvim',
   tag = '0.1.8',
   requires = {{'nvim-lua/plenary.nvim'}}
   }
  use 'windwp/nvim-autopairs'
  use 'romgrk/barbar.nvim'
  -- THEMING
  use 'sainnhe/gruvbox-material'
  use 'rose-pine/neovim'
  use 'itsfernn/auto-gnome-theme.nvim'
  use 'goolord/alpha-nvim'
  use 'vimwiki/vimwiki'
	-- LSP + Completion
  use 'neovim/nvim-lspconfig'          -- Base LSP support
  use 'williamboman/mason.nvim'        -- Easy LSP/DAP/Linter installer
  use 'williamboman/mason-lspconfig.nvim' -- Bridge between mason and lspconfig
  use 'hrsh7th/nvim-cmp'               -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'           -- LSP completions
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'catgoose/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'ThePrimeagen/harpoon'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
