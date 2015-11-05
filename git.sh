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

is_there_any_change(){
    changes="$(git status -sb 2> /dev/null | wc -l)"
    if [  "$changes" = "1" ]; then
        echo "false"
    else
        echo "true"
    fi
}

need_to_push(){
    local BPurple='\e[1;35m'
    local Color_Off='\e[0m'
    if [ -n "$(/usr/bin/git cherry -v @{upstream} 2>/dev/null)" ]; then
        echo -e "[$BPurple unpushed $Color_Off]"
    fi
}

git_prompt(){
    local BGreen='\e[1;32m'
    local BYellow='\e[1;33m'
    local Color_Off='\e[0m'
    if [ "$(is_a_git_repo)" = "true" ]; then
        if [ "$(is_there_any_change)" = "true" ]; then
            echo -e " [$BYellow $(git_branch) $Color_Off] $(need_to_push) "
        else
            echo -e " [$BGreen $(git_branch) $Color_Off] $(need_to_push) "
        fi
    fi
}
