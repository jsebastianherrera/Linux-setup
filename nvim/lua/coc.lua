vim.g.mapleader = " "
local command = vim.api.nvim_command
local map = vim.api.nvim_set_keymap
command(
  'let g:coc_global_extensions = ["coc-diagnostic","coc-highlight","coc-css","coc-snippets","coc-emmet","coc-prettier","coc-xml","coc-java", "coc-pyright", "coc-lua","coc-clangd","coc-htmldjango","coc-json"]')
-- Mapping on hover
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end
map("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
map("i", '<c-space>', "coc#refresh()", { silent = true, expr = true })
map('i', '<Tab>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', { silent = true, expr = true })
map('i', '<S-Tab>', 'coc#pum#visible() ? coc#pum#prev(1) : "<S-Tab>"', { silent = true, expr = true })
-- map('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm(1) : "whoami"', { expr = true})
