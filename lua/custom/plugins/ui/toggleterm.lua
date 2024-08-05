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
        hidden = true,
        float_opts = {
          border = 'curved',
          width = math.ceil(vim.o.columns * 0.9),
          height = math.ceil(vim.o.lines * 0.9) - 1,
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

    -- Return git directory from file path
    local get_git_dir = function()
      local buf_dir = vim.fn.expand '%:p:h'
      local git_dir_cmd = 'git -C ' .. buf_dir .. ' rev-parse --show-toplevel'
      return vim.trim(vim.fn.system(git_dir_cmd))
    end

    -- LazyGit
    vim.keymap.set('n', '<leader>lg', function()
      mkTerminal('lazygit'):toggle()
    end, { desc = 'Lazygit', noremap = true, silent = true })

    -- Lazygit Filter (Buffer)
    vim.keymap.set('n', '<leader>lf', function()
      local git_dir = get_git_dir()

      local file_path = vim.fn.expand '%:p'
      local relative_file_path = string.sub(file_path, #git_dir + 2)
      mkTerminal('lazygit -p ' .. git_dir .. ' -f ' .. relative_file_path):toggle()
    end, { desc = 'Lazygit Filter (Buffer)', noremap = true, silent = true })

    -- Lazygit (Buffer)
    vim.keymap.set('n', '<leader>lc', function()
      mkTerminal('lazygit -p ' .. get_git_dir()):toggle()
    end, { desc = 'Lazygit (Buffer)', noremap = true, silent = true })

    -- Taskwarrior
    vim.keymap.set('n', '<leader>tw', function()
      mkTerminal('taskwarrior-tui'):toggle()
    end, { desc = 'Taskwarrior', noremap = true, silent = true })
  end,
}
