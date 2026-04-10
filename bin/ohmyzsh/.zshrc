# =============================================================================
# ZSH Configuration
# =============================================================================

# -----------------------------------------------------------------------------
# Oh My Zsh Configuration
# -----------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jvbriones"

# Load zsh-syntax-highlighting (before oh-my-zsh)
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# SSH Agent
# -----------------------------------------------------------------------------

# Reuse shared ssh-agent if present
if [[ -f "$HOME/.ssh/agent.env" ]]; then
  source "$HOME/.ssh/agent.env" >/dev/null 2>&1
fi

# -----------------------------------------------------------------------------
# PATH Configuration
# -----------------------------------------------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# -----------------------------------------------------------------------------
# Android / Java Configuration
# -----------------------------------------------------------------------------
# export ANDROID_SDK_ROOT=""
# export JAVA_HOME=""


# -----------------------------------------------------------------------------
# GPG Configuration
# -----------------------------------------------------------------------------
export GPG_TTY=$(tty)

# -----------------------------------------------------------------------------
# Docker Aliases
# -----------------------------------------------------------------------------
alias dc="docker compose"
alias dc-d="docker compose down --remove-orphans --volumes"
alias dc-u="docker compose up --wait -d"
alias dc-fresh="docker compose pull && docker compose up --build --force-recreate --no-deps --wait -d"

# -----------------------------------------------------------------------------
# NVM (Node Version Manager) - Lazy Loading
# -----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
_NVM_LOADED=false

# Load nvm and run nvm use (only runs once per shell)
_load_nvm() {
  if [ "$_NVM_LOADED" = false ]; then
    unset -f nvm node npm npx yarn pnpm 2>/dev/null
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm use
    _NVM_LOADED=true
  fi
}

# Lazy load wrappers - nvm loads + nvm use on first use
nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }
yarn() { _load_nvm; yarn "$@"; }
pnpm() { _load_nvm; pnpm "$@"; }

# -----------------------------------------------------------------------------
# SDKMAN (THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!)
# -----------------------------------------------------------------------------
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
