cd ~

echo "====================================> Installing dotfiles"
git clone git@github.com:Gonzih/dotfiles.git
mv ~/dotfiles/* -t ~/ -f
mv ~/dotfiles/.* -t ~/ -f
rm ~/dotfiles -rf

echo "====================================> Installing submodules"
git submodule init
git submodule update

echo "====================================> Init vim"
sh ~/.vim/rcinit.sh

echo "====================================> Installing vundle"
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "====================================> Installing oh_my_zsh"
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

echo "====================================> Installing rvm"
curl -L https://get.rvm.io | bash -s stable

echo "====================================> Reset .zshrc"
git reset --hard

echo "====================================> Running vundle"
vim -c "execute 'BundleInstall!' | q | q"

echo "====================================> Running zsh"
zsh
