complete -c caf -f
complete -c caf -a "status" -d "Show current caffeinate status"
complete -c caf -a "stop" -d "Stop the running caffeinate session"
complete -c caf -s t -l tmux-session -r -d "Tmux session name (default: caf)"
complete -c caf -s f -l force -d "Restart if already running"
complete -c caf -s h -l help -d "Show help"
