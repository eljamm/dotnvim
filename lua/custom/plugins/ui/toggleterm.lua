return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  init = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local term_count = 0

    local mkTerminal = function(command, disable_count)
      local terminal = Terminal:new {
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

          local opts = { noremap = true, silent = true, buffer = term.bufnr }
          vim.keymap.set('t', '<C-x>', [[<C-\><C-n>]], opts)
          vim.keymap.set({ 'n', 't' }, '<C-q>', '<CMD>' .. term.id .. 'ToggleTerm<CR>', opts)
          vim.keymap.set({ 'n', 't' }, '<M-c>', '<CMD>close<CR>', opts)
        end,
        -- function to run on closing the terminal
        on_close = function(_)
          vim.cmd 'startinsert!'
        end,
      }

      if not disable_count then
        term_count = term_count + 1
        terminal.count = term_count
      end

      return terminal
    end

    -- Return git directory from file path
    local get_git_dir = function(file_path)
      local buf_dir = file_path or vim.fn.expand '%:p:h'
      local git_dir_cmd = 'git -C ' .. buf_dir .. ' rev-parse --show-toplevel'
      if vim.v.shell_error == 0 then
        return vim.trim(vim.fn.system(git_dir_cmd))
      end
      return nil
    end

    local function toggle_term(term, cmd)
      if term == nil or term.cmd ~= cmd then
        term = mkTerminal(cmd)
      end
      term:toggle()
      return term
    end

    -- LazyGit
    local lazygit = mkTerminal 'lazygit'
    vim.keymap.set({ 'n', 't' }, '<leader>lg', function()
      lazygit:toggle()
    end, { desc = 'Lazygit', noremap = true, silent = true })

    -- Lazygit Filter (Buffer)
    local lazygit_filter
    vim.keymap.set('n', '<leader>lf', function()
      local file_path = vim.fn.expand '%:p'
      local cmd = 'lazygit -f ' .. file_path

      if lazygit_filter == nil or lazygit_filter.cmd ~= cmd then
        lazygit_filter = mkTerminal(cmd, true)
      end

      lazygit_filter:toggle()
    end, { desc = 'Lazygit Filter (Buffer)', noremap = true, silent = true })

    -- Lazygit (Buffer)
    local lazygit_buf
    vim.keymap.set('n', '<leader>lb', function()
      local cmd = 'lazygit'
      local git_dir = get_git_dir()

      if git_dir then
        cmd = cmd .. ' -p ' .. git_dir
      end

      if lazygit_buf == nil or lazygit_buf.cmd ~= cmd then
        lazygit_buf = mkTerminal(cmd)
      end

      lazygit_buf:toggle()
    end, { desc = 'Lazygit (Buffer)', noremap = true, silent = true })

    -- Lazygit History
    local lazygit_hist
    vim.keymap.set('n', '<leader>lh', function()
      local cmd = 'lazygit log'

      if lazygit_hist == nil or lazygit_hist.cmd ~= cmd then
        lazygit_hist = mkTerminal(cmd)
      end

      lazygit_hist:toggle()
    end, { desc = 'Lazygit History', noremap = true, silent = true })

    -- Taskwarrior
    local twui
    vim.keymap.set('n', '<leader>tw', function()
      twui = toggle_term(twui, 'taskwarrior-tui')
    end, { desc = 'Taskwarrior', noremap = true, silent = true })

    -- Gitu
    local gitu
    vim.keymap.set('n', '<leader>gu', function()
      gitu = toggle_term(gitu, 'gitu')
    end, { desc = 'Gitu', noremap = true, silent = true })

    -- Tig
    local tig
    vim.keymap.set('n', '<leader>tg', function()
      tig = toggle_term(tig, 'tig')
    end, { desc = 'Tig', noremap = true, silent = true })
  end,
}
