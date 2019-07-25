export FZF_DEFAULT_COMMAND='fd --type f --exclude .git --exclude node_modules --exclude tmp --exclude log --exclude bin'

alias cl=clear

alias g=git
alias p3=python3

function o {
  A="$(fzf)"
  
  if [ "$A" != "" ] 
  then
    vim $A;
  fi
}

function note {
  startingDir=$(pwd)
  cd ~/notes
  currentDate="$(date +%Y-%m-%d)"
  currentFile="$currentDate.md"
  vim $currentFile 
  git add $currentFile 
  git commit -m "Updated notes for $currentDate" 
  git push
  cd $startingDir
}
