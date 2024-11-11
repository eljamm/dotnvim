return {
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = { 'scss', 'css', 'html' },
      user_default_options = {
        names = false, -- "Name" codes like Blue or blue
        sass = { enable = true, parsers = { 'css' } }, -- Enable sass colors
      },
    },
  },
}
