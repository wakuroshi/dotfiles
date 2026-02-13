-- ───────────────────────────────
-- Mason setup
-- ───────────────────────────────
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "clangd",
    "rust_analyzer",
    "pyright",
    "jdtls",
    "marksman",
    "texlab",
    "lua_ls",
    "html"
  },
}

-- ───────────────────────────────
-- nvim-cmp (completion)
-- ───────────────────────────────
local cmp = require "cmp"
local luasnip = require "luasnip"

cmp.setup({
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})

-- ───────────────────────────────
-- Common LSP setup
-- ───────────────────────────────
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  
  vim.lsp.buf.formatting = function() end
end

-- ───────────────────────────────
-- Function to start a language server safely
-- ───────────────────────────────
local function start_server(name, opts)
  local cfg = vim.deepcopy(vim.lsp.config[name])
  if not cfg then
    vim.notify("No LSP config found for: " .. name, vim.log.levels.WARN)
    return
  end
  cfg.capabilities = capabilities
  cfg.on_attach = on_attach
  for k, v in pairs(opts or {}) do cfg[k] = v end
  vim.lsp.start(cfg)
end

-- ───────────────────────────────
-- Autocommands: Start LSPs by filetype
-- ───────────────────────────────
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp", "cuda" },
  callback = function() start_server("clangd") end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    start_server("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          linkedProjects = {},
        },
      },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function() start_server("pyright") end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function() start_server("jdtls") end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function() 
    start_server("marksman", {
      settings = {
        marksman = {
          math = {
            enabled = true
          }
        }
      }
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    start_server("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })
  end,
})

-- ───────────────────────────────
-- Diagnostics UI
-- ───────────────────────────────
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

