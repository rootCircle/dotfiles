-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local poetry = require "poetry-nvim"
local com_capabilities = vim.lsp.protocol.make_client_capabilities()
com_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Rust
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml")
})

-- Go Language
lspconfig.gopls.setup{}

-- HTML
lspconfig.html.setup {
  capabilities = com_capabilities,
}

-- JAVA
lspconfig.java_language_server.setup{}

-- JSON
lspconfig.jsonls.setup {
  capabilities = com_capabilities,
}

-- CLANGD (C, C++ etc)
lspconfig.clangd.setup{}

-- Kotlin
lspconfig.kotlin_language_server.setup{}

-- Markdown
lspconfig.remark_ls.setup{}
-- lspconfig.marksmen.setup()

-- Python
-- lspconfig.pylsp.setup{
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 100
--         }
--       }
--     }
--   }
-- }
lspconfig.ruff_lsp.setup{}

poetry.setup()

-- Ruby
-- lspconfig.solargraph.setup{}
-- lspconfig.standardrb.setup{}
lspconfig.typeprof.setup{}

-- Tailwind CSS
-- lspconfig.tailwindcss.setup{}

-- Vue
lspconfig.vuels.setup{}

-- Dockerfile
lspconfig.dockerls.setup{}

-- Zig
lspconfig.zls.setup{}
