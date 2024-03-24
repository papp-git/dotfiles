local line_begin = require("luasnip.extras.expand_conditions").line_begin
-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.

return{
-- mathe umgebung
s({trig="mm", snippetType="autosnippet"},
fmta(
    [[
	\[
	<>
	\]
    ]],
    {i(1)}
),
{condition= line_begin}
),
-- große runde Klammer
s({trig="kr", snippetType="autosnippet"},
fmta(
    "\\left(<>\\right)",
    {i(1)}
),
{condition = in_mathzone}
),
-- große eckige Klammer
s({trig="ke", snippetType="autosnippet"},
fmta(
    "\\left[<>\\right]",
    {i(1)}
),
{condition = in_mathzone}
),
-- mathe inline
s({trig="mk", regTrig = true, wordTrig = false, snippetType="autosnippet"},
fmta(
    "\\(<>\\)",
    {i(1)}
)
),
}
