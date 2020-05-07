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
  branch=$($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
  echo "%{$fg[red]%}${branch}"
}

git_dirty_info() {
  if [[ $($git status --porcelain) == "" ]]
  then
    echo ""
  else
    echo " %{$fg[yellow]%}✗"
  fi
}

git_info() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    echo "%{$fg[blue]%}git:($(git_branch)%{$fg[blue]%})$(git_dirty_info) "
  fi
}

prefix() {
  echo "%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
}

directory_name() {
  echo "%{$fg[cyan]%}%c "
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

export PROMPT=$'$(prefix)$(directory_name)$(git_info)'
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
