# Core Editor Settings
set -gx EDITOR nvim
set -gx VISUAL nvim

# Locale settings
set -gx LANG en_US.UTF-8
set -gx PAGER less
set -gx LESS "-R --quit-if-one-screen"

# Homebrew Analytics Opt-out
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_AUTO_UPDATE_SECS 86400

# Secrets from ~/.env (not tracked by dotfiles)
if test -f ~/.env
    for line in (string match -rv '^\s*#|^\s*$' < ~/.env)
        set -l kv (string split -m1 '=' -- $line)
        if test (count $kv) -eq 2
            set -gx $kv[1] $kv[2]
        end
    end
end
