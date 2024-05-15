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

    map({ 'n' }, '<F3>', '<cmd>GodotRunFZF<cr>', { desc = 'Fuzzy Run Godot Scenes' })
    map({ 'n' }, '<F4>', '<cmd>GodotRunLast<cr>', { desc = 'Run Last Godot Scene' })
    map({ 'n' }, '<F5>', '<cmd>GodotRun<cr>', { desc = 'Run Godot Scene' })
    map({ 'n' }, '<F6>', '<cmd>GodotRunCurrent<cr>', { desc = 'Run Current Godot Scene' })

    vim.g.godot_executable = 'godot4'
  end,
}
