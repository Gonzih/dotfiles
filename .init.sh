cd ~

git clone git@github.com:Gonzih/dotfiles.git
mv ~/dotfiles/* -t ~/ -f
mv ~/dotfiles/.* -t ~/ -f
rm ~/dotfiles -rf
git reset --hard

git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d

git clone git@github.com:Gonzih/.vim.git ~/.vim

git clone git@github.com:Gonzih/.mc.git ~/.config/mc
git clone git@github.com:Gonzih/.fish.git ~/.config/fish
git clone git@github.com:Gonzih/.xmonad.git ~/.xmonad
git clone git@github.com:Gonzih/.mutt.git ~/.mutt

sh ~/.vim/init.sh
sh ~/.mutt/init.sh

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

cd ~/.vim/bundle/vimproc.vim && make && cd
vim +NeoBundleInstall +qall

fish
