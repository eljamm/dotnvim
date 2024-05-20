return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- TEST:
  {
    'cohama/lexima.vim',
    enabled = false,
    event = 'InsertEnter',
    config = function()
      vim.cmd [[ 
        call lexima#add_rule({'char': '{', 'input_after': '},', 'filetype': ['lua']})
        " nix
        call lexima#add_rule({'char': '{', 'input_after': '};', 'filetype': ['nix']})
        call lexima#add_rule({'char': '[', 'input_after': '];', 'filetype': ['nix']})
      ]]
    end,
  },
}
