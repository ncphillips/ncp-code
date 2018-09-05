export FZF_DEFAULT_COMMAND='fd --type f --exclude .git --exclude node_modules --exclude tmp --exclude log --exclude bin'

function o {
	vim $(fzf)
}
