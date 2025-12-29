require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "svelte" }
vim.lsp.enable(servers)

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Helper function to apply the new Neovim 0.11+ LSP setup
local function setup_server(server_name, config)
  -- Inject NvChad's default on_attach and capabilities
  config.on_attach = on_attach
  config.capabilities = capabilities  
  -- Neovim 0.11 uses 'root_markers' (table of strings) instead of 'root_dir' (function)
  -- Your config uses tables for root_dir, so we map them to root_markers.
  if config.root_dir then
    config.root_markers = config.root_dir
    config.root_dir = nil -- Clear the old key to avoid confusion
  end

  -- 1. Register the configuration
  vim.lsp.config[server_name] = config 
  -- 2. Enable the server (this creates the autocmds to start it)
  vim.lsp.enable(server_name)
end

-- GO (Gopls)
setup_server("gopls", {
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
})

-- Svelte
setup_server("svelte", {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_dir = {"package.json", "tsconfig.json", ".git", "svelte.config.json"},
})

-- Biome
setup_server("biome", {
  cmd = { "biome", "lsp" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte" },
  root_dir = {"package.json", "tsconfig.json", ".git"},
})

-- Python (PyLSP)
setup_server("pylsp", {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_dir = {"setup.py", "pyproject.toml", "tox.ini", ".git", "main.py", "app.py", "requirements.txt"},
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
})

-- Angular
setup_server("angularls", {
  cmd = { "ngserver", "--stdio" },
  filetypes = { "typescript", "html" },
  root_dir = {"angular.json", "workspace.json", ".git"},
  settings = {
    angular = {
      strictTemplates = true,
    },
  },
})
