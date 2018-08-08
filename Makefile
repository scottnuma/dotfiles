git:
	git config --global user.name scottnuma;
	git config --global user.email scott.numamoto@gmail.com;
	git config --global core.editor vim

tmux:
	ln -sf $(shell pwd)/tmux.tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf

nvim:
	git config --global core.editor nvim
	mkdir -p ~/.config/nvim
	ln -sf $(shell pwd)/vim.vimrc ~/.config/nvim/init.vim

vim:
	ln -sf $(shell pwd)/vim.vimrc ~/.vimrc
	ln -sf $(shell pwd)/ctags.ctags ~/.ctags
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	echo 'source ~/.vimrc' > ~/.ideavimrc

vim-update:
	ln -sf $(shell pwd)/vim.vimrc ~/.vimrc
	ln -sf $(shell pwd)/ctags.ctags ~/.ctags
	vim +PluginInstall +qall

key-map:
	ln -sf $(shell pwd)/key-map.xbindkeysrc ~/.xbindkeysrc

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

oh-my-zsh:
	# Install Oh My Zsh - https://github.com/robbyrussell/oh-my-zsh
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

i3:
	mkdir -p ~/.i3/
	ln -sf $(shell pwd)/i3.config ~/.i3/config
	i3-msg reload

capslock:
	cp $(shell pwd)/xmodmap.txt ~/.Xmodmap
	xmodmap ~/.Xmodmap

# use phony since polybar/ exists
.PHONY: polybar
polybar:
	mkdir -p ~/.config/polybar
	ln -sf $(shell pwd)/polybar/polybar.config ~/.config/polybar/config
	ln -sf $(shell pwd)/polybar/startup_launch.sh ~/.config/polybar/startup_launch.sh
