# Wrappers that run bash dot_bash_functions (install_*, uppies from functions).
# Use when you need the full bash implementation from fish.
# Generated for parity with plan; edit if paths differ.

function uppies_deps --description "Run bash uppies (eget, go-global-update, topgrade)"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; uppies "$@"' bash $argv
end

function install_chezmoi --description "Run bash install_chezmoi"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_chezmoi "$@"' bash $argv
end

function install_eget --description "Run bash install_eget"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_eget "$@"' bash $argv
end

function install_system_packages --description "Run bash install_system_packages"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_system_packages "$@"' bash $argv
end

function install_font --description "Run bash install_font"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_font "$@"' bash $argv
end

function install_eget_binaries --description "Run bash install_eget_binaries"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_eget_binaries "$@"' bash $argv
end

function install_starship --description "Run bash install_starship"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_starship "$@"' bash $argv
end

function install_go_tools --description "Run bash install_go_tools"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_go_tools "$@"' bash $argv
end

function install_rust_tools --description "Run bash install_rust_tools"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_rust_tools "$@"' bash $argv
end

function install_nvchad --description "Run bash install_nvchad"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_nvchad "$@"' bash $argv
end

function install_bash_ls --description "Run bash install_bash_ls"
    bash -c 'source ~/.bash_functions 2>/dev/null || source ~/.bash_profile 2>/dev/null; install_bash_ls "$@"' bash $argv
end
