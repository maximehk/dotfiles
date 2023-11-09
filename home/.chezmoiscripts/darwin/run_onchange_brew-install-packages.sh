#!/bin/bash

brew install \
  btop \
  clang-format \
  curl \
  fzf \
  htop \
  meld \
  poetry \
  pyenv \
  python3 \
  python-certifi \
  rclone \
  tldr \
  tree \
  watch

pip3 install pypdf

poetry config virtualenvs.in-project true