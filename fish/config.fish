set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# fish_greeting
function fish_greeting
    echo Zeit: (set_color yellow; date +%T; set_color blue)  $hostname
end

# theme_gruvbox dark

# aliases
alias ticker="ticker --config ~/ticker.yaml"

###########################################################
####          yazi                                     ####
###########################################################

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

