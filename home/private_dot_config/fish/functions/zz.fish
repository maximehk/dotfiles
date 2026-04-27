function zz --description "Fuzzy find and attach to a Zellij session"
    # Get the list of active sessions
    set -l sessions (zellij list-sessions -n -r | grep -v EXITED)
    set -l count (count $sessions)

    if test $count -eq 0
        echo "No active Zellij sessions found."
        return
    end

    if test $count -eq 1
        set -l session_name (string match -r '^\S+' $sessions[1])
        if test -n "$session_name"
            echo "Attaching to the only active session: $session_name"
            zellij attach $session_name
            return
        else
            echo "Failed to parse session name from: $sessions[1]"
            return
        end
    end

    # If more than one, use fzf
    set -l session (printf "%s\n" $sessions | fzf --nth=1)
    if test -n "$session"
        set -l session_name (string match -r '^\S+' $session)
        if test -n "$session_name"
            zellij attach $session_name
        else
            echo "Failed to parse session name from: $session"
        end
    end
end
