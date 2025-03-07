# Configure the bash shell using Xomakub-geo defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/xomakub-geo/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/xomakub-geo/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Xomakub-geo defaults
cp ~/.local/share/xomakub-geo/configs/inputrc ~/.inputrc
