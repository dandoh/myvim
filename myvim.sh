mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cp .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pair
mkdir -p ~/.vim/colors
cp lucius.vim ~/.vim/colors
