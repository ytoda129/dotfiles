# dbus error
set -x NO_AT_BRIDGE 1

# editor
set -x EDITOR vim

# direnv
if test (which direnv)
  eval (direnv hook fish)
end

# colordiff alias
if test (which colordiff)
  alias diff "colordiff -u"
else
  alias diff "diff -u"
end
