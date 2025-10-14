# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Git Aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gk='git checkout'
alias gb='git branch'
alias gps='git push'
alias gpl='git pull'
alias gd='git diff'
alias gj='git checkout $(git branch | fzf)'
alias gdf='git diff $(git diff --name-only | fzf)'

# tmux aliases
alias t='tmux'
alias ta='tmux attach -t $(tmux ls | fzf | cut -d: -f1)'

alias g='./gradlew'

# Docker Aliases
alias d='docker'
alias dc='docker-compose'
alias ds='docker exec -it $(docker ps --format "{{.Names}}" | fzf) /bin/sh'
alias dk='docker stop $(docker ps --format "{{.Names}}" | fzf)'

function qwenbox() { \
	local selected_dir=$(find ~/code -maxdepth 1 -type d -not -path "*/archive" | fzf) && \
	local dir_name=$(basename "$selected_dir") && \
	docker stop "qwenbox-$dir_name" 2>/dev/null || true && \
	docker run --pull=always \
		-d \
		--rm \
		--name "qwenbox-$dir_name" \
		-v "$selected_dir":/app \
		--mount type=volume,source=qwen_config,target=/root/.qwen \
		--mount type=bind,source=$HOME/.claude,target=/root/.claude \
		--mount type=bind,source=$HOME/.claude.json,target=/root/.claude.json \
		--mount type=bind,source=$HOME/.qwenbox_env,target=/root/.qwenbox_env \
		--env-file $HOME/.qwenbox_env \
		ghcr.io/divsmith/qwenbox:latest \
}

alias python='python3.11'

# Add smlnj to PATH
export PATH=/usr/local/smlnj/bin:"$PATH"

# Add homebrew to PATH
export PATH=/usr/local/bin:"$PATH"

# Add subl to PATH
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Setup fzf
source <(fzf --zsh)

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/parker/.lmstudio/bin"
# End of LM Studio CLI section


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/parker/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

. "$HOME/.local/bin/env"

# zoxide config
eval "$(zoxide init --cmd cd zsh)"

function timeout() { perl -e 'alarm shift; exec @ARGV' "$@"; }

