local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local sources = {
  formatting.prettier.with({
    filetypes = { "javascript", "css", "scss", "html", "json", "yaml", "markdown", "graphql", "md", "txt" }, --html,css,js,ts,md
  }),
  formatting.markdownlint, --markdown
  formatting.shfmt,
}

null_ls.setup({
  sources = sources,
})
