# Chezmoi usage guide

This repo is the **source** `$HOME` is the **target**.

`chezmoi apply` makes home match the source.

Reference: [chezmoi quick start](https://www.chezmoi.io/quick-start/#start-using-chezmoi-on-your-current-machine).

## Concepts

- **Source**: This repo. Files like `dot_bashrc` and `dot_config/...` are the source state.
- **Target**: Your directory (`~`). `dot_bashrc` becomes `~/.bashrc`, `dot_config/fish/` becomes `~/.config/fish/`, etc.
- **Config**: `install-deps.sh` writes `~/.config/chezmoi/chezmoi.toml` with `sourceDir` set to this repo so `chezmoi` uses it. Commits and pushes are manual (`autoCommit` and `autoPush` are false in `chezmoi.toml`).
- **`.chezmoiignore`**: Templated; on non-Linux hosts `~/.config/systemd/**` is not managed (no systemd on macOS).

Without running install-deps, use from repo root:

```bash
chezmoi --config="$PWD/chezmoi.toml" -S "$PWD" <command>
```

## First-time / new machine

### macOS

Install [Xcode Command Line Tools](https://developer.apple.com/download/all/) and [Homebrew](https://brew.sh/), then:

```bash
git clone <your-remote> ~/.local/share/chezmoi && cd ~/.local/share/chezmoi
./install-deps.sh
chezmoi apply
```

On macOS, `install-deps.sh` runs `brew bundle install` and then `brew bundle cleanup --force` so only entries in the repo [`Brewfile`](Brewfile) stay installed. To add a tool long term, add it to the Brewfile and commit.

**After you edit the Brewfile**, sync Homebrew without the rest of install-deps:

```bash
./install-deps.sh sync-brew
# or: ./scripts/sync-homebrew.sh
```

**`chezmoi apply`** runs `run_once_install-dependencies.sh` only until it succeeds once; it leaves a marker at `~/.local/state/chezmoi-dotfiles/install-deps-once.complete`. Later applies skip that step. To force the full bootstrap hook again, remove that file.

Set your login shell to fish in System Settings (or `chsh -s "$(command -v fish)"`).

### Linux

```bash
git clone <your-remote> ~/.local/share/chezmoi && cd ~/.local/share/chezmoi
./install-deps.sh
chezmoi apply
```

## `REPO_ROOT`

`dot_bash_profile` sets `REPO_ROOT` to `$HOME/.local/share/chezmoi` so `uppies` and installers resolve package lists in this tree. To use a different clone path, change `export REPO_ROOT=...` in `dot_bash_profile` and run `python3 scripts/bash2fish.py` to refresh `~/.config/fish/conf.d/env.fish`.

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
./install-deps.sh
chezmoi apply
```

## Fish from bash exports

After changing `dot_bash_profile` or `dot_bash_alias`, regenerate fish:

```bash
python3 scripts/bash2fish.py
```

## Handy commands

#### fish config aliases `chezmoi` to `cz`


| Command                   | Purpose                                          |
| ------------------------- | ------------------------------------------------ |
| `chezmoi diff`            | Show what would change                           |
| `chezmoi status`          | Show what is different                           |
| `chezmoi edit <target>`   | Open source file for a target (e.g. `~/.bashrc`) |
| `chezmoi re-add <target>` | Copy target from home into repo                  |

