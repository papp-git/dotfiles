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

