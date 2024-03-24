-- expanding a snippet on a new line only.
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
-- beg end 
s({trig="beg", snippetType="autosnippet", dscr="A generic new environmennt"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),
    }
  ),
  {condition = line_begin}
),
-- minipage 
s({trig = "mip", snippetType="autosnippet", dscr="minipage"},
 fmta(
    [[
	\begin{minipage}{8cm}
	<>
	\end{minipage}
	\hfill
	\begin{minipage}{8cm}\raggedleft
	<>
	\end{minipage}
	<>
    ]],
    {
	i(1),
	i(2),
	i(3)
    }
    ),
    {condition = line_begin}
),
-- Grundgerüst
s({trig = "docs", snippetType="autosnippet"},
fmta(
[[
    \documentclass[filesize=12pt, parskip=half-]{scrartcl}
    \input{preample.tex}
    \fancyhead[L]{<>} \fancyhead[C]{\textbf{<>}} \fancyhead[R]{<>}
    \fancyfoot{}
    \pagestyle{fancy}
    \begin{document}
    <>
    \end{document}
]],
    {
	i(1),
	i(2),
	i(3),
	i(4)
    }
),
{condition = line_begin}
),
}
