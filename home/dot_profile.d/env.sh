for bindir in "$HOME/.local/bin" "$HOME/bin"
do
  if [ -d "${bindir}" ]; then
    export PATH="${bindir}:$PATH"
  fi
done

export LESS='-S'          

