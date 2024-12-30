#!/bin/bash

set -eufo pipefail

# source:
# https://github.com/twpayne/dotfiles/blob/master/home/.chezmoiscripts/darwin/run_onchange_before_install-packages.sh.tmpl

{{ $brews := list
     "bat"
     "btop"
     "curl"
     "dockutil"
     "ffmpeg"
     "fzf"
     "gdu"
     "gh"
     "git"
     "git-lfs"
     "jless"
     "jq"
     "pkg-config"
     "rclone"
     "ripgrep"
     "tldr"
     "tmux"
     "tree"
     "watch"
     "wget" -}}
{{ $casks := list
     "1password-cli"
    #  "balenaetcher"
     "google-chrome"
    #  "hammerspoon"
    #  "karabiner-elements"
    #  "signal"
    #  "spotify"
    #  "tailscale"
     "telegram"
    #  "vagrant"
     "visual-studio-code"
     "vlc"
     "wezterm"
     "whatsapp" -}}

brew bundle --no-lock --file=/dev/stdin <<EOF
{{ range ($brews | sortAlpha | uniq) -}}
brew "{{ . }}"
{{ end -}}
{{ range ($casks | sortAlpha | uniq) -}}
cask "{{ . }}"
{{ end -}}
EOF