return {
  -- TODO: remove in favor of mini.pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
    config = function()
      require('nvim-autopairs').setup {
        -- Don't add pairs if it already has a close pair in the same line
        enable_check_bracket_line = false,

        ignored_next_char = [=[[%w%%%'%[%"%.%`%$%{]]=],
      }
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- TODO: remove in favor of mini.pairs
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
