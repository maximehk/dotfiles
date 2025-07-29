
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/maximeh/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

fish_config theme choose Dracula

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin

# bind \t accept-autosuggestion
bind \eL 'ls -l\n'
# bind \cL 'ls -l\n'

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

fzf --fish | source
zoxide init --cmd cd fish | source

for f in $HOME/.profile.d/google/*sh
    # Check if 'f' is a regular file before sourcing
    if test -f "$f"
        source "$f"
    end
end


# Core Editor Settings
set -Ux VISUAL code --wait
set -Ux EDITOR $VISUAL # Often good practice to set EDITOR to VISUAL

# Locale settings
set -Ux LANG en_US.UTF-8
set -Ux PAGER less
set -Ux LESS "-R"

# Homebrew Analytics Opt-out
set -Ux HOMEBREW_NO_ANALYTICS 1

# Fish abbreviations
# Abbreviations for GIT
abbr --add g git
abbr --add ga git add
abbr --add gc git commit -m
abbr --add gs git status
abbr --add gl git log --oneline --graph --decorate
abbr --add gp git push
abbr --add gpl git pull
abbr --add gco git checkout

abbr --add cm chezmoi
abbr --add cma chezmoi apply

abbr --add v nvim
abbr --add vi nvim
abbr --add vim nvim