# Commands that are launched from WSL scripts: fix CRLF if present, then run with . when no args.
# Add/remove names as needed.
set -g __crlf_launch_commands code cursor

function __crlf_launch
    set -l cmd $argv[1]
    set -l path (command which $cmd 2>/dev/null)
    if test -z "$path"
        if test (count $argv) -gt 1
            command $cmd $argv[2..-1]
        else
            command $cmd .
        end
        return $status
    end
    if string match -q '*CRLF*' (file -b "$path" 2>/dev/null)
        if type -q dos2unix
            dos2unix "$path" 2>/dev/null
        else
            sed -i 's/\r$//' "$path" 2>/dev/null
        end
    end
    if test (count $argv) -gt 1
        $path $argv[2..-1]
    else
        $path .
    end
end

# Bake command name into each wrapper (loop $cmd is not in scope when wrapper runs)
for cmd in $__crlf_launch_commands
    eval "function $cmd; __crlf_launch $cmd \$argv; end"
end
