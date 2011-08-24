install: install-bash install-vim

install-bash:
	rm -f ~/.bashrc ~/.bash_aliases
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/bash_aliases ~/.bash_aliases

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

