#!/bin/bash

set -eufo pipefail

vim -c PlugInstall
vim -c PlugUpdate -c qa