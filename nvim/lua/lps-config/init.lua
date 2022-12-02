local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
local util = require("vim.lsp.util")
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

--Typescript
lspconfig.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
})
--Python
lspconfig.pylsp.setup({
  on_attach = on_attach,
})
--Bash
lspconfig.bashls.setup({
  on_attach = on_attach,
})
--Lua
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
})
--C++
lspconfig.clangd.setup({
  on_attach = on_attach,
  filetypes = { "c", "cpp", "h", "hxx", "cxx" },
})
lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})
lspconfig.texlab.setup({
  on_attach = on_attach,
})
lspconfig.omnisharp.setup({
  on_attach = on_attach,
})
