install: install-bash

install-bash:
	rm -f ~/.bashrc ~/.bash_aliases
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/bash_aliases ~/.bash_aliases

