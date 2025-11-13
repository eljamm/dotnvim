{
  lib,
  wlib,
  self,
  ...
}:
let
  inherit (lib)
    mkOption
    types
    ;
in
wlib.wrapModule (
  { config, wlib, ... }:
  {
    options = {
      packages = mkOption {
        # TODO: improve?
        type = with types; attrsOf (listOf package);
        default = { };
        example = lib.literalExpression ''
          {
            tools = with pkgs; [
              fswatch # File watcher utility
              fzf
              git
              tree-sitter
            ];
            luaTools = with pkgs; [
              lua-language-server
              stylua
            ];
          }
        '';
        description = "Extra packages for NeoVim.";
      };
      nvim = lib.mkOption {
        type = wlib.types.file config.pkgs;
        default.path = "\${XDG_CONFIG_HOME:-$HOME/.config}/nvim";
        description = "Path to NeoVim configuration.";
      };
    };
    config = {
      package = lib.mkDefault config.pkgs.neovim;
      extraPackages = with lib; flatten (attrValues config.packages);
      args = [
        "-u"
        "${config.nvim.path}/init.lua"
      ];
      # TODO: filter
      nvim.path = "${self}";
    };
  }
)
