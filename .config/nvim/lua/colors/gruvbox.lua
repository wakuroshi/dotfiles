-- Global variables (still use vim.g in Lua)
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_better_performance = 1

-- Your custom foreground color
vim.g.gruvbox_material_colors_override = {
  fg0 = {'#fbf1c7', '230'},
  fg1 = {'#ebdbb2', '223'},
  fg2 = {'#d5c4a1', '250'},
  fg3 = {'#bdae93', '248'},
  fg4 = {'#a89984', '246'}
}

-- Set colorscheme
vim.cmd('colorscheme gruvbox-material')

-- CORRECT: Use vim.opt for options in Lua files
vim.opt.background = 'dark'
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = ' ' }  -- No ~ at end of buffer

-- Highlight current line
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#3c3836' })
