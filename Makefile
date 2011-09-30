all:
	@echo "# To install everything:"
	@echo "make install"
	@echo "# Individual targets:"
	@echo $(TARGETS)

TARGETS = \
	install-bash \
	install-vim \
	install-x11 \
	install-xmonad \
	install-xmobar \
	install-gtk \
	install-git

install: $(TARGETS)

install-bash:
	rm -f ~/.bashrc ~/.bash_aliases
	ln -s `pwd`/bash/bashrc ~/.bashrc
	ln -s `pwd`/bash/bash_aliases ~/.bash_aliases

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-x11:
	rm -rf ~/.Xresources
	ln -s `pwd`/x11/Xresources ~/.Xresources

install-xmonad:
	rm -rf ~/.xmonad
	mkdir ~/.xmonad
	ln -s `pwd`/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

install-xmobar:
	rm -rf ~/.xmobarrc
	ln -s `pwd`/xmobar/xmobarrc ~/.xmobarrc

install-gtk:
	rm -rf ~/.gtkrc-2.0
	ln -s `pwd`/gtk/gtkrc-2.0 ~/.gtkrc-2.0

install-git:
	rm -rf ~/.gitconfig ~/.gitignore
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitignore ~/.gitignore
