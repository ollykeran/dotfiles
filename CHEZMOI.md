# Chezmoi usage guide

This repo is the **source** `$HOME` is the **target**. 

`chezmoi apply` makes home match the source.

Reference: [chezmoi quick start](https://www.chezmoi.io/quick-start/#start-using-chezmoi-on-your-current-machine).

## Concepts

- **Source**: This repo. Files like `dot_bashrc` and `dot_config/...` are the source state.
- **Target**: Your directory (`~`). `dot_bashrc` becomes `~/.bashrc`, `dot_config/fish/` becomes `~/.config/fish/`, etc.
- **Config**: `install-deps.sh` writes `~/.config/chezmoi/chezmoi.toml` with `sourceDir` set to this repo so `chezmoi` uses it. Commits and pushes are manual (`autoCommit` and `autoPush` are false in `chezmoi.toml`).

Without running install-deps, use from repo root:

```bash
chezmoi --config="$PWD/chezmoi.toml" -S "$PWD" <command>
```

## First-time / new machine

```bash
git clone git@github.com:ollykeran/dotfiles.git ~/git/dotfiles && cd ~/git/dotfiles
./install-deps.sh
chezmoi apply
```

## home => repo

1. Edit `~/.config/somefile`
2. Update repo from home:
  ```bash
   chezmoi re-add ~/.config/somefile
  ```
3. Commit and push

## repo ==> home

1. Edit
  - `chezmoi edit ~/.bashrc`
  or 
  - Edit files under the repo directly
2. See what would change (optional):
  ```bash
   chezmoi diff           # diff of repo vs home
   chezmoi -n -v apply    # dry run, no changes
  ```
3. Apply to home:
  ```bash
   chezmoi apply
  ```
4. Commit and push

## Other machines

Pull the latest, then apply:

```bash
git pull
./install_deps.sh
chezmoi apply
```

## Handy commands

#### fish config aliases `chezmoi` to `cz`


| Command                   | Purpose                                          |
| ------------------------- | ------------------------------------------------ |
| `chezmoi diff`            | Show what would change                           |
| `chezmoi status`          | Show what is different                           |
| `chezmoi edit <target>`   | Open source file for a target (e.g. `~/.bashrc`) |
| `chezmoi re-add <target>` | Copy target from home into repo                  |


