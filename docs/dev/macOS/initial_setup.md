---
sidebar_position: 1
---

# Initial setup

Tweak a recently installed MacOS laptop.

---

### Aspect and initial configuration

- Finder → show status bar, path, sidebar, file extensions.
- dock → autohide, pinned apps, windows in icons, no recent apps, no shortcuts.
- Set Mission control in the bottom right corner to show all open apps
- No Siri
- Increase keyboard keys delay (1 point). Disable automatic spelling corrections and Capitalize in "Text". Mouse scroll direction natural
- Display, turn on Night Shift color
- Widget sidebar with calendar, weather, screen time, etc.
- Improve dock autohide delay: `> defaults write com.apple.Dock autohide-delay -float 0.0001; killall Dock`
  - to restore it: `> defaults delete com.apple.Dock autohide-delay; killall Dock**`
- [Tiles](https://freemacsoft.net/tiles/) to help resizing windows. Disable Hotkeys.

### Dev

Homebrew for system/dev tools.
GitHub CLI + SSH for GitHub auth.
SSH commit signing instead of GPG unless you specifically need GPG.
nvm for Node versions, Corepack for Yarn v4 / pnpm, not global yarn installs.
Per-repo defaults via .nvmrc and packageManager.

- Brew [https://brew.sh](https://brew.sh). Run `> brew doctor` to check if everything was ok
- Xcode command line tools - by running `> xcode-select --install`
- iterm2 - by running `> brew install --cask iterm2`
  - set the profile-windows-transparency 17, text to 14 inch, dracula colors
  - set the profile-Keys-Key Mappings add preset "Natural Text Editing"
  - add custom keybindings:
- Ghostty [https://ghostty.app/](https://ghostty.app/)
  - In settings:
  
    ```json
      theme = Dracula
      background-opacity = 0.9
    ```

- Install [oh-my-zsh](https://ohmyz.sh/)
  - firstly run `> brew install wget`
  - install jvbriones theme 🤘
  - brew install zsh-syntax-highlighting
  - brew install zsh-autosuggestions
- brew install nvm
- nvm install --lts
- nvm use default
- corepack enable
- corepack prepare yarn@stable --activate
- brew install git gh
