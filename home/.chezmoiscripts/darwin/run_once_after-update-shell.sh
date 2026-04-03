#!/bin/bash

set -eufo pipefail

FISH=/opt/homebrew/bin/fish

if [ ! -x "$FISH" ]; then
  echo "fish not found at $FISH"
  exit 1
fi

grep -q "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells

if [ "$SHELL" != "$FISH" ]; then
  chsh -s "$FISH" "$USER"
fi
