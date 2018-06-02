
git:
	git config --global user.name "scottnuma";
	git config --global user.email scott.numamoto@gmail.com;
	git config --global core.editor vim

tmux:
	ln -sf $(shell pwd)/tmux.tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf

vim:
	ln -sf $(shell pwd)/vim.vimrc ~/.vimrc
	ln -sf $(shell pwd)/ctags.ctags ~/.ctags
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	echo 'source ~/.vimrc' > ~/.ideavimrc

vim-update:
	ln -sf $(shell pwd)/vim.vimrc ~/.vimrc
	vim +PluginInstall +qall

fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
