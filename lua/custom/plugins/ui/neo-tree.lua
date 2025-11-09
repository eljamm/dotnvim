return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    cmd = { 'Neotree' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
      'MunifTanjim/nui.nvim',
    },
    opts = {
      close_if_last_window = true,
      window = {
        mappings = {
          ['l'] = 'open',
          ['S'] = 'open_split',
          ['V'] = 'open_vsplit',
          ['<M-l>'] = 'system_open',
          ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
          -- ['P'] = 'focus_preview',
          ['<M-p>'] = { 'scroll_preview', config = { direction = 10 } },
          ['<M-n>'] = { 'scroll_preview', config = { direction = -10 } },
          ['D'] = 'delete',
          ['d'] = 'trash',
          ['u'] = 'restore_trash',
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        commands = {
          -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/202#issuecomment-2996740957
          trash = function(state)
            local inputs = require 'neo-tree.ui.inputs'
            local manager = require 'neo-tree.sources.manager'
            local path = state.tree:get_node().path
            local utils = require 'neo-tree.utils'
            local _, name = utils.split_path(path)

            local msg = string.format("Are you sure you want to trash '%s'?", name)

            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end

              pcall(function()
                vim.fn.system { 'trash', path }
                if vim.v.shell_error ~= 0 then
                  msg = 'trash command failed.'
                  vim.notify(msg, vim.log.levels.ERROR, { title = 'neo-tree' })
                end
              end)

              manager.refresh(state.name)
            end)
          end,

          trash_visual = function(state, selected_nodes)
            local inputs = require 'neo-tree.ui.inputs'
            local manager = require 'neo-tree.sources.manager'
            local msg = 'Are you sure you want to trash ' .. #selected_nodes .. ' files ?'

            vim.cmd 'startinsert'
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end

              for _, node in ipairs(selected_nodes) do
                pcall(function()
                  vim.fn.system { 'trash', node.path }
                  if vim.v.shell_error ~= 0 then
                    msg = 'trash command failed.'
                    vim.notify(msg, vim.log.levels.ERROR, { title = 'neo-tree' })
                  end
                end)
              end

              manager.refresh(state.name)
            end)
          end,

          restore_trash = function(state)
            local inputs = require 'neo-tree.ui.inputs'
            local manager = require 'neo-tree.sources.manager'
            local root = vim.fn.getcwd()
            local cmd_output = vim.fn.system 'trash-list'
            local lines = vim.split(cmd_output, '\n', { plain = true })
            local trashed_items = {}

            local function get_duplicated_items(items, path)
              local duplicated_items = {}
              for _, item in ipairs(items) do
                if item.path == path then
                  table.insert(duplicated_items, item)
                end
              end
              return duplicated_items
            end

            local function get_index(duplicated_items, dt)
              local idx = 0
              for id, item in ipairs(duplicated_items) do
                if item.dt == dt then
                  idx = id - 1
                end
              end
              return idx
            end

            local function execute_restore(path, id, opts)
              opts = opts or ''
              id = id or 0
              local cmd = 'echo "' .. id .. '" | trash-restore  --sort date ' .. opts .. ' "' .. path .. '"'
              pcall(function()
                vim.fn.system(cmd)
                if vim.v.shell_error == 0 then
                  vim.notify('File restored\n' .. path, vim.log.levels.INFO, { title = 'neo-tree' })
                  manager.refresh(state.name)
                else
                  vim.notify('Cannot restore\n' .. path, vim.log.levels.ERROR, { title = 'neo-tree' })
                end
              end)

              -- TODO: If the file in the path is open on the buffer, reload the buffer.
            end

            for _, item in ipairs(lines) do
              if item ~= '' then
                local dt, path = item:match '^(%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d)%s+(.*)$'
                local relpath = vim.fs.relpath(root, path)
                if relpath ~= nil then -- Add item, if the path is in current root
                  table.insert(trashed_items, { dt = dt, path = path, relpath = relpath })
                end
              end
            end

            if #trashed_items == 0 then
              vim.notify('No files/dirs in `trash-list`', vim.log.levels.WARN, { title = 'neo-tree' })
              return
            end

            table.sort(trashed_items, function(a, b)
              return a.dt > b.dt
            end) -- Sort by date (new -> old)
            -- This sorting is opposite from the default `trash-restore --sort date` order.
            -- So need to reverse index later.

            vim.ui.select(trashed_items, {
              prompt = 'Select trashed file:',
              format_item = function(item)
                return item.dt .. ' ' .. item.relpath
              end,
            }, function(choice)
              if choice == nil then
                return
              end

              local duplicated_items = get_duplicated_items(trashed_items, choice.path)
              local idx = get_index(duplicated_items, choice.dt)
              local rev_idx = #duplicated_items - idx - 1 -- Reverse index

              local exists = vim.fn.filereadable(choice.path)
              if exists == 1 then
                local msg = 'File already exists. Are you sure to overwrite it?'
                inputs.confirm(msg, function(overwrite)
                  if overwrite then
                    execute_restore(choice.path, rev_idx, '--overwrite')
                  end
                end)
              else
                execute_restore(choice.path, rev_idx)
              end
            end)
          end,
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        end,
      },
      event_handlers = {
        -- Use normal mode for renaming files
        {
          event = 'neo_tree_popup_input_ready',
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- -- enter input popup with normal mode by default.
            -- vim.cmd 'stopinsert'

            -- map <esc> to enter normal mode (by default closes prompt)
            -- don't forget `opts.buffer` to specify the buffer of the popup.
            vim.keymap.set('i', '<esc>', vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    },
    init = function()
      vim.keymap.set(
        { 'n', 'x', 't' },
        '<C-n>',
        '<CMD>Neotree toggle position=left<CR>',
        { desc = 'Toggle [N]eoTree', nowait = true }
      )
      -- vim.keymap.set(
      --   { 'n', 'x', 't' },
      --   '<C-f>',
      --   '<CMD>Neotree float reveal toggle<CR>',
      --   { desc = 'Toggle [F]ull NeoTree' }
      -- )
    end,
  },
}
