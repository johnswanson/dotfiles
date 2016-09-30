PROMPT='[%{$fg[green]%}%n%{$reset_color%}@%{$fg[red]%}%m%{$reset_color%}] λ  '
RPROMPT='%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
