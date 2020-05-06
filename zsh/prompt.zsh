autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_info() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "%{%F{blue}%}($(git_branch))%f"
    else
      echo "%{%F{red}%}($(git_branch))%f"
    fi
  fi
}

prefix() {
  echo "%{%B%F{green}%}➜%f%b"
}

directory_name() {
  echo "%{%F{cyan}%}%c%f"
}

battery_status() {
  if test ! "$(uname)" = "Darwin"
  then
    exit 0
  fi

  if [[ $(sysctl -n hw.model) == *"Book"* ]]
  then
    $ZSH/bin/battery-status
  fi
}

export PROMPT=$'$(prefix) $(directory_name) $(git_info) '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
