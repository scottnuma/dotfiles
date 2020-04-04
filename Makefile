.PHONY: git
git:
	stow -v --dotfiles git

.PHONY: vim
vim:
	stow -v --dotfiles vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

.PHONY: tmux
tmux:
	stow -v --dotfiles tmux
	tmux source-file ~/.tmux.conf

.PHONY: zsh
zsh:
	stow -v --dotfiles zsh

.PHONY: neovim
neovim:
	git config --global core.editor nvim
	stow -v neovim

.PHONY: vim-update
vim-update:
	stow -v --dotfiles vim
	vim +PluginInstall +qall

.PHONY: key-map
key-map:
	stow -v --dotfiles key-map

.PHONY: redshift
redshift: 
	stow -v redshift

.PHONY: i3
i3:
	stow -v i3
	i3-msg reload

.PHONY: capslock
capslock:
	stow -v --dotfiles capslock
	xmodmap ~/.Xmodmap

.PHONY: polybar
polybar:
	stow -v polybar
