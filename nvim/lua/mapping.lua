vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
map("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })
-- Moving between tabs
map("n", "<C-RIGHT>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
map("n", "<C-LEFT>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
map("n", "<C-a>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
map("n", "<C-d>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
map("n", "<leader>tp", ":BufferLineToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>w", ":bdelete!<CR>", { noremap = true, silent = true })
-- Moving lines up or down
map("n", "<A-s>", ":m .+1<CR>==", { noremap = true, silent = true })
map("n", "<A-w>", ":m .-2<CR>==", { noremap = true, silent = true })
-- Scrollig
map("n", "<C-UP>", "5<C-y>", { noremap = true, silent = true })
map("n", "<C-DOWN>", "5<C-e>", { noremap = true, silent = true })
-- Saving a quitting file custom command
map("n", "<leader>q", ":q <CR>", { noremap = true, silent = true })
-- Moving between windows
map("n", "<A-LEFT>", "<C-w>h", { noremap = true, silent = true })
map("n", "<A-RIGHT>", "<C-w>l", { noremap = true, silent = true })
map("n", "<A-DOWN>", "<C-w>j", { noremap = true, silent = true })
map("n", "<A-UP>", "<C-w>k", { noremap = true, silent = true })
-- Open tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- Search files with Telescope
map("n", "<leader>p", ":Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<leader>i", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
map("n", "<leader>o", ":Telescope live_grep<CR>", { noremap = true, silent = true })
-- Resizing windowsnmap <A-S-RIGHT> 5<C-w>>
map("n", "<A-S-RIGHT>", "5<C-w>>", { noremap = true, silent = true })
map("n", "<A-S-LEFT>", "5<C-w><", { noremap = true, silent = true })
map("n", "<A-S-UP>", "5<C-w>+", { noremap = true, silent = true })
map("n", "<A-S-DOWN>", "5<C-w>-", { noremap = true, silent = true })
-- LSP REFERENCE
map("n", "<space>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { noremap = true, silent = true })
map("n", "gr", ":lua vim.lsp.buf.references() <CR>", { noremap = true, silent = true })
map("n", "gd", ":lua vim.lsp.buf.definition() <CR>", { noremap = true, silent = true })
map("n", "ca", ":lua vim.lsp.buf.code_action() <CR>", { noremap = true, silent = true })
map("n", "K", ":lua vim.lsp.buf.hover() <CR>", { noremap = true, silent = true })
map("n", "<leader>rn", ":lua vim.lsp.buf.rename() <CR>", { noremap = true, silent = true })
-- Commenter
map("n", "<leader>cc", ":CommentToggle <CR>", { noremap = true, silent = true })
map("n", "<leader>cv", ":'<,'>CommentToggle <CR>", { noremap = true, silent = true })
-- Line management
map("n", "<leader>lb", "0", { noremap = true, silent = true })
map("n", "<leader>le", "$", { noremap = true, silent = true })
-- Sessions
local session_dir = "~/.vim/sessions"
local dirname = vim.api.nvim_command_output("echo substitute(getcwd(), '^.*/', '', '')")
map("n", "<leader>ll", ":mks! " .. session_dir .. "/" .. dirname .. ".vim", { noremap = true, silent = false })
map("n", "<leader>ls", ":so " .. session_dir .. "/", { noremap = true, silent = false })
