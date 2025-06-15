return {
  -- Use personal fork, until the following PR is merged:
  -- https://github.com/t-troebst/perfanno.nvim/pull/22
  'eljamm/perfanno.nvim',
  branch = 'nix-profiler',
  opts = {},
  keys = {
    { '<leader>plf', '<CMD>PerfLoadFlat<CR>', desc = 'Load Flat Profile' },
    { '<leader>plg', '<CMD>PerfLoadCallGraph<CR>', desc = 'Load Call Graph' },
    { '<leader>plo', '<CMD>PerfLoadFlameGraph<CR>', desc = 'Load Flame Graph' },
    { '<leader>pe', '<CMD>PerfPickEvent<CR>', desc = 'Pick Event' },
    { '<leader>pa', '<CMD>PerfAnnotate<CR>', desc = 'Annotate' },
    { '<leader>pf', '<CMD>PerfAnnotateFunction<CR>', desc = 'Annotate Function' },
    { '<leader>pa', '<CMD>PerfAnnotateSelection<CR>', mode = 'v', desc = 'Annotate Selection' },
    { '<leader>pt', '<CMD>PerfToggleAnnotations<CR>', desc = 'Toggle Annotations' },
    { '<leader>ph', '<CMD>PerfHottestLines<CR>', desc = 'Hottest Lines' },
    { '<leader>ps', '<CMD>PerfHottestSymbols<CR>', desc = 'Hottest Symbols' },
    { '<leader>pc', '<CMD>PerfHottestCallersFunction<CR>', desc = 'Hottest Callers Function' },
    { '<leader>pc', '<CMD>PerfHottestCallersSelection<CR>', mode = 'v', desc = 'Hottest Callers Selection' },
  },
}
