-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require "lspconfig"
local poetry = require "poetry-nvim"
local com_capabilities = vim.lsp.protocol.make_client_capabilities()
com_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Rust
-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = lspconfig.util.root_pattern("Cargo.toml")
-- })

-- Go Language
lspconfig.gopls.setup{}

-- HTML
lspconfig.html.setup {
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
-- lspconfig.ruff.setup{}
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

-- Bash
lspconfig.bashls.setup{}

-- Lua


-- Dockerfile
lspconfig.dockerls.setup{}

-- JavaScript
lspconfig.denols.setup{}
lspconfig.eslint.setup{}
lspconfig.flow.setup{}

-- Zig
lspconfig.zls.setup{}

