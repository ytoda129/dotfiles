# search match color
set fish_color_search_match --background=blue

# dbus error
set -x NO_AT_BRIDGE 1

# editor
set -x EDITOR vim

# direnv
if type direnv >/dev/null 2>&1
    eval (direnv hook fish)
end

# colordiff alias
if type colordiff >/dev/null 2>&1
    alias diff "colordiff -u"
else
    alias diff "diff -u"
end

# less
set -x LESS -iMR

# tmux
if type tmux >/dev/null 2>&1 && test $SHLVL = 1
    if test -z $TMUX
        if tmux has-session >/dev/null 2>&1
            tmux attach
        else
            tmux
        end
    end
end

# gtkwave
if test (uname) = "Darwin"
    alias gtkwave "open -a gtkwave"
end

# rbenv
if type rbenv >/dev/null 2>&1
    status --is-interactive; and source (rbenv init -|psub)
end

# anyenv
if type anyenv >/dev/null 2>&1
    status --is-interactive; and source (anyenv init -|psub)
end
