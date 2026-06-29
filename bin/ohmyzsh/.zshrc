# =============================================================================
# ZSH Configuration
# =============================================================================
# Apple Silicon: /opt/homebrew | Intel: /usr/local

# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
# eval "$(/usr/local/bin/brew shellenv zsh)"

# -----------------------------------------------------------------------------
# Oh My Zsh Configuration
# -----------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="jvbriones"

# Load zsh-syntax-highlighting (before oh-my-zsh)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

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
# Aliases
# -----------------------------------------------------------------------------
alias npm="pnpm"
alias dc="docker compose"
alias dc-d="docker compose down --remove-orphans"
alias dc-dv="docker compose down --remove-orphans --volumes"
alias dc-u="docker compose up --wait -d"
alias dc-fresh="docker compose pull && docker compose up --build --force-recreate --no-deps --wait -d"

# -----------------------------------------------------------------------------
# NVM (Node Version Manager) - Lazy Loading
# -----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
_NVM_LOADED=false

_load_nvm() {
  if [ "$_NVM_LOADED" = false ]; then
    unset -f nvm node npm npx yarn pnpm 2>/dev/null

    if command -v brew >/dev/null 2>&1; then
      NVM_HOMEBREW_PREFIX="$(brew --prefix nvm 2>/dev/null)"
      [ -s "$NVM_HOMEBREW_PREFIX/nvm.sh" ] && . "$NVM_HOMEBREW_PREFIX/nvm.sh"
      [ -s "$NVM_HOMEBREW_PREFIX/etc/bash_completion.d/nvm" ] && . "$NVM_HOMEBREW_PREFIX/etc/bash_completion.d/nvm"
    fi

    nvm use --silent 2>/dev/null || nvm use default --silent 2>/dev/null || true

    _NVM_LOADED=true
  fi
}

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

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jvbriones/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
