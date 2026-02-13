-- Setup Rosé Pine
require('rose-pine').setup({
  variant = 'dawn',
})

-- Set colorscheme
vim.cmd('colorscheme rose-pine')

vim.opt.background = 'light'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = ' ' }

vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#f2e9e1' })
