for bindir in "$HOME/.local/bin" "$HOME/bin"
do
  if [ -d "${bindir}" ]; then
    export PATH="${bindir}:$PATH"
  fi
done


export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export LESS='-S'          
export EDITOR='vim'
