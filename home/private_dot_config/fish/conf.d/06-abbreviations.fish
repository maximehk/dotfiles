if status is-interactive
    # Git
    abbr --add g   git
    abbr --add ga  git add
    abbr --add gc  git commit -m
    abbr --add gs  git status
    abbr --add gl  git log --oneline --graph --decorate
    abbr --add gp  git push
    abbr --add gpl git pull
    abbr --add gco git checkout

    # ChezMoi
    abbr --add cm   chezmoi
    abbr --add cma  chezmoi apply
    abbr --add cmu  chezmoi update -a
    abbr --add cme  chezmoi edit -a

    # Docker
    abbr --add dc   docker compose
    abbr --add dcup docker compose up -d

    # Editors
    abbr --add v   vim
    abbr --add vim nvim

    # Misc
    abbr --add tmx 'tmux new-session -A -t'
    abbr --add j   just
    abbr --add rl  readlink -f
end
