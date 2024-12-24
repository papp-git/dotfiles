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
s({trig="pma", snippetType="autosnippet"},
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


s({trig="bax", snippetType="autosnippet"},
fmta(
[[
\begin{figure}[!h]
    \centering
    % ------------Wahrscheinlichkeiten---------------------------------
    \def \wl{\(<>\)}
    \def \wr{\(<>\)}
    % ------------Beschriftung
    \def \bl{<>}
    \def \br{<>}
    \begin{tikzpicture}
	[
	    level distance = 30mm,
	    every node/.style ={circle, draw, minimum size = 15mm},
	    level 1/.style={sibling distance=80mm},
	    level 2/.style={sibling distance=40mm},
	    % --------------- Farben -------------------------------------
	    rot/.style={fill = OrangeRed!50},
	    gruen/.style={fill = LimeGreen}
    ]
    \coordinate    % Wurzel
	% --------------- links ------------------------
	child {node[rot] (E) {\bl}
	    child {node[rot] (A) {\bl} 
	    edge from parent node [draw=none, left] {\wl}}
	    child {node[gruen] (B) {\br} 
	    edge from parent node[draw=none, right] {\wr}}
	edge from parent node (W) [draw=none,left] {\wl}
	}
	% ----------------rechts ------------------------
	child {node[gruen] (F) {\br}
	    child {node[rot] (C) {\bl} 
	    edge from parent node[draw=none, left]{\wl}} 
	    child {node[gruen] (D) {\br} 
	    edge from parent node[draw=none, right]{\wr}}
	edge from parent node (W3)[draw=none, right] {\wr}
	};
    % --------------------Ergebnisse -----------------------------
    \begin{scope}[
	nodes = 
	{rectangle, draw,minimum height = 1cm,minimum width=2cm, dashed, below = 30pt}
	]
	\node[] (G) at (A) {};
	\node at (B) {};
	\node at (C) {};
	\node at (D) {};
    \end{scope}
    % --------------------Wahrscheinlichkeiten ---------------------------
    \begin{scope}[
	nodes = 
	{rectangle, draw,minimum height = 2cm,minimum width=2cm, dashed, below = 70pt}
	]
	\node (H) at (A) {};
	\node at (B) {};
	\node at (C) {};
	\node at (D) {};
    \end{scope}
    \draw[dotted] (E.west) --++ (-3,0) node[draw= none, left]{1. Zug};
    \draw[dotted] (A.west) --++ (-1,0) node[draw= none, left]{2. Zug};
    \path (G.west) --++(-1.1,0) node[draw= none, left] {Ergebnis};
    \path (H.west) --++ (-1.1,0) node[draw=none, left]{W'keit};
\end{tikzpicture}
\end{figure}
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
