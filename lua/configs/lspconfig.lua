require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "svelte" }
vim.lsp.enable(servers)

local lspconfig = require("lspconfig")
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- read :h vim.lsp.config for changing options of lsp servers 

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = {"go.work", "go.mod", "main.go"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_dir = {"package.json", "tsconfig.json", ".git", "svelte.config.json"},
}

lspconfig.biome.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "biome", "lsp" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
  root_dir = {"package.json", "tsconfig.json", ".git"},
}

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_dir = {"setup.py", "pyproject.toml", "tox.ini", ".git", "main.py", "app.py", "requirements.txt",},
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = true },
        pycodestyle = { enabled = true, maxLineLength = 79 },
        black = { enabled = true, lineLength = 79 },
        isort = { enabled = true, profile = "black" },
      },
    },
  },
}

lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ngserver", "--stdio" },
  filetypes = { "typescript", "html" },
  root_dir = {"angular.json", "workspace.json", ".git"},
  settings = {
    angular = {
      strictTemplates = true,
    },
  },
}
