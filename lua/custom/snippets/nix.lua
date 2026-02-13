-- require('luasnip.session.snippet_collection').clear_snippets 'nix'

local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Nix --
ls.add_snippets('nix', {
  s(
    'l',
    fmt(
      [[
      let
        <>
      in
      <>
      ]],
      { i(1), i(0) },
      { delimiters = '<>' }
    )
  ),

  -- attribute Set
  s(
    'at',
    fmt(
      [[
      <name> = <>{
        <value>
      }<>;<>
      ]],
      { name = i(1, 'name'), i(2), value = i(3, 'value'), i(4), i(0) },
      { delimiters = '<>' }
    )
  ),

  -- nixos module
  s(
    'mod',
    fmt(
      [[
      { <inputs> ... }:
      {
        flake.nixosModules = <>{
          <name> =
            { config, pkgs, lib, ... }:
            <let>{
              <>
            };<>
        };<>
      }
      ]],
      { inputs = i(1, 'inputs,'), i(2), name = i(3, 'name'), let = i(4), i(5), i(6), i(0) },
      { delimiters = '<>' }
    )
  ),

  -- empty module
  s(
    'em',
    fmt(
      [[
      { <inputs> ... }:
      <let>{
        <>
      }
      ]],
      { inputs = i(1, 'pkgs, lib,'), let = i(2), i(0) },
      { delimiters = '<>' }
    )
  ),

  -- lib.mkOption
  s(
    'opt',
    fmt(
      [[
      <name> = mkOption {
        type = types.<>str;
        default = "<>";
        defaultText = "<>";
        description = "<>";
      };
      ]],
      { name = i(1), i(2), i(3), i(4), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'opt-sub',
    fmt(
      [[
      <name> = mkOption {
        type = <>types.submodule { options = { <> }; };
        default = { <> };
        description = "<>";
      };
      ]],
      { name = i(1), i(2), i(3), i(4), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    '__toString',
    fmt(
      [[
      __toString = mkOption {
        type = with types; functionTo str;
        default = self: ''<>'';
      };<>
      ]],
      { i(1), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'ov',
    fmt(
      [[
      (final: prev: {
        <name> = prev.<name>.overrideAttrs (oldAttrs: {
          <>
        });
      })
      ]],
      { name = i(1), i(0) },
      { delimiters = '<>', repeat_duplicates = true }
    )
  ),

  s(
    'phase',
    fmt(
      [[
      <name> = ''
        <>
      '';<>
      ]],
      { name = i(1), i(2), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'pack',
    fmt(
      [[
      packages = with pkgs<>; [
        <>
      ];<>
      ]],
      { i(1), i(2), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'update',
    fmt(
      [[
      passthru.updateScript = nix-update-script { <> };
      ]],
      { i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'branchArgs',
    fmt(
      [[
      extraArgs = [ "--version=branch"<> ];
      ]],
      { i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'team',
    fmt(
      [[
      teams = with lib.teams; [ <> ];
      ]],
      { i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'ssh',
    fmt(
      [[
      interactive.sshBackdoor.enable = <>true;
      ]],
      { i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'sub',
    fmt(
      [[
      subgrants = {
        Commons = [ ];
        Core = [ ];
        Entrust = [ ];
        Review = [ ];<>
      };
      ]],
      { i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'subst',
    fmt(
      [[
      substituteInPlace <> \
        --replace-fail "<>" "<>"<>
      ]],
      { i(1), i(2), i(3), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'shell',
    fmt(
      [[
      shells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          <>
        ];
        shellHook = ''
          export PROJECT_ROOT="$(git rev-parse --show-toplevel)"
          <>
        '';
      };<>
      ]],
      { i(1), i(2), i(0) },
      { delimiters = '<>' }
    )
  ),
})

-- Python --
ls.add_snippets('nix', {
  s(
    'pyrelax',
    fmt(
      [[
      pythonRelaxDeps = [
        "<>"
      ];<>
      ]],
      { i(1), i(0) },
      { delimiters = '<>' }
    )
  ),
})
