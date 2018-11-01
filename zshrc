export FZF_DEFAULT_COMMAND='fd --type f --exclude .git --exclude node_modules --exclude tmp --exclude log --exclude bin'

alias g=git

function o {
  A="$(fzf)"
  
  if [ "$A" != "" ] 
  then
    vim $A;
  fi
}

function note {
  vim $(date +%Y-%m-%d).md
}
