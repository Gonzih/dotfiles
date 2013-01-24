cd ~

echo "====================================> Installing dotfiles"
git clone git@github.com:Gonzih/dotfiles.git
mv ~/dotfiles/* -t ~/ -f
mv ~/dotfiles/.* -t ~/ -f
rm ~/dotfiles -rf

echo "====================================> Installing .vim"
git clone git@github.com:Gonzih/.vim.git ~/.vim

echo "====================================> Init vim"
sh ~/.vim/rcinit.sh

echo "====================================> Installing vundle"
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "====================================> Installing rbenv"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo "====================================> Reset .zshrc"
git reset --hard

echo "====================================> Running vundle"
vim -c "execute 'BundleInstall!' | q | q"

echo "====================================> Running zsh"
zsh
