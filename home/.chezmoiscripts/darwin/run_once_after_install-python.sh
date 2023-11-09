#!/bin/bash

brew install \
  poetry \
  pyenv \
  python3 \
  python-certifi \
  pipx

pip3 install pypdf
poetry config virtualenvs.in-project true