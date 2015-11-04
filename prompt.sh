prompt(){
    if [ "$(is_a_git_repo)" = "true" ]; then
        echo " [ $(git_branch) ] "
    fi
}
PS1="$PS1\$(prompt)"
