source venv/bin/activate

run() {
    if [ $# -eq 0 ]; then
        for file in *; do
            if [[ -f "$file" && $(head -n 1 "$file") == "#"* ]]; then
                echo "$file"
            fi
        done
    else
        if [[ -f "$1" && $(head -n 1 "$1") == "#"* ]]; then
            command=$(head -n 1 "$1" | sed 's/^#\s*//; s/\s*$//')
            echo "$command"
            eval $command
        else
            echo "Error: '$1' is not a file or does not start with '#'."
        fi
    fi
}