#!/bin/bash

set -eufo pipefail

vim -c PlugInstall +qa
vim -c PlugUpdate -c qa