#!/bin/bash

# The directory where the Git repository will be cloned
DOTFILES_DIR="$HOME/dotfiles"

# Creating symbolic links
# ln -sf "$DOTFILES_DIR/.alacritty.toml" "$HOME/.config/alacritty/.alacritty.toml"
ln -sf "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.condarc" "$HOME/.condarc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/themes" "$HOME/.config/kitty/themes"
ln -s /Users/kovaxs/dotfiles/nix ~/nix

echo "All dotfiles have been linked."
