local overseer = require "overseer"

local opts = {
  templates = { "builtin" },
}

overseer.setup(opts)
overseer.register_template(require "custom.configs.overseer.go")
