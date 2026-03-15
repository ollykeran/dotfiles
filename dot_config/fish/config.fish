if status is-interactive
    # Commands to run in interactive sessions can go here
  zoxide init fish | source
  sshush completion fish | source
  gh completion --shell fish | source
  eval (sshush start)
end

# Paths from dot_bash_profile are in conf.d/dotfiles.env.fish (fish_add_path)
# Keep one explicit so opencode is on PATH if env not loaded

fish_config theme choose catppuccin-mocha

if status is-interactive
  fastfetch 2>/dev/null
end
