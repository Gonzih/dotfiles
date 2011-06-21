cd ~

echo "====================================> Installing dotfiles"
git clone git@github.com:Gonzih/dotfiles.git
mv ~/dotfiles/* ~/ -rf
rm ~/dotfiles -rf

echo "====================================> Installing submodules"
git submodule init
git submodule update

echo "====================================> Installing vundle"
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "====================================> Running vundle"
vim -c "execute \"BundleInstall!\" | q"

echo "====================================> Installing oh_my_zsh"
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

echo "====================================> Installing rvm"
sh < <(curl -s https://rvm.beginrescueend.com/install/rvm)

echo "====================================> Launch zsh"
zsh
