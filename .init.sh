cd ~

echo "====================================> Installing dotfiles"
git clone git@github.com:Gonzih/dotfiles.git &> /dev/null
mv ~/dotfiles/* -t ~/ -f &> /dev/null
mv ~/dotfiles/.* -t ~/ -f &> /dev/null
rm ~/dotfiles -rf &> /dev/null

echo "====================================> Installing submodules"
git submodule init &> /dev/null
git submodule update &> /dev/null

echo "====================================> Installing vundle"
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle &> /dev/null

echo "====================================> Running vundle"
vim -c "execute \"BundleInstall!\" | q" &> /dev/null

echo "====================================> Installing oh_my_zsh"
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh &> /dev/null

echo "====================================> Installing rvm"
sh < <(curl -s https://rvm.beginrescueend.com/install/rvm) &> /dev/null

echo "====================================> Launch zsh"
zsh
