# Linux: custom OpenSSH agent socket under XDG_RUNTIME_DIR (see dot_bash_profile).
if test (uname -s) = Linux
    set -q XDG_RUNTIME_DIR
    and test -S "$XDG_RUNTIME_DIR/openssh_agent"
    and set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/openssh_agent"
end
