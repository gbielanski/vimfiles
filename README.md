Installation:

    git clone https://github.com/gbielanski/vimfiles.git

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/vimsyntax ~/.vimsyntax

Create submodules

    git submodule init
    git submodule update

Update all bundle plugins

    git submodule foreach git pull origin master
