vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {},
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      git = {
        ignore = false,
      },
    })
  end,
  keys = {
    { '<c-n>', ':NvimTreeFindFileToggle<CR>', desc = 'Toggle Nvim Tree' }
  }
}
