# New machine setup script
# Clone and use my dofiles

sudo apt install -y ssh vim tmux

if [ -d "dotfile" ]; then
    cd dotfile
fi

if [ `pwd` == "/home/$USER/dotfile" ]; then
    cp .bashrc ~
    cp .gitconfig ~
    cp .vimrc ~
    cp .tmux.conf ~
    . ~/.bashrc
    echo -e "\e[32mDone!"
    exit 0
else
    echo -e "\e[31mError!"
    echo -e "\e[0mPlease change directory to \`dotfile\` or its parent directory."
    exit 1
fi
