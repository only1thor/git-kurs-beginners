watch --no-title --interval 2 -c 'printf "\e[1;33mUntracked Files:\e[0m\n"
git ls-files --others --exclude-standard | while read -r file; do
    printf "\e[33m  %s\e[0m\n" "$file"
done

printf "\n\e[1;36mModified Files:\e[0m\n"
git diff --name-only | while read -r file; do
    printf "\e[36m\n  %s\e[0m\n" "$file"
    git diff --color=always -- "$file" | tail -n +6
done

printf "\n\e[1;35mStaged Files:\e[0m\n"
git diff --staged --name-only | while read -r file; do
    printf "\e[35m\n  %s\e[0m\n" "$file"
    git diff --staged --color=always "$file" | tail -n +6
done

printf "\n\e[1;34mCommit History:\e[0m\n"
git log --graph --oneline --all --decorate --color=always'
