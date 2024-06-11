return {
  -- Toggle pre-set and custom language injections in session
  {
    'Dronakurl/injectme.nvim',
    enabled = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    -- This is for lazy load and more performance on startup only
    cmd = { 'InjectmeToggle', 'InjectmeSave', 'InjectmeInfo', 'InjectmeLeave' },
  },
}
