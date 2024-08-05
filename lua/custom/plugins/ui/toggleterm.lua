return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  init = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local mkTerminal = function(command)
      return Terminal:new {
        cmd = command,
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'curved',
          width = math.floor(vim.fn.winwidth(0) * 0.9),
          height = math.floor(vim.fn.winheight(0) * 0.95),
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(_)
          vim.cmd 'startinsert!'
        end,
      }
    end

    -- LazyGit
    vim.keymap.set('n', '<leader>lt', function()
      mkTerminal('lazygit'):toggle()
    end, { desc = 'Lazygit', noremap = true, silent = true })

    -- Taskwarrior
    vim.keymap.set('n', '<leader>tw', function()
      mkTerminal('taskwarrior-tui'):toggle()
    end, { desc = 'Taskwarrior', noremap = true, silent = true })
  end,
}
