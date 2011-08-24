install: install-bash install-vim install-xmonad install-xmobar

install-bash:
	rm -f ~/.bashrc ~/.bash_aliases
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/bash_aliases ~/.bash_aliases

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-xmonad:
	rm -rf ~/.xmonad
	mkdir ~/.xmonad
	ln -s `pwd`/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

install-xmobar:
	rm -rf ~/.xmobarrc
	ln -s `pwd`/xmobar/xmobarrc ~/.xmobarrc

