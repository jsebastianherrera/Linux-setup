--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command
vim.g.livepreview_previewer = 'zathura'
vim.g.LLPStartPreview = 'LLP'
vim.g.livepreview_engine = 'pdflatex'
-- [[ Theme ]]
cmd('colorscheme gruvbox') -- cmd:  Set the colorscheme
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable
-- [[ Custom ]]
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.wrap = false -- display lines as one long line
opt.showtabline = 2 -- always show tabs
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.relativenumber = true -- display relative numbers
opt.numberwidth = 1
opt.hidden = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.ruler = true
opt.cursorline = true
opt.fileencoding = 'utf-8'
opt.showcmd = true
opt.sw = 2
opt.cmdheight = 1
opt.smartindent = true
opt.expandtab = true
opt.laststatus = 1
opt.shiftwidth = 2
opt.tabstop = 2
opt.splitbelow = true
opt.splitright = true
