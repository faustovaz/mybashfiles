# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh
git_branch() {
  echo $(/usr/bin/git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

is_a_git_repo(){
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = "true" ]; then
        echo "true"
    else
        echo "false"
    fi
}
