return {
  'habamax/vim-godot',
  ft = 'gdscript',
  dependencies = {
    {
      'tpope/vim-dispatch',
    },
    {
      'junegunn/fzf',
      'junegunn/fzf.vim',
    },
  },
  init = function()
    local map = vim.keymap.set

    map({ 'n' }, '<F3>', '<CMD>GodotRunFZF<CR>', { desc = 'Fuzzy Run Godot Scenes' })
    map({ 'n' }, '<F4>', '<CMD>GodotRunLast<CR>', { desc = 'Run Last Godot Scene' })
    map({ 'n' }, '<F5>', '<CMD>GodotRun<CR>', { desc = 'Run Godot Scene' })
    map({ 'n' }, '<F6>', '<CMD>GodotRunCurrent<CR>', { desc = 'Run Current Godot Scene' })

    vim.g.godot_executable = 'godot4'
  end,
}
