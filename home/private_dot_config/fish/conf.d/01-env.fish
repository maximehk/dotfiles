# Core Editor Settings
set -Ux EDITOR nvim
set -Ux VISUAL nvim

function fish_upgrade_editor
  set -Ux VISUAL code --wait
end

# Locale settings
set -Ux LANG en_US.UTF-8
set -Ux PAGER less
set -Ux LESS "-R --quit-if-one-screen"

# Homebrew Analytics Opt-out
set -Ux HOMEBREW_NO_ANALYTICS 1
set -Ux HOMEBREW_AUTO_UPDATE_SECS 86400
