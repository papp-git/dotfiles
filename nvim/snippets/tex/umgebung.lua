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

-- Koordinatengitter 
s({trig="gtt", snippetType="autosnippet", dscr="Koordinatengitter"},
  fmta(
    [[
	\begin{tikzpicture}
		\draw[achse](<>,0)--(<>,0)node[above]{\(x\)};
		\draw[achse](0,<>)--(0,<>)node[right]{\(y\)};
		\draw[koor](<>,<>)grid(<>,<>);
		
		\node[below left] at (0,0){0};

		\foreach \x in {<>}
			\draw(\x,0.1)--++(0,-0.2)node[below]{\x};
		\foreach \y in {<>}
			\draw(0.1,\y)--++(-0.2,0)node[left]{\y};
		
		<>

	\end{tikzpicture}
    ]],
    {
      i(1),
      i(2),
      i(3),
      i(4),
      rep(1),
      rep(3),
      rep(2),
      rep(4),
      i(5),
      i(6),
      i(7),
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
	\hspace{0.5cm}
	\begin{minipage}{8cm}
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
    \documentclass[fontsize=12pt, parskip=half-]{scrartcl}
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

-- figure 
s({trig = "bef", snippetType="autosnippet", dscr="figure"},
 fmta(
    [[
	\begin{figure}[!h]
	\centering
	<>
	\end{figure}
    ]],
    {
	i(1)
    }
    ),
    {condition = line_begin}
),
}
