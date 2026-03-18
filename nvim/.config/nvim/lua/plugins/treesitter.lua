require 'nvim-treesitter'.setup {
ensure_installed = {"python","c","rust","cpp", "csv", "css", "cpp", "bash", "json", "lua", "javascript", "html", "yaml", "java", "markdown", "markdown_inline"},

sync_install = false,
auto_install = true,
highlight = {
  enable = true,
},
}
