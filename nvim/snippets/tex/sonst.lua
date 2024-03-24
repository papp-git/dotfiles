
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return{
-- Karos
s({trig="kk", snippetType="autosnippet"},
fmta(
    "\\kariert{<>}{<>}",
    {i(1), i(2)}
)
),
-- Einheiten
s({trig="qty", snippetType="autosnippet"},
fmta(
    "\\qty{<>}{<>}",
    {i(1),i(2)}
)
),
-- graphics
s({trig="inc", snippetType="autosnippet"},
fmta(
    "\\includegraphics[width=<>\\textwidth]{<>}",
    {i(1),i(2)}
),
{condition = line_begin}
),
-- standalone
s({trig="isc", snippetType="autosnippet"},
fmta(
    "\\includestandalone[width=<>\\textwidth]{<>}",
    {i(1),i(2)}
),
{condition = line_begin}
),
-- fancy
s({trig="fanc", snippetType="autosnippet"},
    fmta(
    [[
	\fancyhead[L]{<>} \fancyhead[C]{\textbf{<>}} \fancyhead[R]{<>}
	\fancyfoot{}
	\pagestyle{fancy}
    ]],
    {i(1),i(2),i(3)}
    ),
    {condition=line_begin}
),

}
