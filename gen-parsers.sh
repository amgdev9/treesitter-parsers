for dir in */; do
    if [[ -d "$dir" ]]; then
        echo "Generating parser in $dir"
        (cd "$dir" && tree-sitter generate)

        if [[ -f "$dir/src/parser.c" ]]; then
            mv "$dir/src/parser.c" "$dir/"
            rm -r "$dir/src"
        fi
    fi
done
