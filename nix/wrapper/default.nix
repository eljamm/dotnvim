{
  pkgs,
  callPackage,
  ...
}:
(callPackage ./module.nix { }).apply {
  inherit pkgs;

  packages = with pkgs; {
    tools = [
      fswatch # File watcher utility, replacing libuv.fs_event for neovim 10.0
      fzf
      git
      sqlite
      tree-sitter
    ];

    c = [
      cmake
      gcc
      gnumake
    ];

    gamedev = [
      # parser, linter and formatter for GDScript
      gdtoolkit_4
    ];

    luaTools = [
      lua-language-server
      lua51Packages.lua
      lua51Packages.luarocks-nix
      stylua
    ];

    markup = [
      cbfmt # format codeblocks
      codespell
      nodePackages.cspell
      markdownlint-cli
    ];

    nix = [
      deadnix
      manix
      nixd
      nixfmt-rfc-style
      nixpkgs-lint-community
      statix
    ];

    python = [
      basedpyright
      black
      isort
      ruff
    ];

    rust = [
      bacon # background code check
      taplo # TOML
    ];

    shell = [
      nodePackages.bash-language-server
      shellcheck
      shfmt
    ];

    config = [
      yaml-language-server
    ];

    web = [
      deno
      nodePackages.sql-formatter
      nodePackages.typescript-language-server
      nodejs
      prettierd # multi-language formatters
      vscode-langservers-extracted
      yarn
    ];
  };
}
