return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  init = function()
    local Terminal = require('toggleterm.terminal').Terminal
    local term_count = 0

    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    ---@param opts { quick_toggle: boolean, disable_count: boolean }
    local mkTerminal = function(command, opts)
      local t_opts = opts or {}
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
        on_open = function(term)
          vim.cmd 'startinsert!'

          local toggleCmd = '<CMD>' .. term.id .. 'ToggleTerm<CR>'
          map('t', '<C-x>', [[<C-\><C-n>]], { buffer = term.bufnr })
          map({ 'n', 't' }, '<M-q>', toggleCmd, { buffer = term.bufnr })
          map({ 'n', 't' }, '<M-c>', '<CMD>close<CR>', { buffer = term.bufnr })

          if t_opts.quick_toggle then
            map({ 'n', 't' }, 'q', toggleCmd, { buffer = term.bufnr })
          end
        end,
        on_close = function(_)
          vim.cmd 'startinsert!'
        end,
      }

      if not t_opts.disable_count then
        term_count = term_count + 1
        terminal.count = term_count
      end

      return terminal
    end

    local get_git_dir = function(file_path)
      local buf_dir = file_path or vim.fn.expand '%:p:h'
      local git_dir = vim.fn.system('git -C ' .. buf_dir .. ' rev-parse --show-toplevel')
      if vim.v.shell_error == 0 then
        return vim.trim(git_dir)
      end
      return nil
    end

    local function toggle_term(term, cmd, topts)
      if term == nil or term.cmd ~= cmd then
        term = mkTerminal(cmd, topts or {})
      end
      term:toggle()
      return term
    end

    local M = {}

    --- ------- ---
    --- LazyGit ---
    --- ------- ---

    map({ 'n', 't' }, '<M-l>', function()
      M.lazygit = toggle_term(M.lazygit, 'lazygit')
    end, { desc = 'Lazygit' })

    -- Filter (Buffer)
    map('n', '<leader>lf', function()
      local file_path = vim.fn.expand '%:p'
      local cmd = 'lazygit -f ' .. file_path

      M.lazygit_filter = toggle_term(M.lazygit_filter, cmd, { disable_count = true })
    end, { desc = 'Lazygit Filter (Buffer)' })

    -- Repo (Buffer)
    map('n', '<leader>lb', function()
      local cmd = 'lazygit'
      local git_dir = get_git_dir()

      if git_dir then
        cmd = cmd .. ' -p ' .. git_dir
      end

      M.lazygit_buf = toggle_term(M.lazygit_buf, cmd)
    end, { desc = 'Lazygit Repo (Buffer)' })

    -- History
    map('n', '<leader>lh', function()
      M.lazygit_hist = toggle_term(M.lazygit_hist, 'lazygit log')
    end, { desc = 'Lazygit History' })

    --- ---- ---
    --- Misc ---
    --- ---- ---

    -- Taskwarrior
    map('n', '<leader>tw', function()
      M.twui = toggle_term(M.twui, 'taskwarrior-tui', { quick_toggle = true })
    end, { desc = 'Taskwarrior' })

    -- Gitu
    map({ 'n', 't' }, '<M-u>', function()
      M.gitu = toggle_term(M.gitu, 'gitu', { quick_toggle = true })
    end, { desc = 'Gitu' })

    -- Tig
    map('n', '<leader>tg', function()
      M.tig = toggle_term(M.tig, 'tig')
    end, { desc = 'Tig' })

    map({ 'n', 't' }, '<M-d>', function()
      M.float = toggle_term(M.float, 'zellij')
    end, { desc = 'Floating Terminal' })
  end,
}
