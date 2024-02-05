# Description

My [NvChad](https://github.com/NvChad/NvChad) config, built on top of the default configuration.

# Extra plugins

- [better-escape.nvim](https://github.com/max397574/better-escape.nvim): Escape from insert mode without delay when typing 
- [conform.nvim](https://github.com/stevearc/conform.nvim): Lightweight yet powerful formatter plugin for Neovim
- [alpha-nvim](https://github.com/goolord/alpha-nvim): Lua-powered greeter like vim-startify / dashboard-nvim 
- [neovim-session-manager](https://github.com/Shatur/neovim-session-manager): Simple wrapper around :mksession
- [crates.nvim](https://github.com/saecki/crates.nvim): Helps managing Rust crates.io dependencies
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim): Supercharge your Rust experience in Neovim!
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) (WIP): Debug Adapter Protocol client implementation for Neovim
- [nvim-dap-go](https://github.com/leoluz/nvim-dap-go): Extension for nvim-dap, for launching go debugger (delve)
- [vim-godot](habamax/vim-godot): Allows editing [Godot](https://godotengine.org/) files in vim
- [trouble.nvim](https://github.com/folke/trouble.nvim): Awesome plugin for diagnostics and references lists
- [leap.nvim](https://github.com/ggandor/leap.nvim): Makes moving and jumping to words easier
- [debugprint.nvim](https://github.com/andrewferrier/debugprint.nvim): Debugging in NeoVim the print() way!
- [noice.nvim](https://github.com/folke/noice.nvim): Highly experimental plugin that enhances the UI
- [focus.nvim](https://github.com/nvim-focus/focus.nvim): Auto-Focusing and Auto-Resizing Splits/Windows
- [tabout.nvim](https://github.com/abecodes/tabout.nvim): Tab out of special characters like parenthesis and brackets

# Installation Steps

First, clone the main NvChad repo to the configuration directory:

```
$ git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```

Next, either copy the contents of this directory, or symlink them to the following paths:

```
$ git clone https://gitlab.com/eljamm/dotnvim ~/.config/nvim-chad --depth 1
$ ln -s ~/.config/nvim-chad/custom ~/.config/nvim/lua/custom
$ ln -s ~/.config/nvim-chad/after ~/.config/nvim/after
```

Alternatively, you can use a program for managing your dotfiles, like [dotbot](https://github.com/anishathalye/dotbot) or [chezmoi](https://www.chezmoi.io/)and make those programs link this repo to the NvChad config.
