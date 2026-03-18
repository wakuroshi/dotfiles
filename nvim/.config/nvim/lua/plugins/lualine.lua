require('lualine').setup({
  options = {
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {},
    lualine_b = {'mode'},
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = '[+]',
          readonly = '[-]', 
          unnamed = '[No Name]',
        }
      }
    },
    lualine_x = {'filetype'},
    lualine_y = {'location'},
    lualine_z = {}
  },
})
