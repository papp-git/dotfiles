local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.

return {
-- frac
s({trig = "ff", snippetType="autosnippet"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
),

-- pmatrix
s({trig="mat", snippetType="autosnippet"},
fmta(
[[
\begin{pmatrix}
<> \\ <> \\ <>
\end{pmatrix}
]],
{i(1),i(2),i(3)}
),
{condition = in_mathzone}
),
-- punkt
s({trig="pp", snippetType="autosnippet"},
fmta(
[[
<>(<>|<>|<>)
]],
{i(1),i(2),i(3),i(4)}
),
{condition = in_mathzone}
),
-- integral
s({trig="int", snippetType="autosnippet"},
fmta(
    "\\int\\limits_{<>}^{<>} <> dx",
    {i(1),i(2),i(3)}
),
{condition = in_mathzone}
),
}
