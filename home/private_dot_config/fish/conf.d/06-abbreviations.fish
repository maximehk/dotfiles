if status is-interactive
    # Git
    abbr --add ga  git add -A
    abbr --add gc  git commit -m
    abbr --add gs  git status
    abbr --add gl  git log --oneline --graph --decorate
    abbr --add gP  git push
    abbr --add gp  git pull
    abbr --add gb  git branch

    abbr --add lg  lazygit


    # ChezMoi
    abbr --add cm   chezmoi
    abbr --add cma  chezmoi apply
    abbr --add cmu  chezmoi update -a
    abbr --add cme  chezmoi edit -a

    # Docker
    abbr --add dc   docker compose
    abbr --add dcup docker compose up -d
    abbr --add dps  'dops --filter "label=com.docker.compose.project=$(basename $PWD)"'

    # Editors
    abbr --add v   nvim
    abbr --add vim nvim

    # Misc
    abbr --add tmx 'tmux new-session -A -t'
    abbr --add j   just
    abbr --add rl  readlink -f

    # Zellij stuff
    abbr --add z zellij
    abbr --add za zellij attach
    abbr --add zc zellij attach --create
    abbr --add zl zellij list-sessions
    abbr --add zr zellij run --
end
