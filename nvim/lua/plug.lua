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
  -- Postman
  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = "require('rest-config')",
  })
  use({
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = "require('flutter-config')"
  })
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
  -- [[ useins Go Here ]]
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- using packer.nvim
  -- Hop
  use({
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    config = "require('hop-config')",
  })
  -- cmp plugins
  use('hrsh7th/cmp-nvim-lsp')
  use('onsails/lspkind.nvim')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  -- lsp
  use("neovim/nvim-lspconfig")
  -- null-ls
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = "require('null-ls-config')",
  })
  use({
    'MunifTanjim/prettier.nvim',
    config = 'require("prettier-config")'
  })
  use({
    "williamboman/nvim-lsp-installer",
    config = "require('lps-config')",
  })
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
  }) -- auto close brackets, etc.
  -- [[ Theme ]]
  use({ "DanilaMihailov/beacon.nvim" }) -- cursor jump
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
