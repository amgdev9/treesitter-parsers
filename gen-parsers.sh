for dir in */; do
    if [[ -d "$dir" ]]; then
        echo "Generating parser in $dir"
        (cd "$dir" && tree-sitter generate)

        mv "$dir/src/parser.c" "$dir/parser.c"
        rm -rf "$dir/tree_sitter"
        mv "$dir/src/tree_sitter" "$dir/tree_sitter"
        rm -rf "$dir/src"
    fi
done
