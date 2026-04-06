function caf -d "Run caffeinate in a dedicated tmux session"
    argparse 't/tmux-session=' 'h/help' 'f/force' -- $argv
    or return

    set -l session_name (set -q _flag_tmux_session; and echo $_flag_tmux_session; or echo "caf")

    if set -q _flag_help
        echo "Usage: caf [options] <target>"
        echo ""
        echo "Targets:"
        echo "  HH:MM   Run until the given time (e.g. 19:00)"
        echo "  Ns      Run for N seconds"
        echo "  Nm      Run for N minutes"
        echo "  Nh      Run for N hours"
        echo "  Nd      Run for N days"
        echo "  status  Show current caffeinate status"
        echo "  stop    Stop the running caffeinate session"
        echo ""
        echo "Options:"
        echo "  -t, --tmux-session NAME  Tmux session name (default: caf)"
        echo "  -f, --force              Restart if already running"
        echo "  -h, --help               Show this help"
        return 0
    end

    if test (count $argv) -ne 1
        echo "caf: expected exactly one argument (try caf --help)"
        return 1
    end

    set -l target $argv[1]

    # --- status subcommand ---
    if test "$target" = status
        if tmux has-session -t $session_name 2>/dev/null
            echo "Session '$session_name' is running:"
            tmux capture-pane -t $session_name -p
        else
            echo "No caffeinate session '$session_name' running."
        end
        return 0
    end

    # --- stop subcommand ---
    if test "$target" = stop
        if tmux has-session -t $session_name 2>/dev/null
            tmux kill-session -t $session_name
            echo "Stopped caffeinate session '$session_name'."
        else
            echo "No caffeinate session '$session_name' running."
        end
        return 0
    end

    # --- check if already running ---
    if tmux has-session -t $session_name 2>/dev/null
        if set -q _flag_force
            tmux kill-session -t $session_name
        else
            echo "Caffeinate session '$session_name' is already running (use -f to restart)."
            return 1
        end
    end

    # --- parse target into seconds ---
    set -l seconds
    set -l display_target

    if string match -qr '^[0-9]+[smhd]$' -- $target
        set -l num (string match -r '^[0-9]+' -- $target)
        set -l unit (string match -r '[smhd]$' -- $target)
        switch $unit
            case s
                set seconds $num
            case m
                set seconds (math "$num * 60")
            case h
                set seconds (math "$num * 3600")
            case d
                set seconds (math "$num * 86400")
        end
        set display_target "duration: $target"
    else if string match -qr '^[0-9]{1,2}:[0-9]{2}$' -- $target
        set -l now (date +%s)
        set -l target_ts (date -j -f "%Y-%m-%d %H:%M:%S" (date +%Y-%m-%d)" $target:00" +%s)
        if test $target_ts -le $now
            set target_ts (math "$target_ts + 86400")
        end
        set seconds (math "$target_ts - $now")
        set display_target "until: $target"
    else
        echo "caf: invalid target '$target' (try caf --help)"
        return 1
    end

    set -l start_time (date "+%Y-%m-%d %H:%M:%S")
    set -l banner "caffeinate started at $start_time | $display_target"

    tmux new-session -d -s $session_name "echo '$banner'; caffeinate -di -t $seconds"
    echo "$banner"
end
