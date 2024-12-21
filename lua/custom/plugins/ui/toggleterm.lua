return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  init = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local term_count = 0

    local mkTerminal = function(command)
      term_count = term_count + 1
      return Terminal:new {
        cmd = command,
        count = term_count,
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

          local opts = { noremap = true, silent = true, buffer = term.bufnr }
          vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
          vim.keymap.set('t', 'q', '<CMD>' .. term.count .. 'ToggleTerm<CR>', opts)
          vim.keymap.set({ 'n', 't' }, 'Q', '<CMD>close<CR>', opts)
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
    local lazygit = mkTerminal 'lazygit'
    vim.keymap.set({ 'n', 't' }, '<leader>lg', function()
      lazygit:toggle()
    end, { desc = 'Lazygit', noremap = true, silent = true })

    -- Lazygit Filter (Buffer)
    local git_dir = get_git_dir()
    local file_path = vim.fn.expand '%:p'
    local relative_file_path = string.sub(file_path, #git_dir + 2)
    local lazygit_filter = mkTerminal('lazygit -p ' .. git_dir .. ' -f ' .. relative_file_path)
    vim.keymap.set('n', '<leader>lf', function()
      lazygit_filter:toggle()
    end, { desc = 'Lazygit Filter (Buffer)', noremap = true, silent = true })

    -- Lazygit (Buffer)
    local lazygit_buf = mkTerminal('lazygit -p ' .. get_git_dir())
    vim.keymap.set('n', '<leader>lc', function()
      lazygit_buf:toggle()
    end, { desc = 'Lazygit (Buffer)', noremap = true, silent = true })

    -- Lazygit History
    local lazygit_hist = mkTerminal 'lazygit log'
    vim.keymap.set('n', '<leader>lh', function()
      lazygit_hist:toggle()
    end, { desc = 'Lazygit History', noremap = true, silent = true })

    -- Taskwarrior
    local taskwarrior_tui = mkTerminal 'taskwarrior-tui'
    vim.keymap.set({ 'n', 't' }, '<leader>tw', function()
      taskwarrior_tui:toggle()
    end, { desc = 'Taskwarrior', noremap = true, silent = true })

    -- Gitu
    local gitu = mkTerminal 'gitu'
    vim.keymap.set('n', '<leader>gu', function()
      gitu:toggle()
    end, { desc = 'Gitu', noremap = true, silent = true })

    -- Tig
    local tig = mkTerminal 'tig'
    vim.keymap.set('n', '<leader>tg', function()
      tig:toggle()
    end, { desc = 'Tig', noremap = true, silent = true })
  end,
}
