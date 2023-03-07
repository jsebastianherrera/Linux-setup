local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.api.nvim_command("packadd packer.nvim")
end
return require("packer").startup(function()
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("turbio/bracey.vim")
  -- Bufferline
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons',
    config = "require('bufferline-config')" }
  -- Commenter
  use({
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup({ create_mappings = false })
    end
  })
  -- Coc
  use({ "neoclide/coc.nvim" ,branch='release' })
  -- TREE
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('nerdtree-config')",
  })
  -- TREESITTER
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require('treesitter-config')",
  })
  -- AUTOPAIRS
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })                                    -- auto close brackets, etc.
  -- STATUS BAR
  use({
    "nvim-lualine/lualine.nvim", -- statusline
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = "require('lualine-config')",
  })
  -- THEME
  use({ "morhetz/gruvbox" })
  -- FILE EXPLORER
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  -- RAINBOW
  use({ "p00f/nvim-ts-rainbow", config = "require('rainbow-config')" })
  -- Blank lines
  use({ "lukas-reineke/indent-blankline.nvim", config = "require('blankline-config')" })
end)
