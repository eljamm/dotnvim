require('luasnip.session.snippet_collection').clear_snippets 'nix'

local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('nix', {
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
})
