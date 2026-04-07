# macOS overrides (load after alias.fish). Erase Linux-only abbrs so expansion is correct.
if test (uname -s) = Darwin
    abbr -e ports 2>/dev/null
    abbr -a ports 'lsof -nP -iTCP -sTCP:LISTEN'
    abbr -e ps 2>/dev/null
    abbr -a ps 'ps auxww'
    abbr -e pgrep 2>/dev/null
    abbr -a pgrep 'pgrep -lf'
    abbr -e podman 2>/dev/null
    abbr -e updatedb 2>/dev/null
    abbr -e updatewindb 2>/dev/null
    abbr -e locate 2>/dev/null
end
