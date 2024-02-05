local Path = require "plenary.path"
local config = require "session_manager.config"

local options = {
  sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"),
  session_filename_to_dir = session_filename_to_dir,
  dir_to_session_filename = dir_to_session_filename,
  -- Possible values: Disabled, CurrentDir, LastSession
  autoload_mode = config.AutoloadMode.CurrentDir,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_dirs = { "/home/kuroko", "/home/kuroko/" },
  autosave_ignore_filetypes = {
    "gitcommit",
    "gitrebase",
  },
  autosave_ignore_buftypes = {},
  autosave_only_in_session = false,
  max_path_length = 80,
}

require("session_manager").setup(options)
