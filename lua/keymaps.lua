local wk = require("which-key")

-- Clear highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Format file
-- vim.keymap.set('n', '<F2>', ':Format<CR>', { desc = 'Format file' })
vim.keymap.set('n', '<F2>', ':lua vim.lsp.buf.format()<CR>', { desc = 'Format file' })

-- Which-key setup
wk.register({
  f = {
    name = "+file",
    b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
    d = { "<cmd>Telescope diagnostics<cr>", "Find Diagnostics" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "Find Word" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help Tags" },
    n = { "<cmd>enew<cr>", "New File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    s = { "<cmd>Telescope session-lens<cr>", "Search Sessions" }
  },
  b = {
    name = "+buffer",
  },
  g = {
    name = "+git",
    b = { "<cmd>VGit buffer_blame_preview<cr>", "vgit: Blame Preview" },
    d = { "<cmd>VGit project_diff_preview<cr>", "vgit: Project Diff Preview" },
    f = { "<cmd>VGit buffer_diff_preview<cr>", "vgit: Diff Preview" },
    g = { "<cmd>VGit buffer_gutter_blame_preview<cr>", "vgit: Gutter Blame Preview" },
    h = { "<cmd>VGit buffer_history_preview<cr>", "vgit: History Preview" },
    ls = { "<cmd>VGit project_hunks_staged_preview<cr>", "vgit: Hunks Staged Preview" },
    lu = { "<cmd>VGit buffer_hunks_preview<cr>", "vgit: Hunks Preview" },
    p = { "<cmd>VGit buffer_hunk_preview<cr>", "vgit: Hunk Preview" },
    q = { "<cmd>VGit project_hunks_qf<cr>", "vgit: Project Hunks" },
    r = { "<cmd>VGit buffer_hunk_reset<cr>", "vgit: Hunk Reset" },
    s = { "<cmd>VGit buffer_hunk_stage<cr>", "vgit: Hunk Stage" },
    u = { "<cmd>VGit buffer_reset<cr>", "vgit: Buffer reset" },
    x = { "<cmd>VGit toggle_diff_preference<cr>", "vgit: Diff Preference" },
  },
  t = {
    name = "+trouble",
    t = { "<Cmd>TroubleToggle<CR>", "trouble: Toggle" },
    q = { "<Cmd>TroubleToggle quickfix<CR>", "trouble: Quick Fix" },
    w = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "trouble: Workspace Diagnostics" },
    d = { "<Cmd>TroubleToggle document_diagnostics<CR>", "trouble: Document Diagnostics" },
    l = { "<Cmd>TroubleToggle loclist<CR>", "trouble: LocList" },
  }
}, { prefix = "<leader>" })
