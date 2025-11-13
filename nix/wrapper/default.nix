{
  pkgs,
  callPackage,
  ...
}:
(callPackage ./module.nix { }).apply {
  inherit pkgs;

  packages = with pkgs; {
    essential = [
      fishMinimal
      fswatch # File watcher utility, replacing libuv.fs_event for neovim 10.0
      fzf
      git
      lazygit
      tree-sitter
      zellij
    ];

    # may be needed to compile some plugins
    # TODO: use `vimPlugins`, instead
    c = [
      cmake
      gcc
      gnumake
    ];

    lua = [
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

    actions = [
      pinact
      yaml-language-server
      zizmor
    ];

    web = [
      nodePackages.typescript-language-server
      nodejs
      prettierd # multi-language formatters
      vscode-langservers-extracted
      yarn
    ];
  };
}
