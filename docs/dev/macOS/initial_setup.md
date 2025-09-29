---
sidebar_position: 1
---

# Initial setup

Tweak a recently installed MacOS laptop.

---

### Aspect and initial configuration

- Finder → show status bar, path, sidebar, etc.
- dock → autohide, pinned apps, windows in icons, no recent apps, etc.
- Set Mission control in the bottom right corner to show all open apps
- No Siri
- Increase keyboard keys delay (1 point). Disable automatic spelling corrections and Capitalize in "Text". Mouse scroll direction natural
- Extensions: (enable OneDrive?). In Share Menu, disable Notes and Add to Photos
- Display, turn on Night Shift color
- Widget sidebar with calendar and weather
- Improve dock autohide delay: `> defaults write com.apple.Dock autohide-delay -float 0.0001; killall Dock`
  - to restore it: `> defaults delete com.apple.Dock autohide-delay; killall Dock**`

### Tools and apps

- [Tiles](https://freemacsoft.net/tiles/) to help resizing and placing the windows
- Brew [https://brew.sh](https://brew.sh). Run `> brew doctor` to check if everything was ok
- Xcode command line tools - by running `> xcode-select --install`
- iterm2 - by running `> brew install --cask iterm2`
  - set the profile-windows-transparency 17, text to 14 inch, dracula colors
  - set the profile-Keys-Key Mappings add preset "Natural Text Editing"
  - add custom keybindings:
  
  ``` bash
  Preferences > Profiles > Keys
  ⌥ + ⇧ + ← | Action: Move start of selection back > Move by word
  ⌥ + ⇧ + → | Action: Move end of selection forward > Move by word
  ```

- Install [oh-my-zsh](https://ohmyz.sh/)
  - firstly run `> brew install wget`
  - install jbriones theme 🤘 _(./ohmyzsh/jbriones.zsh-theme)_ and export the `.zshrc` config file
- Install [Visual Studio Code](https://code.visualstudio.com/download)
