export FZF_DEFAULT_COMMAND='fd --type f --exclude .git --exclude node_modules --exclude tmp --exclude log --exclude bin'

alias cl=clear

alias g=git

function o {
  filename="$(fzf)"
  
  if [ "$filename" != "" ] 
  then
    vim $filename;
  fi
}

function f {
  filename=$(
    ag \
      --nogroup \
      --column \
      --skip-vcs-ignores \
      --nonumbers . | \
      fzf -0 -1| \
      awk -F: '{print $1}'
  )

  if [ "$filename" != "" ] 
  then
    vim $filename;
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
