require('luasnip.session.snippet_collection').clear_snippets 'rust'

local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('rust', {
  s('derivedebug', t '#[derive(Debug)]'),
  s('deadcode', t '#[allow(dead_code)]'),
  s('allowfreedom', t '#![allow(clippy::disallowed_names, unused_variables, dead_code)]'),
  s('clippypedantic', t '#![warn(clippy::all, clippy::pedantic)]'),
  s(':turbofish', { t { '::<' }, i(0), t { '>' } }),

  s('pr', fmt('println!("<> {<>:?}");<>', { i(1), i(2), i(0) }, { delimiters = '<>' })),

  s(
    'for',
    fmt(
      [[
      for <> in <> {
          <>
      }<>
      ]],
      { i(1, 'i'), i(2, 'iterator'), i(3), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'if',
    fmt(
      [[
      if <cond> {
          <>
      }<>
      ]],
      { cond = i(1, 'condition'), i(2), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'st',
    fmt(
      [[
      #[derive(Debug)]
      struct <> {
          <>
      }<>
      ]],
      { i(1, 'Name'), i(2), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'tt',
    fmt(
      [[
      #[test]
      fn <name>() {
          assert<>
      }<>
      ]],
      { name = i(1, 'test_case'), i(2), i(0) },
      { delimiters = '<>' }
    )
  ),

  s(
    'tc',
    fmt(
      [[
      #[cfg(test)]
      mod <> {
          #[test]
          fn <>() {
              assert<>
          }<>
      }<>
      ]],
      { i(1, 'tests'), i(2, 'test_case'), i(3), i(4), i(0) },
      { delimiters = '<>' }
    )
  ),
})
